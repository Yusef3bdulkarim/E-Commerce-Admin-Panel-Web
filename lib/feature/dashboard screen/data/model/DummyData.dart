import '../../../../core/utils/constants/enums.dart';
import 'order_model.dart';

class TDummyData {
  static final List<OrderModel> orders = [
    OrderModel(
      id: 'CWT0012',
      status: OrderStatus.processing,
      totalAmount: 265,
      orderDate: DateTime(2026, 4, 9),
      deliveryDate: DateTime(2026, 4,10),
    ),
    OrderModel(
      id: 'CWT0025',
      status: OrderStatus.shipped,
      totalAmount: 369,
      orderDate: DateTime(2026, 4, 8),
      deliveryDate: DateTime(2026, 4, 9),
    ),
    OrderModel(
      id: 'CWT0152',
      status: OrderStatus.delivered,
      totalAmount: 254,
      orderDate: DateTime(2026, 4, 5),
      deliveryDate: DateTime(2026, 4, 7),
    ),
    OrderModel(
      id: 'CWT0152',
      status: OrderStatus.delivered,
      totalAmount: 900,
      orderDate: DateTime(2026, 4, 7),
      deliveryDate: DateTime(2026, 4, 10),
    ),
    OrderModel(
      id: 'CWT0152',
      status: OrderStatus.cancelled,
      totalAmount: 354,
      orderDate: DateTime(2026, 4, 10),
      deliveryDate: DateTime(2024, 5, 25),
    ),
    OrderModel(
      id: 'CWT0152',
      status: OrderStatus.delivered,
      totalAmount: 2000,
      orderDate: DateTime(2026, 4, 12),
      deliveryDate: DateTime(2024, 5, 22),
    ),
  ];
}
