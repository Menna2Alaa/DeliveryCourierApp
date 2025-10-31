import 'package:delivery_courier_app/features/auth/domain/repos/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'delete_account_state.dart';

class DeleteAccountCubit extends Cubit<DeleteAccountState> {
  DeleteAccountCubit(this.authRepo) : super(DeleteAccountInitial());
  final AuthRepo authRepo;

  Future<void> deleteUserAccount() async {
    emit(DeleteAccountLoading());
    final result = await authRepo.deleteUserAccount();
    result.fold(
      (failure) => emit(DeleteAccountFailure(message: failure.message)),
      (success) => emit(DeleteAccountSuccess()), // new state
    );
  }
}
