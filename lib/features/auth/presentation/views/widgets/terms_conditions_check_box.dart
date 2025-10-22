import 'package:delivery_courier_app/core/utilies/app_colors.dart';
import 'package:delivery_courier_app/core/utilies/app_text_styles.dart';
import 'package:delivery_courier_app/features/auth/presentation/views/widgets/custome_check_box.dart';
import 'package:flutter/material.dart';

class TermsConditionsCheckBox extends StatelessWidget {
  const TermsConditionsCheckBox({super.key, required this.onChanged});
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomeCheckBox(onChanged: onChanged),
        SizedBox(width: 16),
        //Checkbox(value: false, onChanged: (value) {}),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'By creating an account, you agree to ',
                  style: AppTextStyles.semiBold13.copyWith(
                    color: AppColors.secondaryColor,
                  ),
                ),
                TextSpan(
                  text: 'our',
                  style: AppTextStyles.semiBold13.copyWith(
                    color: AppColors.secondaryColor,
                  ),
                ),
                const TextSpan(text: ' ', style: AppTextStyles.semiBold13),
                TextSpan(
                  text: 'terms and conditions.',
                  style: AppTextStyles.semiBold13.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }
}
