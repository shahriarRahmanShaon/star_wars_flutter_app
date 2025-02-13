import 'package:star_wars_demo/data/data_sources/remote/character_remote_data_source.dart';
import 'package:star_wars_demo/data/repositories/character_repository.dart';
import 'package:star_wars_demo/models/responses/character_card_response.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final CharacterRemoteDataSource remoteDataSource;

  CharacterRepositoryImpl({required this.remoteDataSource});

  @override
  Future<CharacterCardResponse> getCharacters({String? nextPageUrl, String searchQuery = ""}) async {
    return await remoteDataSource.fetchCharacters(nextPageUrl: nextPageUrl, searchQuery: searchQuery);
  }
}