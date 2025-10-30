import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_courier_app/features/delivery/domain/entities/delivery_entity.dart';
import 'package:delivery_courier_app/features/delivery/domain/repos/delivery_repo.dart';
import 'package:delivery_courier_app/features/packages/data/repos/package_repo_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_new_delivery_state.dart';

class AddNewDeliveryCubit extends Cubit<AddNewDeliveryState> {
  final DeliveryRepo deliveryRepo;

  AddNewDeliveryCubit(this.deliveryRepo) : super(AddNewDeliveryInitial());

  Future<void> addNewDelivery(DeliveryEntity deliveryEntity) async {
    emit(AddNewDeliveryLoading());

    final packageRepo = PackageRepoImpl(firestore: FirebaseFirestore.instance);

    final packageResult = await packageRepo.addPackage(
      deliveryEntity.packageEntity,
    );

    packageResult.fold(
      (failure) => emit(
        AddNewDeliveryFailure('Failed to add package: ${failure.message}'),
      ),
      (delivery) async {
        final deliveryResult = await deliveryRepo.addNewDelivery(
          deliveryEntity,
        );
        deliveryResult.fold(
          (failure) => emit(AddNewDeliveryFailure(failure.message)),
          (delivery) =>
              emit(AddNewDeliverySuccess(deliveryEntity: deliveryEntity)),
        );
      },
    );
  }
}
