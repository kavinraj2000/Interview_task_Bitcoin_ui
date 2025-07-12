import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview/dashboard/model/dashboardmodel.dart';
import 'package:interview/dashboard/repo/repository.dart';
import 'package:logger/web.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final Repository repo;
  DashboardBloc(this.repo) : super(DashboardState.initial()) {
    on<InitialDashboard>(_onLoadDashboardData);
  }

  final log = Logger();

  Future<void> _onLoadDashboardData(InitialDashboard event, Emitter<DashboardState> emit) async {
    emit(state.copyWith(status: DashboardStatus.loading));
    try {
      final data = await repo.getData();
      log.d("DashboardBloc:_onLoadDashboardData:getdata::$data");
      emit(state.copyWith(status: DashboardStatus.loaded, portfolio: data));
    } catch (e) {
      emit(state.copyWith(status: DashboardStatus.error, errorMessage: e.toString()));
    }
  }
}
