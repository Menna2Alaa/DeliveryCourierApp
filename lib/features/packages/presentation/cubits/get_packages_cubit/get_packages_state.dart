part of 'get_packages_cubit.dart';

sealed class GetPackageState {}

class GetPackagesInitial extends GetPackageState {}

class GetPackagesLoading extends GetPackageState {}

class GetPackagesSuccess extends GetPackageState {
  final List<PackageEntity> packages;
  GetPackagesSuccess(this.packages);
}

class GetPackagesFailure extends GetPackageState {
  final String message;
  GetPackagesFailure(this.message);
}
