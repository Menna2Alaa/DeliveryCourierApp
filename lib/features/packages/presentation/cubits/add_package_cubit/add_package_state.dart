part of 'add_package_cubit.dart';

sealed class PackageState {}

class AddPackageInitial extends PackageState {}

class AddPackageLoading extends PackageState {}

class PackageAddedSuccess extends PackageState {
  final PackageEntity packageEntity;

  PackageAddedSuccess({required this.packageEntity});
}

class PackageAddedFailure extends PackageState {
  final String message;
  PackageAddedFailure(this.message);
}
