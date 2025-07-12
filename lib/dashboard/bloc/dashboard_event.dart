part of 'dashboard_bloc.dart';

abstract class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object> get props => [];
}

class InitialDashboard extends DashboardEvent {
  const InitialDashboard();
}

class RefreshPortfolio extends DashboardEvent {
  const RefreshPortfolio();
}
