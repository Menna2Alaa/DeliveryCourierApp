import 'package:delivery_courier_app/core/helper_function/build_error_bar.dart';
import 'package:delivery_courier_app/core/widgets/custome_progress_hud.dart';
import 'package:delivery_courier_app/features/auth/presentation/cubits/update_user_data_cubit/update_user_data_cubit.dart';
import 'package:delivery_courier_app/features/auth/presentation/views/sign_in_view.dart';
import 'package:delivery_courier_app/features/profile/presentation/views/widgets/profile_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileViewBodyBlocConsumer extends StatelessWidget {
  const ProfileViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateUserDataCubit, UpdateUserDataState>(
      listener: (BuildContext context, state) {
        if (state is UpdateUserDataSuccess) {
          Navigator.pushReplacementNamed(context, SignInView.routeName);
        } else if (state is UpdateUserDataFailure) {
          buildErrorBar(context, state.message);
        }
      },
      builder: (BuildContext context, state) {
        return CustomeProgressHud(
          isLoading: state is UpdateUserDataLoading ? true : false,
          child: const SafeArea(child: ProfileViewBody()),
        );
      },
    );
  }
}
