part of 'get_all_couriers_cubit.dart';

sealed class GetAllCouriersState {}

class GetAllCouriersInitial extends GetAllCouriersState {}

class GetAllCouriersLoading extends GetAllCouriersState {}

class GetAllCouriersSuccess extends GetAllCouriersState {
  final List<CourierEntity> couriers;
  GetAllCouriersSuccess(this.couriers);
}

class GetAllCouriersFailure extends GetAllCouriersState {
  final String message;
  GetAllCouriersFailure(this.message);
}
