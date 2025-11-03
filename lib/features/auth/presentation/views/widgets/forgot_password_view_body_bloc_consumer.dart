import 'package:delivery_courier_app/core/helper_function/build_error_bar.dart';
import 'package:delivery_courier_app/core/widgets/custome_progress_hud.dart';
import 'package:delivery_courier_app/features/auth/presentation/cubits/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:delivery_courier_app/features/auth/presentation/views/check_email_view.dart';
import 'package:delivery_courier_app/features/auth/presentation/views/widgets/forgot_password_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordViewBodyBlocConsumer extends StatelessWidget {
  const ForgotPasswordViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
      listener: (context, state) {
        if (state is ForgotPasswordSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Password reset link sent!")),
          );
          Navigator.pushNamed(context, CheckEmailView.routeName);
        }
        if (state is ForgotPasswordFailure) {
          buildErrorBar(context, state.message);
        }
      },
      builder: (context, state) {
        return CustomeProgressHud(
          isLoading: state is ForgotPasswordLoading ? true : false,
          child: ForgotPasswordViewBody(),
        );
      },
    );
  }
}
