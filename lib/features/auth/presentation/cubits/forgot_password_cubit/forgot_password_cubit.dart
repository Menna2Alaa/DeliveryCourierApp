import 'package:delivery_courier_app/features/auth/domain/repos/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final AuthRepo authRepo;
  ForgotPasswordCubit({required this.authRepo})
    : super(ForgotPasswordInitial());

  Future<void> resetPassword(String email) async {
    emit(ForgotPasswordLoading());
    final result = await authRepo.resetPassword(email);
    result.fold(
      (failure) => emit(ForgotPasswordFailure(failure.message)),
      (success) => emit(ForgotPasswordSuccess()),
    );
  }
}
