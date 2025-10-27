import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:delivery_courier_app/core/errors/failures.dart';
import 'package:delivery_courier_app/features/packages/data/models/package_model.dart';
import 'package:delivery_courier_app/features/packages/domain/entity/package_entity.dart';
import 'package:delivery_courier_app/features/packages/domain/repos/package_repo.dart';

class PackageRepoImpl implements PackageRepo {
  final FirebaseFirestore firestore;

  PackageRepoImpl({required this.firestore});

  @override
  Future<Either<Failures, void>> addPackage(PackageEntity package) async {
    try {
      final docRef = firestore.collection('packages').doc();
      await docRef.set({
        'trackingId': docRef.id,
        'content': package.content,
        'size': package.size,
        'weight': package.weight,
        'totalPrice': package.totalPrice,
        'deliveryStatus': package.deliveryStatus,
        'paymentDetails': package.paymentDetails,
      });
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, List<PackageEntity>>> getAllPackages() async {
    try {
      final snapshot = await firestore.collection('packages').get();

      final packages = snapshot.docs
          .map((doc) => PackageModel.fromMap(doc.data()))
          .toList();

      return Right(packages);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, PackageEntity>> getPackageByTrackingId(
    String trackingId,
  ) async {
    try {
      final snapshot = await firestore
          .collection('packages')
          .where('trackingId', isEqualTo: trackingId)
          .limit(1)
          .get();

      if (snapshot.docs.isNotEmpty) {
        final package = PackageModel.fromMap(snapshot.docs.first.data());
        return Right(package);
      } else {
        return Left(
          ServerFailure('No package found for tracking ID: $trackingId'),
        );
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
