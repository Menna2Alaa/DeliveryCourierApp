part of 'get_all_payment_methods_cubit.dart';

sealed class GetAllPaymentMethodsState {}

class GetAllPaymentMethodsInitial extends GetAllPaymentMethodsState {}

class GetAllPaymentMethodsLoading extends GetAllPaymentMethodsState {}

class GetAllPaymentMethodsSuccess extends GetAllPaymentMethodsState {
  final List<PaymentMethodsModel> paymentMethods;
  GetAllPaymentMethodsSuccess(this.paymentMethods);
}

class GetAllPaymentMethodsFailure extends GetAllPaymentMethodsState {
  final String message;
  GetAllPaymentMethodsFailure(this.message);
}
