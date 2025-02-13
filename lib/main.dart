import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:star_wars_demo/base/theme/theme_provider.dart';
import 'package:star_wars_demo/screens/navigation/app_router.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const StarWarsApp(),
    ),
  );
}

class StarWarsApp extends StatelessWidget {
  const StarWarsApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: "Star Wars Demo",
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: themeProvider.themeMode, // Dynamic theme mode
      routerConfig: appRouter,
    );
  }
}
