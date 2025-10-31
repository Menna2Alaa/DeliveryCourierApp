import 'package:delivery_courier_app/core/utilies/app_text_styles.dart';
import 'package:flutter/material.dart';

class TermsAndConditionsContent extends StatelessWidget {
  const TermsAndConditionsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.start,
      text: TextSpan(
        style: AppTextStyles.regular16.copyWith(
          color: Colors.grey[800],
          height: 1.6,
        ),
        children: [
          TextSpan(
            text: 'Welcome to Our Terms & Conditions\n\n',
            style: AppTextStyles.semiBold20.copyWith(color: Colors.black87),
          ),
          const TextSpan(
            text:
                'Please read these Terms and Conditions carefully before using our app.\n\n'
                'By accessing or using the app, you agree to be bound by these terms. If you disagree with any part of the terms, you may not access the app.\n\n',
          ),
          TextSpan(
            text: '1. Account Responsibility\n',
            style: AppTextStyles.semiBold20.copyWith(color: Colors.black),
          ),
          const TextSpan(
            text:
                'You are responsible for maintaining the confidentiality of your account and password.\n\n',
          ),
          TextSpan(
            text: '2. Service Usage\n',
            style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
          ),
          const TextSpan(
            text:
                'You agree not to misuse the app or interfere with its normal operation.\n\n',
          ),
          TextSpan(
            text: '3. Privacy\n',
            style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
          ),
          const TextSpan(
            text:
                'We value your privacy and only collect data necessary to provide our services.\n\n',
          ),
          TextSpan(
            text: '4. Limitation of Liability\n',
            style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
          ),
          const TextSpan(
            text:
                'We are not liable for indirect or consequential damages resulting from use of our app.\n\n',
          ),
          TextSpan(
            text: '5. Changes to Terms\n',
            style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
          ),
          const TextSpan(
            text:
                'We may update these terms at any time. Continued use of the app means you accept the changes.\n\n',
          ),
          const TextSpan(
            text: 'If you have questions, please contact our support team.\n',
          ),
        ],
      ),
    );
  }
}
