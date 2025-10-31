import 'package:delivery_courier_app/features/courier/domain/entity/courier_entity.dart';

class CourierModel extends CourierEntity {
  CourierModel({
    required super.name,
    required super.phone,
    required super.content,
    required super.size,
    required super.weight,
    required super.price,
    required super.dropoffLocation,
    required super.pickupLocation,
    required super.estimatedTime,
    required super.isFeatured,
  });

  factory CourierModel.fromMap(Map<String, dynamic> map) => CourierModel(
    name: map['name'] ?? '',
    phone: map['phone'] ?? '',
    content: map['content'] ?? '',
    size: map['size'] ?? '',
    weight: map['weight'] ?? '',
    price: map['price'] ?? '',
    dropoffLocation: map['dropoffLocation'] ?? '',
    pickupLocation: map['pickupLocation'] ?? '',
    estimatedTime: map['estimatedTime'] ?? '',
    isFeatured: map['isFeatured'] ?? false,
  );
}
