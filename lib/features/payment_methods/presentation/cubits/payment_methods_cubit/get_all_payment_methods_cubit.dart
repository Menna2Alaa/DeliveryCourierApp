import 'package:delivery_courier_app/features/payment_methods/data/models/payment_methods_model.dart';
import 'package:delivery_courier_app/features/payment_methods/domain/repos/payment_methods_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_all_payment_methods_state.dart';

class GetAllPaymentMethodsCubit extends Cubit<GetAllPaymentMethodsState> {
  GetAllPaymentMethodsCubit(this.paymentMethodsRepo)
    : super(GetAllPaymentMethodsInitial());
  final PaymentMethodsRepo paymentMethodsRepo;

  void getAllPaymentMethods(String userId) {
    emit(GetAllPaymentMethodsLoading());
    paymentMethodsRepo.getAllPaymentMethods(userId).listen((event) {
      event.fold(
        (failure) => emit(GetAllPaymentMethodsFailure(failure.message)),
        (methods) => emit(GetAllPaymentMethodsSuccess(methods)),
      );
    });
  }
}
