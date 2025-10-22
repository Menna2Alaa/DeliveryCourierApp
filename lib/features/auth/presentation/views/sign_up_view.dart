import 'package:delivery_courier_app/core/services/get_it_service.dart';
import 'package:delivery_courier_app/features/auth/domain/repos/auth_repo.dart';
import 'package:delivery_courier_app/features/auth/presentation/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:delivery_courier_app/features/auth/presentation/views/widgets/sign_up_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static const String routeName = "signUpView";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SignupCubit(getIt<AuthRepo>()),
      child: Scaffold(body: const SafeArea(child: SignUpViewBody())),
    );
  }
}
