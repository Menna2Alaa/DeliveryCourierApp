import 'package:delivery_courier_app/constants.dart';
import 'package:delivery_courier_app/features/auth/data/services/firebase_auth_service.dart';
import 'package:delivery_courier_app/core/services/shared_prefrences_singleton.dart';
import 'package:delivery_courier_app/core/utilies/assets.dart';
import 'package:delivery_courier_app/features/auth/presentation/views/sign_in_view.dart';
import 'package:delivery_courier_app/features/home/preentation/views/home_view.dart';
import 'package:delivery_courier_app/features/onboarding/presentation/views/on_boarding_view.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    executeNavigation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset(
        Assets.assetsImagesAppLogo,
        width: 100,
        height: 100,
      ),
    );
  }

  void executeNavigation() {
    bool isOnBoardingViewSeen = Pref.getBool(kIsOnBoardingViewSeen);
    Future.delayed(const Duration(seconds: 3), () {
      if (isOnBoardingViewSeen) {
        var isLoggedIn = FirebaseAuthService().isLoggedIn();
        if (isLoggedIn) {
          if (mounted) {
            Navigator.pushReplacementNamed(context, HomeView.routeName);
          }
        } else {
          if (mounted) {
            Navigator.pushReplacementNamed(context, SignInView.routeName);
          }
        }
      } else {
        if (mounted) {
          Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
        }
      }
    });
  }
}
