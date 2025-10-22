import 'package:dartz/dartz.dart';
import 'package:delivery_courier_app/core/errors/failures.dart';
import 'package:delivery_courier_app/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failures, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  );
}
