import 'package:dartz/dartz.dart';
import 'package:delivery_courier_app/core/errors/failures.dart';
import 'package:delivery_courier_app/features/courier/data/models/courier_model.dart';
import 'package:delivery_courier_app/features/courier/domain/entity/courier_entity.dart';
import 'package:delivery_courier_app/features/courier/domain/repos/courier_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CourierRepoImpl implements CourierRepo {
  final FirebaseFirestore firestore;

  CourierRepoImpl({required this.firestore});
  @override
  Future<Either<Failures, void>> addCourier(CourierEntity courier) async {
    try {
      final docRef = firestore.collection('couriers').doc();
      await docRef.set({
        'content': courier.content,
        'size': courier.size,
        'weight': courier.weight,
        'price': courier.price,
        'name': courier.name,
        'phone': courier.phone,
        'dropoffLocation': courier.dropoffLocation,
        'pickupLocation': courier.pickupLocation,
        'estimatedTime': courier.estimatedTime,
        'isFeatured': courier.isFeatured,
      });
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, List<CourierEntity>>>
  getAllAvailableCouriers() async {
    try {
      final snapshot = await firestore.collection('couriers').get();
      final couriers = snapshot.docs
          .map((doc) => CourierModel.fromMap(doc.data()))
          .toList();
      return Right(couriers);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
