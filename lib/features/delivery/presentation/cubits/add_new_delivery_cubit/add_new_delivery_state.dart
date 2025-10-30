part of 'add_new_delivery_cubit.dart';

sealed class AddNewDeliveryState {}

class AddNewDeliveryInitial extends AddNewDeliveryState {}

class AddNewDeliveryLoading extends AddNewDeliveryState {}

class AddNewDeliverySuccess extends AddNewDeliveryState {
  final DeliveryEntity deliveryEntity;

  AddNewDeliverySuccess({required this.deliveryEntity});
}

class AddNewDeliveryFailure extends AddNewDeliveryState {
  final String message;
  AddNewDeliveryFailure(this.message);
}
