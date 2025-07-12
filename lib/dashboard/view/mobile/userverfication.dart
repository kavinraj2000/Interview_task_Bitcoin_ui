import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:interview/app/route_name.dart';
import 'package:interview/dashboard/view/widgets/otpverfication.dart';

class UserVerificationScreen extends StatelessWidget {
  const UserVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Text('User Verification', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            const Text(
              'We have send you a verification link to your email.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Did not receive the code? "),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    "Resend",
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurple),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'It is recommended to have Two-Factor Authentication enabled.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  showDialog(context: context, barrierDismissible: false, builder: (_) => const Otpverfication());
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.deepPurple),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                ),
                child: const Text(
                  'Setup Two-Factor Authentication',
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurple),
                ),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                context.goNamed(RouteNames.setting);
              },
              child: const Text("Skip for now", style: TextStyle(fontSize: 14)),
            ),
          ],
        ),
      ),
    );
  }
}
