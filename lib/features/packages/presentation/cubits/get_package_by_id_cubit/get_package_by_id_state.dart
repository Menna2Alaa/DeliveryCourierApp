part of 'get_package_by_id_cubit.dart';

sealed class GetPackageByIDState {}

class PackageInitial extends GetPackageByIDState {}

class PackageLoading extends GetPackageByIDState {}

class GetPackageSuccess extends GetPackageByIDState {
  final PackageEntity package;
  GetPackageSuccess(this.package);
}

class GetPackageFailure extends GetPackageByIDState {
  final String message;
  GetPackageFailure(this.message);
}
