import 'package:star_wars_demo/models/responses/character_card_response.dart';

abstract class CharacterRepository {
  Future<CharacterCardResponse> getCharacters({String? nextPageUrl, String searchQuery = ""});
}

