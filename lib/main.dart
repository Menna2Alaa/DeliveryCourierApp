import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_courier_app/core/routes/on_generated_routes.dart';
import 'package:delivery_courier_app/core/services/custome_bloc_observer.dart';
import 'package:delivery_courier_app/core/services/get_it_service.dart';
import 'package:delivery_courier_app/core/services/shared_prefrences_singleton.dart';
import 'package:delivery_courier_app/features/courier/data/repos/courier_repo_impl.dart';
import 'package:delivery_courier_app/features/courier/presentation/cubits/add_courier_cubit/add_courier_cubit.dart';
import 'package:delivery_courier_app/features/packages/data/repos/package_repo_impl.dart';
import 'package:delivery_courier_app/features/packages/presentation/cubits/add_package_cubit/add_package_cubit.dart';
import 'package:delivery_courier_app/features/splash/presentation/views/splash_view.dart';
import 'package:delivery_courier_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = CustomeBlocObserver();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initializePackages();
  await initializeCouriers();
  await Pref.init();
  setupGetIt();
  runApp(const DeliveryCourierApp());
}

Future<void> initializePackages() async {
  try {
    final packageRepo = PackageRepoImpl(firestore: FirebaseFirestore.instance);
    final packageCubit = PackageCubit(packageRepo);
    await packageCubit.addPackage();
  } catch (e) {
    // Do nothing — fail silently to avoid breaking app startup
  }
}

Future<void> initializeCouriers() async {
  try {
    final courierRepo = CourierRepoImpl(firestore: FirebaseFirestore.instance);
    final courierCubit = AddCourierCubit(courierRepo);
    await courierCubit.addCourier();
  } catch (e) {
    // Do nothing — fail silently to avoid breaking app startup
  }
}

class DeliveryCourierApp extends StatelessWidget {
  const DeliveryCourierApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashView.routeName,

      home: const SplashView(),
    );
  }
}
