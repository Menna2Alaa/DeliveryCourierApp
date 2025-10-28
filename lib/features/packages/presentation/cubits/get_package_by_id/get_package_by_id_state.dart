part of 'get_package_by_id_cubit.dart';

sealed class GetPackageByIDState {}

class GetPackageByIdInitial extends GetPackageByIDState {}

class GetPackageByIdLoading extends GetPackageByIDState {}

class GetPackageByIdSuccess extends GetPackageByIDState {
  final PackageEntity package;
  GetPackageByIdSuccess(this.package);
}

class GetPackageByIdFailure extends GetPackageByIDState {
  final String message;
  GetPackageByIdFailure(this.message);
}
