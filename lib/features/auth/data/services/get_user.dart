import 'dart:convert';

import 'package:delivery_courier_app/constants.dart';
import 'package:delivery_courier_app/core/services/shared_prefrences_singleton.dart';
import 'package:delivery_courier_app/features/auth/data/models/user_model.dart';
import 'package:delivery_courier_app/features/auth/domain/entities/user_entity.dart';

UserEntity getUser() {
  var jsonString = Pref.getString(kUserData);
  var uerEntity = UserModel.fromJson(jsonDecode(jsonString));
  return uerEntity;
}
