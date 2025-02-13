import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:star_wars_demo/base/services/base_service.dart';
import 'package:star_wars_demo/data/data_sources/remote/character_remote_data_source.dart';
import 'package:star_wars_demo/models/responses/character_card_response.dart';
import 'package:star_wars_demo/models/responses/film_response.dart';
import 'package:star_wars_demo/models/responses/homeworld_response.dart';

class CharacterRemoteDataSourceImpl implements CharacterRemoteDataSource {
  final BaseService _baseService = BaseService();

  @override
  Future<CharacterCardResponse> fetchCharacters({String? nextPageUrl, String searchQuery = ""}) async {
    String endpoint = nextPageUrl != null
        ? nextPageUrl.replaceFirst("https://swapi.dev/api/", "")
        : "people/?search=$searchQuery";


    var response = await _baseService.getRequest(endpoint);

    if (response.isSuccess) {
      return CharacterCardResponse.fromJson(json.decode(response.data));
    } else {
      throw Exception(response.errorMessage);
    }
  }

  @override
  Future<List<Film>> fetchFilms(List<String> filmUrls) async {
    if (filmUrls.isEmpty) return [];

    try {
      List<Future<Film>> requests = filmUrls.map((url) async {
        var response = await _baseService.getRequest(url.replaceFirst("https://swapi.dev/api/", ""));
        if (response.isSuccess) {
          var data = json.decode(response.data);
          return Film.fromJson(data);
        } else {
          throw Exception("Failed to fetch film: $url");
        }
      }).toList();

      return await Future.wait(requests);
    } catch (e) {
      debugPrint("Error fetching films: $e");
      return [];
    }
  }


  @override
  Future<Homeworld> fetchHomeworld(String homeworldUrl) async {
    var response = await _baseService.getRequest(homeworldUrl.replaceFirst("https://swapi.dev/api/", ""));
    if (response.isSuccess) {
      var data = json.decode(response.data);
      return Homeworld.fromJson(data);
    }
    throw Exception("Failed to fetch homeworld");
  }
}
