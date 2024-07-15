import 'package:flutter/material.dart';
import 'package:jobs_bd/core/static/svg_path.dart';
import 'package:jobs_bd/presentation/common/privacy_policy.dart';

class MiniSettingsDrawer extends StatelessWidget {
  final ThemeData theme;

  const MiniSettingsDrawer({required this.theme, super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: theme.primaryColor,
            ),
            child: Center(
              child: Image.asset(SvgPath.imgAppLogo),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.privacy_tip),
            title: const Text('Privacy Policy'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const PrivacyPolicyPage()),
              );
            },
          ),
          // ListTile(
          //   leading: const Icon(Icons.info),
          //   title: const Text('About Us'),
          //   onTap: () {
          //     Navigator.pop(context);
          //   },
          // ),
        ],
      ),
    );
  }
}
