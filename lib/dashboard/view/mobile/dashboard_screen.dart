import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:interview/app/route_name.dart';
import 'package:interview/dashboard/bloc/dashboard_bloc.dart';
import 'package:interview/dashboard/model/dashboardmodel.dart';
import 'package:interview/dashboard/view/widgets/bottom_navigation.dart';
import 'package:interview/dashboard/view/widgets/dropdown_widget.dart';
import 'package:logger/logger.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final log = Logger();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          children: [
            InkWell(
              child: CircleAvatar(radius: 20, child: Image.asset('assets/images/icon.png', fit: BoxFit.fill)),
              onTap: () {
                context.goNamed(RouteNames.profileScreen);
              },
            ),
            const SizedBox(width: 10),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ' Norwillem',
                    style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Text('@norawilliam', style: TextStyle(color: Colors.grey, fontSize: 12)),
                ],
              ),
            ),
            Container(
              width: 150,
              height: 40,
              decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(20)),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  suffixIcon: Icon(Icons.search, color: Colors.grey),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
              ),
            ),
            const SizedBox(width: 10),
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.deepPurple.shade50,
              child: IconButton(
                icon: const Icon(Icons.notifications_none, color: Colors.black),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        tooltip: 'Main Action',
        onPressed: () {},
        child: const Icon(Icons.add, color: Colors.white, size: 30),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const BottomNavBarWidget(),
      body: BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
          if (state.status == DashboardStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.status == DashboardStatus.loaded && state.portfolio != null) {
            final dashboardData = state.portfolio!;
            log.d('Dashboard Data Loaded: ${dashboardData.toString()}');

            return Padding(
              padding: const EdgeInsets.all(16),
              child: ListView(
                children: [
                  const Text('Total Balance', style: TextStyle(fontSize: 14, color: Colors.grey)),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$${dashboardData.first.totalBalance}",
                        style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "${dashboardData.first.isPositive ? '+' : '-'}\$${dashboardData.first.changeAmount.toStringAsFixed(2)}",
                            style: TextStyle(
                              color: dashboardData.first.isPositive ? Colors.green : Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "${dashboardData.first.isPositive ? '+' : '-'}${dashboardData.first.changePercentage.toStringAsFixed(1)}%",
                            style: TextStyle(
                              color: dashboardData.first.isPositive ? Colors.green : Colors.red,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _buildBanner(),
                  const SizedBox(height: 20),
                  _buildActionButtons(context),
                  const SizedBox(height: 30),
                  DropdownWidget(dashboardData: dashboardData.first),
                  const SizedBox(height: 30),
                  _buildMarketStatSection(dashboardData.first),
                ],
              ),
            );
          } else if (state.status == DashboardStatus.error) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 64, color: Colors.red),
                  const SizedBox(height: 16),
                  Text("Error: ${state.errorMessage}", style: const TextStyle(color: Colors.red)),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context.read<DashboardBloc>().add(InitialDashboard());
                    },
                    child: const Text("Retry"),
                  ),
                ],
              ),
            );
          }
          return const Center(child: Text("No Data"));
        },
      ),
    );
  }

  Widget _buildBanner() {
    return Container(
      height: 150,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.deepPurple.shade100, Colors.deepPurple.shade50],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Row(
        children: [
          Icon(Icons.explore, size: 40, color: Colors.deepPurple),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Step into HRA Exchange", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                Text("Your gateway to decentralized trading", style: TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _actionButton(Icons.call_received, "Deposit", context),
        _actionButton(Icons.store, "Store", context),
        _actionButton(Icons.swap_vert, "Future", context),
        _actionButton(Icons.line_axis, "Margin", context),
        _actionButton(Icons.more_horiz, "More", context),
      ],
    );
  }

  Widget _actionButton(IconData icon, String label, BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            if (label == "More") {
              context.goNamed(RouteNames.allFunctionsScreen);
            }
          },
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: Colors.deepPurple.shade50, borderRadius: BorderRadius.circular(12)),
            child: Icon(icon, color: Colors.deepPurple, size: 24),
          ),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
        const SizedBox(height: 4),
      ],
    );
  }

  Widget _buildMarketStatSection(DashboardModel dashboardData) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Market Statistics", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        Column(children: [Column(children: dashboardData.marketStats.map((stat) => _marketStatItem(stat)).toList())]),
      ],
    );
  }

  Widget _marketStatItem(MarketStat stat) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading: CircleAvatar(
        backgroundColor: Colors.deepPurple.shade50,
        child: const Icon(Icons.currency_exchange, color: Colors.deepPurple),
      ),
      title: Text(stat.name, style: const TextStyle(fontWeight: FontWeight.w500)),
      subtitle: Text(stat.symbol, style: const TextStyle(color: Colors.grey, fontSize: 12)),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("\$${stat.price.toStringAsFixed(2)}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          Text(
            "${stat.changePercentage > 0 ? '+' : ''}${stat.changePercentage.toStringAsFixed(2)}%",
            style: TextStyle(
              color: stat.changePercentage > 0 ? Colors.green : Colors.red,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
