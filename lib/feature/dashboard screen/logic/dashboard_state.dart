part of 'dashboard_cubit.dart';

enum DashboardStatus { initial, loading, loaded, error }

@immutable
class DashboardState extends Equatable {
  final DashboardStatus status;
  final List<double> weaklySales;
  final Map<OrderStatus, int> orderStatusDate;
  final Map<OrderStatus, double> totalAmounts;
  final List<OrderModel> order;

  final String message;

  const DashboardState({
    this.status = DashboardStatus.initial,
    this.weaklySales = const [],
    this.order = const [],
    this.message = "",
    this.orderStatusDate = const {},
    this.totalAmounts = const {},
  });

  DashboardState copyWith({
    DashboardStatus? status,
    List<double>? weaklySales,
    List<OrderModel>? order,
    Map<OrderStatus, double>? totalAmounts,
    Map<OrderStatus, int>? orderStatusDate,
    String? message,
  }) {
    return DashboardState(
      status: status ?? this.status,
      weaklySales: weaklySales ?? this.weaklySales,
      order: order ?? this.order,
      totalAmounts: totalAmounts ?? this.totalAmounts,
      orderStatusDate: orderStatusDate ?? this.orderStatusDate,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props =>
      [status, weaklySales, order, totalAmounts, orderStatusDate, message];
}
