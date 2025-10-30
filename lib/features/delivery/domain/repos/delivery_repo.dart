import 'package:dartz/dartz.dart';
import 'package:delivery_courier_app/core/errors/failures.dart';
import 'package:delivery_courier_app/features/delivery/domain/entities/delivery_entity.dart';

abstract class DeliveryRepo {
  Future<Either<Failures, void>> addNewDelivery(DeliveryEntity deliveyEntity);
}
