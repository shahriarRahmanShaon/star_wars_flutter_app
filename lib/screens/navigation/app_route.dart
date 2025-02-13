enum AppRoute {
  home,
  about,
  settings,
  characterDetail;

  String get path {
    switch (this) {
      case AppRoute.home:
        return '/';
      case AppRoute.about:
        return '/about';
      case AppRoute.settings:
        return '/settings';
      case AppRoute.characterDetail:
        return '/characterDetail';
    }
  }
}
