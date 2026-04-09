import 'package:equatable/equatable.dart';
import 'package:yt_ecommerce_admin_panel/core/utils/constants/enums.dart';

class OrderModel extends Equatable {
  final String id;
  final OrderStatus status;
  final double totalAmount;
  final DateTime orderDate;
  final DateTime deliveryDate;

  OrderModel(
      {required this.id,
      required this.status,
      required this.totalAmount,
      required this.orderDate,
      required this.deliveryDate});

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
        id: json['id'] ?? '',
        status: OrderStatus.values
            .firstWhere((e) => e.toString() == json['status']),
        totalAmount: (json['totalAmount'] as num).toDouble(),
        orderDate: DateTime.parse(json['orderDate']),
        deliveryDate: DateTime.parse(json['deliveryDate']));
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'status': status.toString(),
      'totalAmount': totalAmount,
      'orderDate': orderDate.toIso8601String(),
      'deliveryDate': deliveryDate.toIso8601String(),
    };
  }

  @override
  List<Object?> get props => [status, deliveryDate, orderDate, totalAmount, id];
}
