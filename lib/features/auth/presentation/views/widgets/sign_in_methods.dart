import 'package:delivery_courier_app/features/auth/presentation/cubits/sign_in_cubit/sign_in_cubit.dart';
import 'package:delivery_courier_app/features/auth/presentation/views/widgets/social_login_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInMethods extends StatelessWidget {
  const SignInMethods({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialLoginButton(
          icon: Image.asset('assets/images/google_icon.png'),
          onPressed: () {
            context.read<SignInCubit>().signInWithGoogle();
          },
        ),
        const SizedBox(width: 12),
        SocialLoginButton(
          icon: Image.asset('assets/images/facebook_icon.png'),
          onPressed: () {
            context.read<SignInCubit>().signInWithFacebook();
          },
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
