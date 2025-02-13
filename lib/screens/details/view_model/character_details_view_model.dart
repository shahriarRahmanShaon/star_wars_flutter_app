import 'dart:async';
import 'package:star_wars_demo/base/view_models/base_view_model.dart';
import 'package:star_wars_demo/data/constants/app_constants.dart';
import 'package:star_wars_demo/data/repositories/character_repository.dart';
import 'package:star_wars_demo/models/responses/character_card_response.dart';
import 'package:star_wars_demo/models/responses/film_response.dart';
import 'package:star_wars_demo/models/responses/homeworld_response.dart';

class CharacterDetailsViewModel extends BaseViewModel {
  final CharacterRepository _repository;
  final Person character;

  CharacterDetailsViewModel(
      {required CharacterRepository repository, required this.character})
      : _repository = repository;

  List<Film> _films = [];
  Homeworld? _homeworld;
  String? errorMessage;

  List<Film> get films => _films;

  Homeworld? get homeworld => _homeworld;

  @override
  FutureOr<void> init() async {
    await _fetchCharacterDetails();
  }

  Future<void> _fetchCharacterDetails() async {
    changeStatus();
    try {
      _films = await _repository.getFilms(character.films);
      _homeworld = await _repository.getHomeworld(character.homeworld);
    } catch (e) {
      errorMessage = "${AppConstants.errorFetchingCharacters} $e";
    }
    changeStatus();
  }
}
