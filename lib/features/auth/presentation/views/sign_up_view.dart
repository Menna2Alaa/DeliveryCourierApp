import 'package:delivery_courier_app/features/auth/presentation/views/widgets/sign_up_view_body.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static const String routeName = "signUpView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: const SafeArea(child: SignUpViewBody()));
  }
}
