import 'package:delivery_courier_app/features/profile/presentation/views/widgets/profile_view_body.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  static const routeName = 'profile_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(child: Center(child: ProfileViewBody())),
    );
  }
}
