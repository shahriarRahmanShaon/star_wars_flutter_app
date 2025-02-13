import 'dart:async';
import 'package:star_wars_demo/base/view_models/base_view_model.dart';

class SettingsViewModel extends BaseViewModel {
  bool _darkMode = false;
  bool _notificationsEnabled = true;

  bool get darkMode => _darkMode;

  bool get notificationsEnabled => _notificationsEnabled;

  void toggleDarkMode(bool value) {
    _darkMode = value;
    reloadState();
  }

  void toggleNotifications(bool value) {
    _notificationsEnabled = value;
    reloadState();
  }

  @override
  FutureOr<void> init() async {}
}
