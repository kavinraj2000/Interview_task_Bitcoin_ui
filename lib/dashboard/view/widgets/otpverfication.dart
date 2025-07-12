import 'package:flutter/material.dart';
import 'package:interview/dashboard/view/mobile/color_dialouge.dart';
import 'package:logger/web.dart';

class Otpverfication extends StatelessWidget {
  const Otpverfication({super.key});

  @override
  Widget build(BuildContext context) {
    final codeControllers = List.generate(6, (_) => TextEditingController());

    return Center(
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(onTap: () => Navigator.of(context).pop(), child: const Icon(Icons.close)),
              ),
              const SizedBox(height: 8),
              const Text('Confirm it’s you', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              const SizedBox(height: 8),
              const Text(
                'Enter the code sent to your email,',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
              const SizedBox(height: 4),
              const Text('@norawilliam.com', style: TextStyle(fontWeight: FontWeight.w500)),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(6, (index) {
                  return SizedBox(
                    width: 40,
                    child: TextField(
                      controller: codeControllers[index],
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(counterText: '', border: OutlineInputBorder()),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {
                  final enteredCode = codeControllers.map((e) => e.text).join();
                  Navigator.of(context).pop();
                  showDialog(context: context, builder: (context) => const ChooseColorDialog());

                  Logger().d('Entered Code: $enteredCode');
                },
                child: const Text("Verify"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
