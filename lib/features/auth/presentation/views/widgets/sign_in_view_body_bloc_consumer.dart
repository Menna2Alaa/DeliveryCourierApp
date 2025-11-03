import 'package:delivery_courier_app/core/helper_function/build_error_bar.dart';
import 'package:delivery_courier_app/core/widgets/custome_progress_hud.dart';
import 'package:delivery_courier_app/features/auth/presentation/cubits/sign_in_cubit/sign_in_cubit.dart';
import 'package:delivery_courier_app/features/auth/presentation/views/widgets/sign_in_view_body.dart';
import 'package:delivery_courier_app/features/splash/presentation/views/widgets/main_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInviewBodyBlocConsumer extends StatelessWidget {
  const SignInviewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      builder: (BuildContext context, state) {
        return CustomeProgressHud(
          isLoading: state is SignInLoading ? true : false,
          child: SafeArea(child: const SignInViewBody()),
        );
      },
      listener: (BuildContext context, state) {
        if (state is SignInSuccess) {
          Navigator.pushReplacementNamed(context, MainLayout.routeName);
        }
        if (state is SignInFailure) {
          buildErrorBar(context, state.message);
        }
      },
    );
  }
}
