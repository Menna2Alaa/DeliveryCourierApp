import 'package:delivery_courier_app/core/helper_function/on_generated_routes.dart';
import 'package:delivery_courier_app/features/onboarding/presentation/views/on_boarding_view.dart';
import 'package:delivery_courier_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const DeliveryCourierApp());
}

class DeliveryCourierApp extends StatelessWidget {
  const DeliveryCourierApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: OnBoardingView.routeName,

      home: const OnBoardingView(),
    );
  }
}
