import 'package:star_wars_demo/models/responses/character_card_response.dart';
import 'package:star_wars_demo/models/responses/film_response.dart';
import 'package:star_wars_demo/models/responses/homeworld_response.dart';

abstract class CharacterRemoteDataSource {
  Future<CharacterCardResponse> fetchCharacters({String? nextPageUrl, String searchQuery = ""});
  Future<List<Film>> fetchFilms(List<String> filmUrls);
  Future<Homeworld> fetchHomeworld(String homeworldUrl);
}




