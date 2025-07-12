part of 'dashboard_bloc.dart';

enum DashboardStatus { initial, loading, loaded, error }

class DashboardState extends Equatable {
  final DashboardStatus status;
  final List<DashboardModel>? portfolio;
  final String? errorMessage;

  const DashboardState({required this.status, this.portfolio, this.errorMessage});

  factory DashboardState.initial() {
    return const DashboardState(status: DashboardStatus.initial);
  }

  DashboardState copyWith({DashboardStatus? status, List<DashboardModel>? portfolio, String? errorMessage}) {
    return DashboardState(
      status: status ?? this.status,
      portfolio: portfolio ?? this.portfolio,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, portfolio, errorMessage];
}
