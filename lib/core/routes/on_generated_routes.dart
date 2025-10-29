import 'package:delivery_courier_app/features/auth/presentation/views/sign_in_view.dart';
import 'package:delivery_courier_app/features/auth/presentation/views/sign_up_view.dart';
import 'package:delivery_courier_app/features/home/presentation/views/home_view.dart';
import 'package:delivery_courier_app/features/onboarding/presentation/views/on_boarding_view.dart';
import 'package:delivery_courier_app/features/packages/domain/entity/package_entity.dart';
import 'package:delivery_courier_app/features/packages/presentation/views/package_details_view.dart';
import 'package:delivery_courier_app/features/packages/presentation/views/package_view.dart';
import 'package:delivery_courier_app/features/splash/presentation/views/splash_view.dart';
import 'package:delivery_courier_app/features/splash/presentation/views/widgets/main_layout.dart';
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

    case PackageView.routeName:
      return MaterialPageRoute(builder: (_) => const PackageView());

    case PackageDetailsView.routeName:
      final package = settings.arguments as PackageEntity?;
      return MaterialPageRoute(
        builder: (_) => PackageDetailsView(package: package),
      );

    case MainLayout.routeName:
      return MaterialPageRoute(builder: (_) => const MainLayout());

    default:
      return MaterialPageRoute(builder: (_) => const Scaffold());
  }
}
