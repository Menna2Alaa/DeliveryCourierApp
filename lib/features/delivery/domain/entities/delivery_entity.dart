import 'package:delivery_courier_app/features/packages/domain/entity/package_entity.dart';

class DeliveryEntity {
  final String deliveryType;
  final PackageEntity packageEntity;

  DeliveryEntity({required this.deliveryType, required this.packageEntity});
}
