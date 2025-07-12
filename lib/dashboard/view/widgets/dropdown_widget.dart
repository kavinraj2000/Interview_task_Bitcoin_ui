import 'package:flutter/material.dart';
import 'package:interview/dashboard/model/dashboardmodel.dart';

class DropdownWidget extends StatefulWidget {
  final DashboardModel dashboardData;

  const DropdownWidget({super.key, required this.dashboardData});

  @override
  State<DropdownWidget> createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  String selectedDuration = 'Monthly';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              const Expanded(
                child: Text('My portfolio', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
              DropdownButton<String>(
                value: selectedDuration,
                underline: const SizedBox(),
                style: const TextStyle(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
                items: const [
                  DropdownMenuItem(value: 'Monthly', child: Text('Monthly')),
                  DropdownMenuItem(value: 'Weekly', child: Text('Weekly')),
                  DropdownMenuItem(value: 'Daily', child: Text('Daily')),
                ],
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      selectedDuration = value;
                    });
                  }
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),

        SizedBox(
          height: 140,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.dashboardData.cryptoAssets.length,
            itemBuilder: (context, index) {
              final asset = widget.dashboardData.cryptoAssets[index];
              return Padding(
                padding: EdgeInsets.only(left: index == 0 ? 16 : 8, right: 8),
                child: _portfolioCard(
                  name: asset.name,
                  symbol: asset.symbol,
                  amount: asset.amount.toStringAsFixed(0),
                  percentChange: asset.changePercentage,
                  icon: asset.symbol == 'BTC' ? Icons.currency_bitcoin : Icons.diamond,
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _portfolioCard({
    required String name,
    required String symbol,
    required String amount,
    required double percentChange,
    required IconData icon,
  }) {
    final isPositive = percentChange >= 0;
    return Container(
      width: 160,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
              ),
              CircleAvatar(
                radius: icon == Icons.currency_bitcoin ? 20 : 16,
                child: Icon(icon, size: 20, color: Colors.orange),
              ),
            ],
          ),
          Text(symbol, style: const TextStyle(color: Colors.grey, fontSize: 12)),
          const SizedBox(height: 12),
          Text(amount, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          const SizedBox(height: 4),
          Row(
            children: [
              Text(
                "${percentChange.toStringAsFixed(2)}%",
                style: TextStyle(color: isPositive ? Colors.green : Colors.red, fontSize: 12),
              ),
              Icon(
                isPositive ? Icons.arrow_upward : Icons.arrow_downward,
                size: 12,
                color: isPositive ? Colors.green : Colors.red,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
