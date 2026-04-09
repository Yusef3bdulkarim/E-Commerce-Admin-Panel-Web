part of 'dashboard_cubit.dart';

enum DashboardStatus { initial, loading, loaded, error }

@immutable
class DashboardState extends Equatable {
  final DashboardStatus status;
  final List<double> weaklySales;
  final String message;

  const DashboardState(
      {this.status = DashboardStatus.initial,
      this.weaklySales = const [],
      this.message = ""});

  DashboardState copyWith(
      {DashboardStatus? status, List<double>? weaklySales, String? message}) {
    return DashboardState(
        status: status ?? this.status,
        weaklySales: weaklySales ?? this.weaklySales,
        message: message ?? this.message);
  }

  @override
  List<Object?> get props => [status, weaklySales, message];
}
