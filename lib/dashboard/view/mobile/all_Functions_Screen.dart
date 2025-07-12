import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:interview/app/route_name.dart';
import 'package:interview/dashboard/view/widgets/bottom_navigation.dart';

class AllFunctionsScreen extends StatelessWidget {
  const AllFunctionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> functions = [
      {"title": "Deposit", "icon": Icons.attach_money},
      {"title": "Stake", "icon": Icons.savings},
      {"title": "Future", "icon": Icons.trending_up},
      {"title": "Margin", "icon": Icons.stacked_line_chart},
      {"title": "Deposit", "icon": Icons.attach_money},
      {"title": "Stake", "icon": Icons.savings},
      {"title": "Future", "icon": Icons.trending_up},
      {"title": "Margin", "icon": Icons.stacked_line_chart},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('All Functions', style: TextStyle(color: Colors.black)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => context.pushNamed(RouteNames.home),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: GridView.builder(
          itemCount: functions.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 20,
            crossAxisSpacing: 10,
            childAspectRatio: 0.8,
          ),
          itemBuilder: (context, index) {
            final item = functions[index];
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.grey.shade200),
                  child: Icon(item['icon'], size: 30, color: Colors.deepPurple),
                ),
                const SizedBox(height: 8),
                Text(item['title'], style: const TextStyle(fontSize: 12)),
              ],
            );
          },
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
    );
  }
}
