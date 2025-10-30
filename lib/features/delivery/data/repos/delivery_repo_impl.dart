import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:delivery_courier_app/core/errors/failures.dart';
import 'package:delivery_courier_app/features/delivery/data/model/delivery_model.dart';
import 'package:delivery_courier_app/features/delivery/domain/entities/delivery_entity.dart';
import 'package:delivery_courier_app/features/delivery/domain/repos/delivery_repo.dart';

class DeliveryRepoImpl implements DeliveryRepo {
  final FirebaseFirestore firestore;

  DeliveryRepoImpl({required this.firestore});
  @override
  Future<Either<Failures, void>> addNewDelivery(
    DeliveryEntity deliveryEntity,
  ) async {
    try {
      final deliveryModel = deliveryEntity is DeliveryModel
          ? deliveryEntity
          : DeliveryModel(
              deliveryType: deliveryEntity.deliveryType,
              packageEntity: deliveryEntity.packageEntity,
            );

      await firestore.collection('deliveries').add(deliveryModel.toMap());
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
