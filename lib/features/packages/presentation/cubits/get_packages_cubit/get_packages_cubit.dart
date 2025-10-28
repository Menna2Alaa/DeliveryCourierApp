import 'package:delivery_courier_app/features/packages/domain/entity/package_entity.dart';
import 'package:delivery_courier_app/features/packages/domain/repos/package_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_packages_state.dart';

class GetPackagesCubit extends Cubit<GetPackageState> {
  final PackageRepo packageRepo;

  GetPackagesCubit(this.packageRepo) : super(GetPackagesInitial());

  Future<void> getAllPackages() async {
    emit(GetPackagesLoading());
    final result = await packageRepo.getAllPackages();
    result.fold(
      (failure) => emit(GetPackagesFailure(failure.message)),
      (packages) => emit(GetPackagesSuccess(packages)),
    );
  }
}
