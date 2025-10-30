import 'package:delivery_courier_app/features/delivery/domain/entities/delivery_entity.dart';
import 'package:delivery_courier_app/features/packages/data/models/package_model.dart';

class DeliveryModel extends DeliveryEntity {
  DeliveryModel({required super.deliveryType, required super.packageEntity});

  factory DeliveryModel.fromMap(Map<String, dynamic> map) {
    return DeliveryModel(
      deliveryType: map['deliveryType'] ?? '',
      packageEntity: PackageModel.fromMap(
        Map<String, dynamic>.from(map['package'] ?? {}),
      ),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'deliveryType': deliveryType,
      'package': (packageEntity as PackageModel).toMap(),
      'createdAt':
          DateTime.now(), // optional, can replace with FieldValue.serverTimestamp()
    };
  }
}
