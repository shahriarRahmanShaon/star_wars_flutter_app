import 'package:flutter/material.dart';
import 'screens/navigation/app_router.dart';

void main() => runApp(StarWarsApp());

class StarWarsApp extends StatelessWidget {
  const StarWarsApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: "Star Wars Demo",
        theme: ThemeData(primarySwatch: Colors.blue),
        routerConfig: appRouter,
      );
}
