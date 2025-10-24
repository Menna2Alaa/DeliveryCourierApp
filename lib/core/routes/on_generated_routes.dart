import 'package:delivery_courier_app/features/auth/presentation/views/sign_in_view.dart';
import 'package:delivery_courier_app/features/auth/presentation/views/sign_up_view.dart';
import 'package:delivery_courier_app/features/home/preentation/views/home_view.dart';
import 'package:delivery_courier_app/features/onboarding/presentation/views/on_boarding_view.dart';
import 'package:delivery_courier_app/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (_) => const OnBoardingView());

    case SignInView.routeName:
      return MaterialPageRoute(builder: (_) => const SignInView());

    case SignUpView.routeName:
      return MaterialPageRoute(builder: (_) => const SignUpView());

    case HomeView.routeName:
      return MaterialPageRoute(builder: (_) => const HomeView());

    case SplashView.routeName:
      return MaterialPageRoute(builder: (_) => const SplashView());

    default:
      return MaterialPageRoute(builder: (_) => const Scaffold());
  }
}
