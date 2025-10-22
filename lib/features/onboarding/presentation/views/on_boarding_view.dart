import 'package:delivery_courier_app/features/onboarding/presentation/views/widgets/on_boarding_view_body.dart';
import 'package:flutter/material.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});
  static const String routeName = 'onBoardingView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: const SafeArea(child: OnBoardingViewBody()));
  }
}
