import 'package:delivery_courier_app/features/packages/domain/entity/package_entity.dart';

class PackageModel extends PackageEntity {
  PackageModel({
    required super.pkgId,
    required super.content,
    required super.size,
    required super.weight,
    required super.totalPrice,
    required super.deliveryStatus,
    required super.paymentDetails,
  });

  factory PackageModel.fromMap(Map<String, dynamic> map) {
    return PackageModel(
      pkgId: map['trackingId'] ?? map['pkgId'] ?? "", // Changed from 'id'
      content: map['content'] ?? '',
      size: map['size'] ?? '',
      weight: map['weight'] ?? '',
      totalPrice: map['totalPrice'] ?? '',
      deliveryStatus: map['deliveryStatus'] ?? '',
      paymentDetails: map['paymentDetails'] ?? '',
    );
  }
}
