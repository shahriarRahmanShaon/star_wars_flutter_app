import 'package:flutter/material.dart';
import 'package:star_wars_demo/base/views/base_view.dart';
import 'package:star_wars_demo/data/constants/app_constants.dart';
import 'package:star_wars_demo/screens/about/view_model/about_view_model.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<AboutViewModel>(
      vmBuilder: (context) => AboutViewModel(),
      builder: _buildScreen,
    );
  }

  Widget _buildScreen(BuildContext context, AboutViewModel viewModel) {
    return Scaffold(
      appBar: AppBar(title: Text("About")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppConstants.appName,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              AppConstants.appDescription,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.info_outline, color: Colors.blue),
              title: Text("Version: ${viewModel.appVersion}"),
            ),
            ListTile(
              leading: Icon(Icons.email, color: Colors.green),
              title: Text("Contact: ${viewModel.contactEmail}"),
            ),
            ListTile(
              leading: Icon(Icons.public, color: Colors.orange),
              title: Text("Website: ${viewModel.website}"),
            ),
          ],
        ),
      ),
    );
  }
}
