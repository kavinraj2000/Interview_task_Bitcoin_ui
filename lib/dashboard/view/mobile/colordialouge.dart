import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:interview/app/route_name.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const HomeScreen(), debugShowCheckedModeBanner: false);
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Color Dialog Example")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(context: context, builder: (_) => const ChooseColorDialog());
          },
          child: const Text("Choose Color"),
        ),
      ),
    );
  }
}

class ChooseColorDialog extends StatelessWidget {
  const ChooseColorDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          width: 350,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  const Expanded(
                    child: Text('Choose Color', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                  IconButton(icon: const Icon(Icons.close), onPressed: () => Navigator.of(context).pop()),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildColorSelector(
                    color: Colors.green,
                    arrowIcon: Icons.arrow_upward,
                    label: 'Green UP',
                    arrowColor: Colors.green,
                  ),
                  _buildColorSelector(
                    color: Colors.red,
                    arrowIcon: Icons.arrow_downward,
                    label: 'Red Down',
                    arrowColor: Colors.red,
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      context.goNamed(RouteNames.home);
                    },
                    child: const Text("Set Default"),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF3F328D)),
                    onPressed: () {
                      context.goNamed(RouteNames.home);
                    },
                    child: const Text("Update"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildColorSelector({
    required Color color,
    required IconData arrowIcon,
    required String label,
    required Color arrowColor,
  }) {
    return Column(
      children: [
        Container(
          height: 40,
          width: 80,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: Colors.black),
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Icon(arrowIcon, size: 16, color: arrowColor),
            const SizedBox(width: 4),
            Text(label),
          ],
        ),
      ],
    );
  }
}
