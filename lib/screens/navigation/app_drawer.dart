import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:star_wars_demo/data/constants/app_constants.dart';
import 'package:star_wars_demo/screens/navigation/app_route.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.horizontal(right: Radius.circular(20))),
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              color: Color(0xFFA9B5DF),
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            accountName: Text(
              AppConstants.drawerAccountName,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            accountEmail: Text(
              AppConstants.drawerAccountEmail,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  color: Colors.black),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(AppConstants.drawerProfileImage),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildDrawerItem(
                  icon: Icons.home,
                  title: AppConstants.drawerHome,
                  context: context,
                  route: AppRoute.home.path,
                ),
                _buildDrawerItem(
                  icon: Icons.info,
                  title: AppConstants.drawerAbout,
                  context: context,
                  route: AppRoute.about.path,
                ),
                _buildDrawerItem(
                  icon: Icons.settings,
                  title: AppConstants.drawerSettings,
                  context: context,
                  route: AppRoute.settings.path,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(
      {required IconData icon,
      required String title,
      required BuildContext context,
      required String route}) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue.shade600),
      title: Text(title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
      trailing:
          const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: () {
        Navigator.pop(context);
        context.push(route);
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      hoverColor: Colors.blue.shade100,
    );
  }
}
