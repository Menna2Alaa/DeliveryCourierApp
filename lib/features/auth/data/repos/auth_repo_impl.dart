import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:delivery_courier_app/core/errors/exceptions.dart';
import 'package:delivery_courier_app/core/errors/failures.dart';
import 'package:delivery_courier_app/features/auth/data/services/firebase_auth_service.dart';
import 'package:delivery_courier_app/features/auth/data/models/user_model.dart';
import 'package:delivery_courier_app/features/auth/domain/entities/user_entity.dart';
import 'package:delivery_courier_app/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;

  AuthRepoImpl({required this.firebaseAuthService});
  @override
  Future<Either<Failures, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    try {
      var user = await firebaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(UserModel.fromFirebase(user));
    } on CustomeException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      return left(ServerFailure('Something went wrong, try again later'));
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signinWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return Right(UserModel.fromFirebase(user));
    } on CustomeException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      log(
        'Exception in AuthRepoImplementation.signinWithEmailAndPassword: ${e.toString()}',
      );
      return Left(ServerFailure('Something went wrong, try again later'));
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signinWithGoogle() async {
    try {
      var user = await firebaseAuthService.signInWithGoogle();

      return Right(UserModel.fromFirebase(user));
    } catch (e) {
      log(
        'Exception in AuthRepoImplementation.signinWithGoogle: ${e.toString()}',
      );
      return Left(ServerFailure('Something went wrong, try again later'));
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signinWithFacebook() async {
    try {
      var user = await firebaseAuthService.signInWithFacebook();

      return Right(UserModel.fromFirebase(user));
    } catch (e) {
      log(
        'Exception in AuthRepoImplementation.signinWithFacebook: ${e.toString()}',
      );
      return Left(ServerFailure('Something went wrong, try again later'));
    }
  }
}
