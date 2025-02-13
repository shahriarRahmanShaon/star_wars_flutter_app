import 'package:flutter/material.dart';
import 'package:star_wars_demo/base/views/base_view.dart';
import 'package:star_wars_demo/screens/home/view_model/home_view_model.dart';
import 'package:star_wars_demo/screens/home/views/home_list_view.dart';
import 'package:star_wars_demo/screens/navigation/app_drawer.dart';
import 'package:star_wars_demo/data/data_sources/remote/character_remote_data_source_impl.dart';
import 'package:star_wars_demo/data/repositories/character_repository_impl.dart';

void main() => runApp(StarWarsApp());

class StarWarsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Star Wars Demo",
    theme: ThemeData(primarySwatch: Colors.blue),
    home: HomeListView(),
    routes: {
      "/about": (context) => const Text('About Page'),
      "/settings": (context) => const Text('Settings Page'),
    },
  );
}
