import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../core/utils/helpers/helper_functions.dart';
import '../data/model/DummyData.dart';
import '../data/model/order_model.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(DashboardState());

  void calculateWeeklySales() {
    emit(state.copyWith(status: DashboardStatus.loading));
    try {
      final List<OrderModel> orders = TDummyData.orders;
      List<double> weeklySales = List<double>.filled(7, 0.0);
      for (var order in orders) {
        final DateTime orderWeekStart =
            THelperFunctions.getStartOfWeek(order.orderDate);

        if (orderWeekStart.isBefore(DateTime.now()) &&
            orderWeekStart
                .add(const Duration(days: 7))
                .isAfter(DateTime.now())) {
          int index = (order.orderDate.weekday - 1) % 7;
          index = index < 0 ? index + 7 : index;

          // بنجمع الـ totalAmount من الموديل
          weeklySales[index] += order.totalAmount;
        }
      }
      emit(state.copyWith(
          status: DashboardStatus.loaded, weaklySales: weeklySales));
    } catch (e) {
      emit(
          state.copyWith(status: DashboardStatus.error, message: e.toString()));
    }
    final List<OrderModel> orders = TDummyData.orders;
  }
}
