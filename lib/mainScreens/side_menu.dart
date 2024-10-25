import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text("Frank Smith"),
            accountEmail: null,
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://example.com/user_photo.jpg"), // replace with actual image link
            ),
            decoration: BoxDecoration(
              color: Colors.deepPurple, // Background color for header
            ),
          ),
          _createDrawerItem(icon: Icons.account_circle, text: 'Account'),
          _createDrawerItem(icon: Icons.people, text: 'Invite Friends'),
          _createDrawerItem(icon: Icons.favorite, text: 'Favourites'),
          _createDrawerItem(icon: Icons.question_answer, text: 'FAQ'),
          _createDrawerItem(icon: Icons.warning, text: 'SOS'),
          _createDrawerItem(
              icon: Icons.report_problem, text: 'Make Complaints'),
          _createDrawerItem(icon: Icons.notifications, text: 'Notification'),
          _createDrawerItem(icon: Icons.info, text: 'About'),
          _createDrawerItem(icon: Icons.privacy_tip, text: 'Privacy Policy'),
          _createDrawerItem(icon: Icons.description, text: 'Terms & Condition'),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Logout'),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  ListTile _createDrawerItem({IconData? icon, String? text}) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text ?? ""),
      onTap: () {
        // Handle onTap actions here
      },
    );
  }
}
