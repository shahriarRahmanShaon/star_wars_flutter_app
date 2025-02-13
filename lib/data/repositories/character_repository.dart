import 'package:star_wars_demo/models/responses/character_card_response.dart';
import 'package:star_wars_demo/models/responses/film_response.dart';
import 'package:star_wars_demo/models/responses/homeworld_response.dart';



abstract class CharacterRepository {
  Future<CharacterCardResponse> getCharacters({String? nextPageUrl, String searchQuery = ""});
  Future<List<Film>> getFilms(List<String> filmUrls);
  Future<Homeworld> getHomeworld(String homeworldUrl);
}


