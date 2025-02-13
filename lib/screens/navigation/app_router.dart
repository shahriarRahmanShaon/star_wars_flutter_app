import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:star_wars_demo/models/responses/character_card_response.dart';
import 'package:star_wars_demo/screens/details/screens/character_details_view.dart';
import 'package:star_wars_demo/screens/home/views/home_list_view.dart';
import 'package:star_wars_demo/screens/about/views/about_view.dart';
import 'package:star_wars_demo/screens/navigation/app_route.dart';
import 'package:star_wars_demo/screens/settings/views/settings_view.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: AppRoute.home.path,
      builder: (context, state) => HomeListView(),
    ),
    GoRoute(
      path: AppRoute.about.path,
      builder: (context, state) => const AboutView(),
    ),
    GoRoute(
      path: AppRoute.settings.path,
      builder: (context, state) => const SettingsView(),
    ),
    GoRoute(
      path: AppRoute.characterDetail.path,
      builder: (context, state) {
        final person = state.extra as Person;
        return CharacterDetailView(person: person);
      },
    ),
  ],
);
