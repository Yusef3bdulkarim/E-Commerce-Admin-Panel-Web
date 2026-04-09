import '../../../../core/utils/constants/enums.dart';
import 'order_model.dart';

class TDummyData {
  static final List<OrderModel> orders = [
    OrderModel(
      id: 'CWT0012',
      status: OrderStatus.processing,
      totalAmount: 265,
      orderDate: DateTime(2026, 4, 3),
      deliveryDate: DateTime(2026, 4,4),
    ),
    OrderModel(
      id: 'CWT0025',
      status: OrderStatus.shipped,
      totalAmount: 369,
      orderDate: DateTime(2026, 4, 1),
      deliveryDate: DateTime(2026, 4, 2),
    ),
    OrderModel(
      id: 'CWT0152',
      status: OrderStatus.delivered,
      totalAmount: 254,
      orderDate: DateTime(2026, 3, 31),
      deliveryDate: DateTime(2026, 4, 2),
    ),
    OrderModel(
      id: 'CWT0152',
      status: OrderStatus.delivered,
      totalAmount: 299,
      orderDate: DateTime(2026, 3, 29),
      deliveryDate: DateTime(2026, 3, 30),
    ),
    OrderModel(
      id: 'CWT0152',
      status: OrderStatus.delivered,
      totalAmount: 354,
      orderDate: DateTime(2024, 5, 24),
      deliveryDate: DateTime(2024, 5, 25),
    ),
    OrderModel(
      id: 'CWT0152',
      status: OrderStatus.delivered,
      totalAmount: 854,
      orderDate: DateTime(2024, 5, 26),
      deliveryDate: DateTime(2024, 5, 22),
    ),
  ];
}
