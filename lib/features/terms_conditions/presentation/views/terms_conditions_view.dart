import 'package:delivery_courier_app/features/terms_conditions/presentation/views/widgets/terms_conditions_view_body.dart';
import 'package:flutter/material.dart';

class TermsAndConditionsView extends StatelessWidget {
  const TermsAndConditionsView({super.key});
  static const routeName = 'terms_conditions_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: const Center(child: TermsConditionsViewBody())),
    );
  }
}
