import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:delivery_courier_app/constants.dart';
import 'package:delivery_courier_app/core/errors/exceptions.dart';
import 'package:delivery_courier_app/core/errors/failures.dart';
import 'package:delivery_courier_app/core/services/shared_prefrences_singleton.dart';
import 'package:delivery_courier_app/features/auth/data/services/backend_endpoint.dart';
import 'package:delivery_courier_app/features/auth/data/services/database_service.dart';
import 'package:delivery_courier_app/features/auth/data/services/firebase_auth_service.dart';
import 'package:delivery_courier_app/features/auth/data/models/user_model.dart';
import 'package:delivery_courier_app/features/auth/domain/entities/user_entity.dart';
import 'package:delivery_courier_app/features/auth/domain/repos/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DataBaseService dataBaseService;

  AuthRepoImpl({
    required this.dataBaseService,
    required this.firebaseAuthService,
  });
  @override
  Future<Either<Failures, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    User? user;
    try {
      user = await firebaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      var userEntity = UserEntity(name: name, email: email, uId: user.uid);
      await addUserData(user: userEntity);
      return Right(userEntity);
    } on CustomeException catch (e) {
      await deleteUser(user);
      return Left(ServerFailure(e.message));
    } catch (e) {
      deleteUser(user);
      log(
        'Exception in AuthRepoImplementation.createUserWithEmailAndPassword: ${e.toString()}',
      );
      return Left(ServerFailure('Something went wrong, try again later'));
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
      var userEntity = await getUserData(uId: user.uid);
      await saveUserData(user: userEntity);
      //save user data if we use API to know if he logged in before or not after that in splash view before navigation check about it(fetch user data and see if it null or not)
      return Right(userEntity);
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

  @override
  Future addUserData({required UserEntity user}) async {
    await dataBaseService.addData(
      path: BackendEndpoint.addUserData,
      data: UserModel.fromEntity(user).toMap(),
      documentId: user.uId,
    );
  }

  @override
  Future<UserEntity> getUserData({required String uId}) async {
    var userData = await dataBaseService.getData(
      path: BackendEndpoint.getUserData,
      documentId: uId,
    );
    return UserModel.fromJson(userData);
  }

  @override
  Future saveUserData({required UserEntity user}) async {
    var jasonData = jsonEncode(UserModel.fromEntity(user).toMap());
    await Pref.setString(kUserData, jasonData);
  }

  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await firebaseAuthService.deleteUSer();
    }
  }
}
