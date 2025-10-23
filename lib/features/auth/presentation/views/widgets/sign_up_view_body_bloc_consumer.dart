import 'package:delivery_courier_app/core/helper_function/build_error_bar.dart';
import 'package:delivery_courier_app/core/widgets/custome_progress_hud.dart';
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
        return CustomeProgressHud(
          isLoading: state is SignupLoading ? true : false,
          child: const SafeArea(child: SignUpViewBody()),
        );
      },
      listener: (BuildContext context, SignupState state) {
        if (state is SignupSuccess) {
          Navigator.pop(context);
        }
        if (state is SignupFailure) {
          buildErrorBar(context, state.message);
        }
      },
    );
  }
}
