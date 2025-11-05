part of 'add_new_payment_methods_cubit.dart';

sealed class AddNewPaymentMethodsState {}

class AddNewPaymentMethodsInitial extends AddNewPaymentMethodsState {}

class AddNewPaymentMethodsLoading extends AddNewPaymentMethodsState {}

class AddNewPaymentMethodsSuccess extends AddNewPaymentMethodsState {
  final PaymentMethodsEntity paymentMethodsEntity;
  AddNewPaymentMethodsSuccess({required this.paymentMethodsEntity});
}

class AddNewPaymentMethodsFailure extends AddNewPaymentMethodsState {
  final String message;
  AddNewPaymentMethodsFailure({required this.message});
}
