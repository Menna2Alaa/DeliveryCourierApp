import 'package:dartz/dartz.dart';
import 'package:delivery_courier_app/core/errors/failures.dart';
import 'package:delivery_courier_app/features/payment_methods/data/models/payment_methods_model.dart';

abstract class PaymentMethodsRepo {
  Future<Either<Failures, void>> addNewPaymentMethod(
    String userId,
    PaymentMethodsModel method,
  );

  Stream<Either<Failures, List<PaymentMethodsModel>>> getAllPaymentMethods(
    String userId,
  );
}
