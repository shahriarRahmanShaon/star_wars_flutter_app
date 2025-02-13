

import 'package:flutter/material.dart';
import 'package:star_wars_demo/data/repositories/character_repository.dart';
import 'package:star_wars_demo/models/responses/character_card_response.dart';

class HomeViewModel extends ChangeNotifier {
  final CharacterRepository _repository;

  HomeViewModel({required CharacterRepository repository}) : _repository = repository;

  CharacterCardResponse? _characterData;
  bool _isLoading = false;
  String? _nextPageUrl;
  String? _prevPageUrl;

  CharacterCardResponse? get characterData => _characterData;
  bool get isLoading => _isLoading;
  String? get nextPageUrl => _nextPageUrl;
  String? get prevPageUrl => _prevPageUrl;

  void fetchCharacters({String searchQuery = "", String nextPageUrl = ""}) async {
    _isLoading = true;
    notifyListeners();

    try {
      final data = await _repository.getCharacters(searchQuery: searchQuery);
      _characterData = data;
      _nextPageUrl = data.next;
      _prevPageUrl = data.previous;
    } catch (e) {
      debugPrint("Error fetching characters: $e");
    }

    _isLoading = false;
    notifyListeners();
  }

  void loadNextPage() {
    if (_nextPageUrl != null) fetchCharacters(searchQuery: "", nextPageUrl: _nextPageUrl!);
  }

  void loadPreviousPage() {
    if (_prevPageUrl != null) fetchCharacters(searchQuery: "", nextPageUrl: _prevPageUrl!);
  }
}
