import 'package:flutter/material.dart';
import 'package:star_wars_demo/base/views/base_view.dart';
import 'package:star_wars_demo/data/constants/app_constants.dart';
import 'package:star_wars_demo/data/data_sources/remote/character_remote_data_source_impl.dart';
import 'package:star_wars_demo/models/responses/character_card_response.dart';
import 'package:star_wars_demo/data/repositories/character_repository_impl.dart';
import 'package:star_wars_demo/models/responses/film_response.dart';
import 'package:star_wars_demo/screens/details/view_model/character_details_view_model.dart';

class CharacterDetailView extends StatelessWidget {
  final Person person;

  const CharacterDetailView({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    return BaseView<CharacterDetailsViewModel>(
      vmBuilder: (context) => CharacterDetailsViewModel(
        repository: CharacterRepositoryImpl(
            remoteDataSource: CharacterRemoteDataSourceImpl()),
        character: person,
      ),
      builder: _buildScreen,
    );
  }

  Widget _buildScreen(
      BuildContext context, CharacterDetailsViewModel viewModel) {
    return Scaffold(
      appBar: AppBar(
        title: Text(person.name),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileInfo(),
            const SizedBox(height: 20),
            _buildHomeworldSection(viewModel),
            const SizedBox(height: 20),
            _buildFilmsSection(viewModel),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(AppConstants.characterDetailsTitle,
            style: const TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blue)),
        const SizedBox(height: 10),
        _buildDetailRow(AppConstants.nameLabel, person.name),
        _buildDetailRow(AppConstants.heightLabel, person.height),
        _buildDetailRow(AppConstants.massLabel, person.mass),
        _buildDetailRow(AppConstants.birthYearLabel, person.birthYear),
        _buildDetailRow(AppConstants.genderLabel, person.gender),
      ],
    );
  }

  Widget _buildHomeworldSection(CharacterDetailsViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(AppConstants.homeworldTitle,
            style: const TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blue)),
        const SizedBox(height: 10),
        viewModel.isLoading || viewModel.homeworld == null
            ? const Center(child: CircularProgressIndicator())
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDetailRow(
                      AppConstants.nameLabel, viewModel.homeworld!.name),
                  _buildDetailRow(
                      AppConstants.terrainLabel, viewModel.homeworld!.terrain),
                  _buildDetailRow(
                      AppConstants.climateLabel, viewModel.homeworld!.climate),
                  _buildDetailRow(AppConstants.populationLabel,
                      viewModel.homeworld!.population),
                ],
              ),
      ],
    );
  }

  Widget _buildFilmsSection(CharacterDetailsViewModel viewModel) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Center(
          child: Text(
            AppConstants.filmsTitle,
            style: const TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blue),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 10),
        viewModel.isLoading
            ? const Center(child: CircularProgressIndicator())
            : viewModel.films.isEmpty
                ? Center(
                    child: Text(AppConstants.noFilmsAvailable,
                        style: const TextStyle(fontSize: 16)))
                : SizedBox(
                    height: 200,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: viewModel.films
                            .map((film) => _buildFilmCard(film))
                            .toList(),
                      ),
                    ),
                  ),
      ],
    );
  }

  Widget _buildFilmCard(Film film) {
    return Container(
      width: 180,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                film.title,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              Text("${AppConstants.directorLabel}: ${film.director}",
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w500),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis),
              Text("${AppConstants.releaseDateLabel}: ${film.releaseDate}",
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w400)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$label: ",
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}
