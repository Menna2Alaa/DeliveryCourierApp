import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:delivery_courier_app/core/errors/failures.dart';
import 'package:delivery_courier_app/features/payment_methods/data/models/payment_methods_model.dart';
import 'package:delivery_courier_app/features/payment_methods/domain/repos/payment_methods_repo.dart';

class PaymentMethodsRepoImpl implements PaymentMethodsRepo {
  final firestore = FirebaseFirestore.instance;
  @override
  Future<Either<Failures, void>> addNewPaymentMethod(
    String userId,
    PaymentMethodsModel method,
  ) async {
    try {
      await firestore
          .collection('users')
          .doc(userId)
          .collection('paymentMethods')
          .add(method.toMap());
      return const Right(null);
    } on FirebaseException catch (e) {
      return Left(ServerFailure(e.message ?? 'Failed to add payment method.'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Stream<Either<Failures, List<PaymentMethodsModel>>> getAllPaymentMethods(
    String userId,
  ) {
    try {
      return firestore
          .collection('users')
          .doc(userId)
          .collection('paymentMethods')
          .snapshots()
          .map(
            (snapshot) => Right<Failures, List<PaymentMethodsModel>>(
              snapshot.docs
                  .map((doc) => PaymentMethodsModel.fromMap(doc.data()))
                  .toList(),
            ),
          )
          .handleError(
            (error) => Left(
              ServerFailure(
                error is FirebaseException
                    ? error.message ?? 'Firestore error.'
                    : 'Unknown error occurred.',
              ),
            ),
          );
    } catch (e) {
      return Stream.value(Left(ServerFailure(e.toString())));
    }
  }
}
