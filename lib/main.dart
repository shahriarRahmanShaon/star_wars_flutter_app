import 'package:flutter/material.dart';
import 'package:star_wars_demo/screens/home/views/home_list_view.dart';
import 'package:star_wars_demo/screens/navigation/app_drawer.dart';

void main() {
  runApp(const StarWarsApp());
}

class StarWarsApp extends StatelessWidget {
  const StarWarsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Star Wars Demo",
      home: Scaffold(
        appBar: AppBar(title: const Text("Star Wars Characters")),
        drawer: const AppDrawer(),
        body: const HomeListView(),
      ),
      routes: {
        "/about": (context) => const Text('data'),
        "/settings": (context) => const Text(' tetet'),
      },
    );
  }
}
