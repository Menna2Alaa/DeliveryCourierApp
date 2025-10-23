import 'package:delivery_courier_app/features/auth/domain/entities/user_entity.dart';
import 'package:delivery_courier_app/features/auth/domain/repos/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.authRepo) : super(SignInInitial());

  final AuthRepo authRepo;
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    emit(SignInLoading());
    var result = await authRepo.signinWithEmailAndPassword(email, password);
    result.fold(
      (failure) => emit(SignInFailure(message: failure.message)),
      (userEntity) => emit(SignInSuccess(userEntity: userEntity)),
    );
  }

  Future<void> signInWithGoogle() async {
    emit(SignInLoading());
    var result = await authRepo.signinWithGoogle();
    result.fold(
      (failure) => emit(SignInFailure(message: failure.message)),
      (userEntity) => emit(SignInSuccess(userEntity: userEntity)),
    );
  }
}
