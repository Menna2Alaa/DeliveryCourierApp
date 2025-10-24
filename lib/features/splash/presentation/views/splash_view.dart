import 'package:delivery_courier_app/features/splash/presentation/views/widgets/splash_view_body.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});
  static const routeName = 'splashView';

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff7A7A7A),
      body: SafeArea(child: const SplashViewBody()),
    );
  }
}
