import 'package:delivery_courier_app/core/utilies/app_text_styles.dart';
import 'package:delivery_courier_app/features/auth/presentation/views/sign_in_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  @override
  void initState() {
    executeNavigation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/images/onboarding_image.png',
            fit: BoxFit.cover,
          ),
        ),

        Positioned.fill(
          child: Container(color: Colors.black.withValues(alpha: 0.5)),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  'assets/images/onboarding_logo.svg',
                  height: 40,
                ),
              ),
              const Spacer(),

              Text(
                'Request delivery in few clicks',
                style: AppTextStyles.bold28.copyWith(color: Colors.white),
              ),
              const SizedBox(height: 10),
              Text(
                'On-demand delivery whenever and wherever the need arises.',
                style: AppTextStyles.medium16.copyWith(
                  color: Colors.white70,
                  height: 1.4,
                ),
              ),

              const Spacer(),
            ],
          ),
        ),
      ],
    );
  }

  void executeNavigation() {
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, SignInView.routeName);
      }
    });
  }
}
