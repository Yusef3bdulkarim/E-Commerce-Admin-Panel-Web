import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:yt_ecommerce_admin_panel/core/utils/constants/enums.dart';

import '../../../core/utils/helpers/helper_functions.dart';
import '../data/model/DummyData.dart';
import '../data/model/order_model.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(DashboardState()){
    fetchDashboardData();
  }


  Future<void> fetchDashboardData() async {
    emit(state.copyWith(status: DashboardStatus.loading));
    try {
      // 1. جلب البيانات (حالياً من Dummy ومستقبلاً من Firebase)
      final List<OrderModel> orders = TDummyData.orders;

      // 2. تحديث الـ State بقائمة الأوردرات أولاً
      // 3. إجراء الحسابات بناءً على القائمة اللي جت
      final weeklySales = calculateWeeklySales(orders);
      final statusData = _processOrderStatusData(orders);

      emit(state.copyWith(
        status: DashboardStatus.loaded,
        order: orders,
        weaklySales: weeklySales,
        orderStatusDate: statusData.counts,
        totalAmounts: statusData.amounts,
      ));
    } catch (e) {
      emit(state.copyWith(status: DashboardStatus.error, message: e.toString()));
    }
  }

  List<double> calculateWeeklySales(List<OrderModel> orders) {
    List<double> weeklySales = List<double>.filled(7, 0.0);
    for (var order in orders) {
      final DateTime orderWeekStart = THelperFunctions.getStartOfWeek(order.orderDate);

      if (orderWeekStart.isBefore(DateTime.now()) &&
          orderWeekStart.add(const Duration(days: 7)).isAfter(DateTime.now())) {
        int index = (order.orderDate.weekday - 1) % 7;
        index = index < 0 ? index + 7 : index;
        weeklySales[index] += order.totalAmount;
      }
    }
    return weeklySales;
  }

  ({Map<OrderStatus, int> counts, Map<OrderStatus, double> amounts}) _processOrderStatusData(List<OrderModel> orders) {
    Map<OrderStatus, int> counts = {};
    Map<OrderStatus, double> amounts = {};

    for (var order in orders) {
      final status = order.status;
      counts[status] = (counts[status] ?? 0) + 1;
      amounts[status] = (amounts[status] ?? 0) + order.totalAmount;
    }
    return (counts: counts, amounts: amounts);
  }

}
