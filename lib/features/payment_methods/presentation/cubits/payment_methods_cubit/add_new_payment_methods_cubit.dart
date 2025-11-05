import 'package:delivery_courier_app/features/payment_methods/data/models/payment_methods_model.dart';
import 'package:delivery_courier_app/features/payment_methods/domain/entity/payment_methods_entity.dart';
import 'package:delivery_courier_app/features/payment_methods/domain/repos/payment_methods_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_new_payment_methods_state.dart';

class AddNewPaymentMethodsCubit extends Cubit<AddNewPaymentMethodsState> {
  AddNewPaymentMethodsCubit(this.paymentMethodsRepo)
    : super(AddNewPaymentMethodsInitial());
  final PaymentMethodsRepo paymentMethodsRepo;

  Future<void> addNewPaymentMethod({
    required PaymentMethodsModel paymntMethod,
    required String userId,
  }) async {
    emit(AddNewPaymentMethodsLoading());

    final result = await paymentMethodsRepo.addNewPaymentMethod(
      userId,
      paymntMethod,
    );
    result.fold(
      (failure) => emit(AddNewPaymentMethodsFailure(message: failure.message)),
      (success) =>
          emit(AddNewPaymentMethodsSuccess(paymentMethodsEntity: paymntMethod)),
    );
  }
}
