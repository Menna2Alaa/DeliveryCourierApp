import 'package:dartz/dartz.dart';
import 'package:delivery_courier_app/core/errors/failures.dart';
import 'package:delivery_courier_app/features/courier/domain/entity/courier_entity.dart';

abstract class CourierRepo {
  Future<Either<Failures, void>> addCourier(CourierEntity courier);
  Future<Either<Failures, List<CourierEntity>>> getAllAvailableCouriers();
}
