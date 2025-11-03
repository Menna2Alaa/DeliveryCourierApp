import 'package:delivery_courier_app/core/utilies/assets.dart';
import 'package:delivery_courier_app/features/auth/presentation/views/widgets/check_email_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CheckEmailView extends StatelessWidget {
  const CheckEmailView({super.key});
  static const String routeName = 'check-email_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Check your email'),
        centerTitle: true,
        leading: IconButton(
          icon: SvgPicture.asset(
            Assets.assetsImagesLeftArrow,
            height: 32,
            width: 32,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: const SafeArea(child: CheckEmailViewBody()),
    );
  }
}
