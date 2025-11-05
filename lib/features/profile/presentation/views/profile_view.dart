import 'package:delivery_courier_app/core/services/get_it_service.dart';
import 'package:delivery_courier_app/features/auth/domain/repos/auth_repo.dart';
import 'package:delivery_courier_app/features/auth/presentation/cubits/update_user_data_cubit/update_user_data_cubit.dart';
import 'package:delivery_courier_app/features/profile/presentation/views/widgets/profile_view_body_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  static const routeName = 'profile_view';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UpdateUserDataCubit(authRepo: getIt<AuthRepo>()),
      child: Scaffold(
        body: const SafeArea(
          child: Center(child: ProfileViewBodyBlocConsumer()),
        ),
      ),
    );
  }
}
