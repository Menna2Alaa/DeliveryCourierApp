import 'package:delivery_courier_app/features/packages/domain/entity/package_entity.dart';
import 'package:delivery_courier_app/features/packages/domain/repos/package_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_package_by_id_state.dart';

class GetPackageByIdCubit extends Cubit<GetPackageByIDState> {
  final PackageRepo packageRepo;

  GetPackageByIdCubit(this.packageRepo) : super(PackageInitial());

  Future<void> getPackageByTrackingId(String trackingId) async {
    emit(PackageLoading());
    final result = await packageRepo.getPackageByTrackingId(trackingId);
    result.fold(
      (failure) => emit(GetPackageFailure(failure.message)),
      (package) => emit(GetPackageSuccess(package)),
    );
  }
}
