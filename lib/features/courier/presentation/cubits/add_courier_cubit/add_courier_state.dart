part of 'add_courier_cubit.dart';

sealed class AddCourierState {}

class AddCourierInitial extends AddCourierState {}

class AddCourierLoading extends AddCourierState {}

class AddCourierSuccess extends AddCourierState {
  final CourierEntity courierEntity;
  AddCourierSuccess(this.courierEntity);
}

class AddCourierFailure extends AddCourierState {
  final String message;
  AddCourierFailure(this.message);
}
