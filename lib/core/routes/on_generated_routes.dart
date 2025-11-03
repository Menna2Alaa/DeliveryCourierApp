import 'package:delivery_courier_app/features/auth/presentation/views/check_email_view.dart';
import 'package:delivery_courier_app/features/auth/presentation/views/forgot_password_view.dart';
import 'package:delivery_courier_app/features/auth/presentation/views/sign_in_view.dart';
import 'package:delivery_courier_app/features/auth/presentation/views/sign_up_view.dart';
import 'package:delivery_courier_app/features/courier/domain/entity/courier_entity.dart';
import 'package:delivery_courier_app/features/courier/presentation/views/courier_details_view.dart';
import 'package:delivery_courier_app/features/delivery/presentation/views/delivery_view.dart';
import 'package:delivery_courier_app/features/home/presentation/views/home_view.dart';
import 'package:delivery_courier_app/features/onboarding/presentation/views/on_boarding_view.dart';
import 'package:delivery_courier_app/features/packages/domain/entity/package_entity.dart';
import 'package:delivery_courier_app/features/packages/presentation/views/package_details_view.dart';
import 'package:delivery_courier_app/features/packages/presentation/views/package_view.dart';
import 'package:delivery_courier_app/features/profile/presentation/views/profile_view.dart';
import 'package:delivery_courier_app/features/splash/presentation/views/splash_view.dart';
import 'package:delivery_courier_app/features/splash/presentation/views/widgets/main_layout.dart';
import 'package:delivery_courier_app/features/terms_conditions/presentation/views/terms_conditions_view.dart';
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

    case DeliveryView.routeName:
      return MaterialPageRoute(builder: (_) => const DeliveryView());

    case CourierDetailsView.routeName:
      final courier = settings.arguments as CourierEntity?;
      return MaterialPageRoute(
        builder: (_) => CourierDetailsView(courier: courier),
      );

    case ProfileView.routeName:
      return MaterialPageRoute(builder: (_) => const ProfileView());

    case TermsAndConditionsView.routeName:
      return MaterialPageRoute(builder: (_) => const TermsAndConditionsView());

    case ForgotPasswordView.routeName:
      return MaterialPageRoute(builder: (_) => const ForgotPasswordView());

    case MainLayout.routeName:
      return MaterialPageRoute(builder: (_) => const MainLayout());

    case CheckEmailView.routeName:
      return MaterialPageRoute(builder: (_) => const CheckEmailView());

    default:
      return MaterialPageRoute(builder: (_) => const Scaffold());
  }
}
