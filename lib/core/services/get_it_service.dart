import 'package:delivery_courier_app/core/services/firestore_service.dart';
import 'package:delivery_courier_app/features/auth/data/services/database_service.dart';
import 'package:delivery_courier_app/features/auth/data/services/firebase_auth_service.dart';
import 'package:delivery_courier_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:delivery_courier_app/features/auth/domain/repos/auth_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<DataBaseService>(FirestoreService());

  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      firebaseAuthService: getIt<FirebaseAuthService>(),
      dataBaseService: getIt<DataBaseService>(),
    ),
  );
}
