import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:interview/app/route_name.dart';
import 'package:interview/dashboard/view/widgets/bottom_navigation.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => context.goNamed(RouteNames.home),
        ),
      ),
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
        child: BottomNavBarWidget(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildItem(
              title: 'Username',
              subtitle: 'Set a customized username for your profile.',
              trailing: _editButton(context),
            ),
            const SizedBox(height: 24),
            _buildItem(
              title: 'Avatar',
              subtitle: 'Select an avatar to personalize your account.',
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(radius: 18, child: Image.asset('assets/images/icon.png', fit: BoxFit.fill)),
                  const SizedBox(width: 10),
                  _editButton(context),
                ],
              ),
            ),
            const SizedBox(height: 24),
            _buildItem(
              title: 'Email',
              subtitle: 'Edit your email address for your profile.',
              trailing: _editButton(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItem({required String title, required String subtitle, required Widget trailing}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 4),
              Text(subtitle, style: TextStyle(color: Colors.grey.shade700, fontSize: 13)),
            ],
          ),
        ),
        trailing,
      ],
    );
  }

  Widget _editButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepPurple,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      ),
      onPressed: () {
        context.goNamed(RouteNames.setting);
      },
      child: const Text('Change / edit', style: TextStyle(fontSize: 12, color: Colors.white)),
    );
  }
}
