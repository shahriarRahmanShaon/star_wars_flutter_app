import 'package:flutter/material.dart';
import 'package:star_wars_demo/base/views/base_view.dart';
import 'package:star_wars_demo/data/constants/app_constants.dart';
import 'package:star_wars_demo/screens/settings/view_models/settings_view_model.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<SettingsViewModel>(
      vmBuilder: (context) {
        final vm = SettingsViewModel();
        vm.initProvider(context);
        return vm;
      },
      builder: _buildScreen,
    );
  }

  Widget _buildScreen(BuildContext context, SettingsViewModel viewModel) {
    return Scaffold(
      appBar: AppBar(title: Text(AppConstants.settingsTitle)),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          SwitchListTile(
            title: Text(AppConstants.darkModeLabel),
            secondary: const Icon(Icons.dark_mode),
            value: viewModel.darkMode,
            onChanged: viewModel.toggleDarkMode,
          ),
          SwitchListTile(
            title: Text(AppConstants.notificationsLabel),
            secondary: const Icon(Icons.notifications),
            value: viewModel.notificationsEnabled,
            onChanged: viewModel.toggleNotifications,
          ),
          ListTile(
            leading: const Icon(Icons.lock),
            title: Text(AppConstants.privacyPolicyLabel),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.help_outline),
            title: Text(AppConstants.helpSupportLabel),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
