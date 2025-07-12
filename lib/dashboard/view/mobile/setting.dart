import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:interview/app/route_name.dart';
import 'package:interview/dashboard/view/widgets/bottom_navigation.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      backgroundColor: const Color(0xFFF9F9FC),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        tooltip: 'Main Action',
        onPressed: () {},
        child: const Icon(Icons.add, color: Colors.white, size: 30),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 6.0,
        child: Padding(padding: const EdgeInsets.all(8.0), child: BottomNavBarWidget()),
      ),

      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 120),
          children: [
            buildSection("Account", [
              settingsTile(Icons.person_outline, "Profile", onTap: () {}),
              settingsTile(Icons.info_outline, "Account information", onTap: () {}),
              settingsTile(Icons.verified_user_outlined, "KYC", subtitle: "Not verified", onTap: () {}),
              settingsTile(Icons.history, "History", onTap: () {}),
            ]),

            buildSection("Preferences", [
              settingsTile(Icons.color_lens_outlined, "Color Preference", onTap: () {}),
              settingsTile(Icons.stacked_bar_chart, "Style Settings", onTap: () {}),
              settingsTile(Icons.public, "UTC Time Zone", onTap: () {}),
            ]),

            buildSection("Security", [
              settingsTile(
                Icons.verified_user,
                "2FA Verification",
                onTap: () {
                  context.goNamed(RouteNames.verfication);
                },
              ),
              settingsTile(Icons.privacy_tip_outlined, "Privacy Policy", onTap: () {}),
            ]),

            buildSection("General", [
              ListTile(
                leading: const Icon(Icons.dark_mode_outlined),
                title: const Text("Dark Mode"),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(isDarkMode ? "Dark" : "Light"),
                    Switch(
                      value: isDarkMode,
                      onChanged: (val) {
                        setState(() {
                          isDarkMode = val;
                        });
                      },
                    ),
                  ],
                ),
              ),
              settingsTile(Icons.support_agent, "Support", onTap: () {}),
              settingsTile(Icons.question_answer_outlined, "FAQ", onTap: () {}),
              settingsTile(Icons.help_outline, "Help", onTap: () {}),
              settingsTile(Icons.redeem_outlined, "Referral", onTap: () {}),
              settingsTile(
                Icons.logout,
                "Log out",
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text("Log out"),
                      content: const Text("Are you sure you want to log out?"),
                      actions: [
                        TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
                        ElevatedButton(
                          onPressed: () {
                            context.goNamed(RouteNames.home);
                          },
                          child: const Text("Log out"),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ]),
          ],
        ),
      ),
    );
  }

  Widget buildSection(String title, List<Widget> tiles) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 1,
          margin: EdgeInsets.zero,
          child: Column(children: tiles),
        ),
      ],
    );
  }

  Widget settingsTile(IconData icon, String title, {String? subtitle, VoidCallback? onTap}) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle, style: const TextStyle(color: Colors.red, fontSize: 12)) : null,
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
