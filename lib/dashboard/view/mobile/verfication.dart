import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:interview/app/route_name.dart';

class TwoFactorScreen extends StatefulWidget {
  const TwoFactorScreen({Key? key}) : super(key: key);

  @override
  State<TwoFactorScreen> createState() => _TwoFactorScreenState();
}

class _TwoFactorScreenState extends State<TwoFactorScreen> {
  String selectedMethod = 'email';

  void onContinue() {
    if (selectedMethod == 'email') {
      context.goNamed(RouteNames.otp);
    } else if (selectedMethod == 'google') {
      context.goNamed(RouteNames.otp);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: const BackButton(), elevation: 0, backgroundColor: Colors.transparent),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Two-Factor', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text(
              'Choose your type of authentication method',
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
            const SizedBox(height: 24),

            GestureDetector(
              onTap: () => setState(() => selectedMethod = 'email'),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: selectedMethod == 'email' ? Colors.black : Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Checkbox(
                      value: selectedMethod == 'email',
                      onChanged: (_) => setState(() => selectedMethod = 'email'),
                    ),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Email', style: TextStyle(fontWeight: FontWeight.w600)),
                          Text('Get a code send to your email', style: TextStyle(color: Colors.black54)),
                        ],
                      ),
                    ),
                    const Icon(Icons.email_outlined),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            GestureDetector(
              onTap: () => setState(() => selectedMethod = 'google'),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: selectedMethod == 'google' ? Colors.black : Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Checkbox(
                      value: selectedMethod == 'google',
                      onChanged: (_) => setState(() => selectedMethod = 'google'),
                    ),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Google', style: TextStyle(fontWeight: FontWeight.w600)),
                          Text('Get a code send to your google', style: TextStyle(color: Colors.black54)),
                        ],
                      ),
                    ),
                    const Icon(Icons.g_mobiledata, size: 28),
                  ],
                ),
              ),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onContinue,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.deepPurple,
                  backgroundColor: Colors.white,
                  side: const BorderSide(color: Colors.deepPurple),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text(
                  'Continue with Two-Factor Authentication',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ),

            const SizedBox(height: 12),

            Center(
              child: TextButton(
                onPressed: () {
                  print('Skipped');
                },
                child: const Text('Skip for now', style: TextStyle(color: Colors.black87)),
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
