class UserEntity {
  final String uId;
  final String name;
  final String email;
  final String? phoneNumber;
  final String? address;
  final String? location;

  const UserEntity({
    required this.uId,
    required this.name,
    required this.email,
    this.phoneNumber,
    this.address,
    this.location,
  });
}
