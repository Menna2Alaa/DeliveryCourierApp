import 'package:delivery_courier_app/features/auth/domain/repos/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'update_user_data_state.dart';

class UpdateUserDataCubit extends Cubit<UpdateUserDataState> {
  final AuthRepo authRepo;
  UpdateUserDataCubit({required this.authRepo})
    : super(UpdateUserDataInitial());

  Future<void> updateUserData({
    required String uId,
    required String name,
    required String email,
    String? newPassword,
    String? currentPassword,
  }) async {
    emit(UpdateUserDataLoading());

    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      emit(UpdateUserDataFailure(message: 'No user logged in.'));
      return;
    }

    final result = await authRepo.updateUserData(
      uId: user.uid,
      name: name,
      email: email,
    );

    result.fold(
      (failure) => emit(UpdateUserDataFailure(message: failure.message)),
      (success) async {
        if (newPassword != null && newPassword.isNotEmpty) {
          final passResult = await authRepo.updateUserPassword(
            currentPassword: currentPassword ?? '',
            newPassword: newPassword,
          );

          passResult.fold(
            (failure) => emit(UpdateUserDataFailure(message: failure.message)),
            (success) => emit(UpdateUserDataSuccess()),
          );
        } else {
          emit(UpdateUserDataSuccess());
        }
      },
    );
  }
}
