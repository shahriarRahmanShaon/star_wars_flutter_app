import 'dart:convert';

import 'package:star_wars_demo/base/services/base_service.dart';
import 'package:star_wars_demo/models/responses/character_card_response.dart';

abstract class CharacterRemoteDataSource {
  Future<CharacterCardResponse> fetchCharacters({String? nextPageUrl, String searchQuery = ""});
}


