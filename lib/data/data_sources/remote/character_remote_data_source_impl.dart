import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:star_wars_demo/base/services/base_service.dart';
import 'package:star_wars_demo/data/data_sources/remote/character_remote_data_source.dart';
import 'package:star_wars_demo/models/responses/character_card_response.dart';

class CharacterRemoteDataSourceImpl implements CharacterRemoteDataSource {
  final BaseService _baseService = BaseService();

  @override
  Future<CharacterCardResponse> fetchCharacters({String? nextPageUrl, String searchQuery = ""}) async {
    String endpoint;

    if (nextPageUrl != null) {
      endpoint = nextPageUrl.replaceFirst("https://swapi.dev/api/", "");
    } else {
      endpoint = "people/?search=$searchQuery";
    }

    debugPrint("Fetching data from: $endpoint");

    var response = await _baseService.getRequest(endpoint);

    if (response.isSuccess) {
      return CharacterCardResponse.fromJson(json.decode(response.data));
    } else {
      throw Exception(response.errorMessage);
    }
  }




}