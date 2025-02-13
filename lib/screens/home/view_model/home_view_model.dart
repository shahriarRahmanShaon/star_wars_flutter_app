import 'dart:async';
import 'package:flutter/material.dart';
import 'package:star_wars_demo/base/view_models/base_view_model.dart';
import 'package:star_wars_demo/data/constants/app_constants.dart';
import 'package:star_wars_demo/data/repositories/character_repository.dart';
import 'package:star_wars_demo/models/responses/character_card_response.dart';

class HomeViewModel extends BaseViewModel {
  final CharacterRepository _repository;
  Timer? _debounce;

  HomeViewModel({required CharacterRepository repository})
      : _repository = repository;

  TextEditingController textEditingController = TextEditingController();
  List<Person> _characters = [];
  List<Person> _filteredCharacters = [];
  bool _isFetchingMore = false;

  bool get isFetchingMore => _isFetchingMore;
  String? _nextPageUrl;
  String? errorMessage;

  @override
  FutureOr<void> init() async => await fetchCharacters();

  Future<void> fetchCharacters({String searchQuery = ""}) async {
    changeStatus();
    _characters.clear();
    _filteredCharacters.clear();

    try {
      final data = await _repository.getCharacters(searchQuery: searchQuery);
      _characters = data.results;
      _filteredCharacters = _characters;
      _nextPageUrl = data.next;
    } catch (e) {
      errorMessage = "${AppConstants.errorFetchingCharacters} $e";
      debugPrint(errorMessage);
    }

    changeStatus();
  }

  Future<void> fetchMoreCharacters() async {
    if (_isFetchingMore || _nextPageUrl == null) return;
    _isFetchingMore = true;
    reloadState();

    try {
      final data = await _repository.getCharacters(nextPageUrl: _nextPageUrl);
      _characters.addAll(data.results);
      _filteredCharacters = _characters;
      _nextPageUrl = data.next;
    } catch (e) {
      errorMessage = "${AppConstants.errorFetchingMoreCharacters} $e";
      debugPrint(errorMessage);
    }

    _isFetchingMore = false;
    reloadState();
  }

  void onSearchTextChanged(String text) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(seconds: 2), () {
      fetchCharacters(searchQuery: text);
    });
  }

  void performSearch() {
    fetchCharacters(searchQuery: textEditingController.text);
  }

  Person getItem(int index) => _filteredCharacters[index];

  int get count => _filteredCharacters.length;
}
