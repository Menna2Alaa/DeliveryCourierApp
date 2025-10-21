import 'package:delivery_courier_app/features/onboarding/presentation/views/on_boarding_view.dart';
import 'package:flutter/material.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (_) => OnBoardingView());

    default:
      return MaterialPageRoute(builder: (_) => Scaffold());
  }
}
