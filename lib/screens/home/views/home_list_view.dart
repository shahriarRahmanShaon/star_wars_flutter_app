import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:star_wars_demo/data/data_sources/remote/character_remote_data_source_impl.dart';
import 'package:star_wars_demo/data/repositories/character_repository_impl.dart';
import 'package:star_wars_demo/screens/home/view_model/home_view_model.dart';
import 'package:star_wars_demo/screens/home/widgets/character_card.dart';


class HomeListView extends StatelessWidget {
  const HomeListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeViewModel(
        repository: CharacterRepositoryImpl(
          remoteDataSource: CharacterRemoteDataSourceImpl(),
        ),
      )..fetchCharacters(),
      child: Consumer<HomeViewModel>(
        builder: (context, viewModel, child) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search Characters...",
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  onSubmitted: (query) => viewModel.fetchCharacters(searchQuery: query),
                ),
              ),
              Expanded(
                child: viewModel.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : viewModel.characterData == null || viewModel.characterData!.results.isEmpty
                    ? const Center(child: Text("No Characters Found"))
                    : ListView.builder(
                  itemCount: viewModel.characterData!.results.length,
                  itemBuilder: (context, index) {
                    return CharacterCard(person: viewModel.characterData!.results[index]);
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (viewModel.prevPageUrl != null)
                    ElevatedButton(
                      onPressed: viewModel.loadPreviousPage,
                      child: const Text("Previous"),
                    ),
                  if (viewModel.nextPageUrl != null)
                    ElevatedButton(
                      onPressed: viewModel.loadNextPage,
                      child: const Text("Next"),
                    ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
