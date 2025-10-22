import 'package:delivery_courier_app/features/auth/presentation/views/widgets/social_login_button.dart';
import 'package:flutter/material.dart';

class SignInMethods extends StatelessWidget {
  const SignInMethods({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialLoginButton(
          icon: Image.asset('assets/images/google_icon.png'),
          onPressed: () {},
        ),
        const SizedBox(width: 12),
        SocialLoginButton(
          icon: Image.asset('assets/images/facebook_icon.png'),
          onPressed: () {},
        ),
        const SizedBox(width: 12),
        SocialLoginButton(
          icon: Image.asset('assets/images/apple_icon.png'),
          onPressed: () {},
        ),
      ],
    );
  }
}
