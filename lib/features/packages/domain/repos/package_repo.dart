import 'package:dartz/dartz.dart';
import 'package:delivery_courier_app/core/errors/failures.dart';
import 'package:delivery_courier_app/features/packages/domain/entity/package_entity.dart';

abstract class PackageRepo {
  Future<Either<Failures, void>> addPackage(PackageEntity package);
  Future<Either<Failures, List<PackageEntity>>> getAllPackages();
  Future<Either<Failures, PackageEntity>> getPackageByTrackingId(
    String trackingId,
  );
}
