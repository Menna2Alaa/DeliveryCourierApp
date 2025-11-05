part of 'update_user_data_cubit.dart';

sealed class UpdateUserDataState {}

class UpdateUserDataInitial extends UpdateUserDataState {}

class UpdateUserDataLoading extends UpdateUserDataState {}

class UpdateUserDataSuccess extends UpdateUserDataState {}

class UpdateUserDataFailure extends UpdateUserDataState {
  final String message;
  UpdateUserDataFailure({required this.message});
}
