import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:star_wars_demo/base/theme/theme_provider.dart';
import 'package:star_wars_demo/base/view_models/base_view_model.dart';

class SettingsViewModel extends BaseViewModel {
  late ThemeProvider _themeProvider;
  bool _notificationsEnabled = true;

  void initProvider(BuildContext context) {
    _themeProvider = Provider.of<ThemeProvider>(context, listen: false);
  }

  bool get darkMode => _themeProvider.themeMode == ThemeMode.dark;

  bool get notificationsEnabled => _notificationsEnabled;

  void toggleDarkMode(bool value) {
    _themeProvider.toggleTheme(value);
    reloadState();
  }

  void toggleNotifications(bool value) {
    _notificationsEnabled = value;
    reloadState();
  }

  @override
  FutureOr<void> init() async {}
}
