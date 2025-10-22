import 'package:delivery_courier_app/features/auth/presentation/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:delivery_courier_app/features/auth/presentation/views/widgets/sign_up_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpViewBodyBlocConsumer extends StatelessWidget {
  const SignUpViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      builder: (BuildContext context, state) {
        return const SafeArea(child: SignUpViewBody());
      },
      listener: (BuildContext context, SignupState state) {},
    );
  }
}
