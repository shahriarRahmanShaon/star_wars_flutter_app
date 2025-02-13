import 'package:flutter/material.dart';
import 'package:star_wars_demo/base/views/base_view.dart';
import 'package:star_wars_demo/data/constants/app_constants.dart';
import 'package:star_wars_demo/screens/home/view_model/home_view_model.dart';
import 'package:star_wars_demo/screens/home/widgets/character_card.dart';
import 'package:star_wars_demo/screens/navigation/app_drawer.dart';
import 'package:star_wars_demo/data/repositories/character_repository_impl.dart';
import 'package:star_wars_demo/data/data_sources/remote/character_remote_data_source_impl.dart';

class HomeListView extends StatelessWidget {
  const HomeListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      vmBuilder: (context) => HomeViewModel(
        repository: CharacterRepositoryImpl(
          remoteDataSource: CharacterRemoteDataSourceImpl(),
        ),
      ),
      builder: _buildScreen,
    );
  }

  Widget _buildScreen(BuildContext context, HomeViewModel viewModel) {
    return Scaffold(
      appBar: AppBar(
        title: _buildSearchBar(viewModel),
      ),
      drawer: const AppDrawer(),
      body: Column(
        children: [
          Expanded(
            child: viewModel.errorMessage != null
                ? Center(child: Text(viewModel.errorMessage!))
                : _buildCharacterGrid(viewModel),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar(HomeViewModel viewModel) {
    return SizedBox(
      height: 40,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: viewModel.textEditingController,
              decoration: InputDecoration(
                hintText: AppConstants.searchHint,
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              ),
              onChanged: (text) {
                viewModel.onSearchTextChanged(text);
              },
            ),
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              viewModel.performSearch();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCharacterGrid(HomeViewModel viewModel) {
    return NotificationListener<ScrollNotification>(
      onNotification: (scrollInfo) {
        if (scrollInfo.metrics.pixels >=
            scrollInfo.metrics.maxScrollExtent - 200) {
          viewModel.fetchMoreCharacters();
        }
        return false;
      },
      child: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.8,
        ),
        itemCount: viewModel.count + (viewModel.isFetchingMore ? 1 : 0),
        itemBuilder: (context, index) {
          if (index == viewModel.count) {
            return const Center(child: CircularProgressIndicator());
          }
          return CharacterCard(person: viewModel.getItem(index));
        },
      ),
    );
  }
}
