import 'package:delivery_courier_app/features/packages/domain/entity/package_entity.dart';
import 'package:delivery_courier_app/features/packages/domain/repos/package_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_package_by_id_state.dart';

class GetPackageByIdCubit extends Cubit<GetPackageByIDState> {
  final PackageRepo packageRepo;

  GetPackageByIdCubit(this.packageRepo) : super(GetPackageByIdInitial());

  Future<void> getPackageByTrackingId(String trackingId) async {
    emit(GetPackageByIdLoading());
    final result = await packageRepo.getPackageByTrackingId(trackingId);
    result.fold(
      (failure) => emit(GetPackageByIdFailure(failure.message)),
      (package) => emit(GetPackageByIdSuccess(package)),
    );
  }
}
