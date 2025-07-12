import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview/dashboard/bloc/dashboard_bloc.dart';
import 'package:interview/dashboard/repo/repository.dart';
import 'package:interview/dashboard/view/mobile/dashboard_mobileview.dart';

import 'package:responsive_framework/responsive_framework.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DashboardBloc(Repository())..add(InitialDashboard()),
      child: ResponsiveValue<Widget>(
        context,
        defaultValue: DashboardScreen(),
        conditionalValues: [
          Condition.equals(name: TABLET, value: DashboardScreen()),
          Condition.smallerThan(name: MOBILE, value: DashboardScreen()),
        ],
      ).value,
    );
  }
}
