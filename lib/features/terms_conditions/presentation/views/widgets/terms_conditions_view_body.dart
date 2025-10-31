import 'package:delivery_courier_app/core/widgets/custome_button.dart';
import 'package:delivery_courier_app/features/terms_conditions/presentation/views/widgets/terms_conditions_content.dart';
import 'package:delivery_courier_app/features/terms_conditions/presentation/views/widgets/terms_conditions_header.dart';
import 'package:flutter/material.dart';

class TermsConditionsViewBody extends StatelessWidget {
  const TermsConditionsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        children: [
          const TermsAndConditionsHeader(),
          const SizedBox(height: 30),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TermsAndConditionsContent(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: CustomeButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      text: "Accept and Continue ",
                      width: double.infinity,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
