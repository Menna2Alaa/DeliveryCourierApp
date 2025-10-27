import 'package:delivery_courier_app/features/auth/domain/entities/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.uId,
    required super.name,
    required super.email,
    required super.phoneNumber,
    required super.address,
    required super.location,
  });

  factory UserModel.fromFirebase(User user) {
    return UserModel(
      uId: user.uid,
      name: user.displayName ?? '',
      email: user.email ?? '',
      phoneNumber: user.phoneNumber ?? '',
      address: '',
      location: '',
    );
  }
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      uId: json['uId'],
      phoneNumber: json['phoneNumber'],
      address: json['address'],
      location: json['location'],
    );
  }
  factory UserModel.fromEntity(UserEntity user) {
    return UserModel(
      name: user.name,
      email: user.email,
      uId: user.uId,
      phoneNumber: user.phoneNumber,
      address: user.address,
      location: user.location,
    );
  }
  toMap() {
    return {'name': name, 'email': email, 'uId': uId};
  }
}
