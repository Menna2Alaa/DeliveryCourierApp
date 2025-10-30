import 'package:delivery_courier_app/core/utilies/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomeTextFormField extends StatelessWidget {
  const CustomeTextFormField({
    super.key,
    required this.hintText,
    required this.textInputType,
    this.suffixIcon,
    this.onSaved,
    this.obsecureText = false,
  });
  final String hintText;
  final TextInputType textInputType;
  final Widget? suffixIcon;
  final void Function(String?)? onSaved;
  final bool obsecureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: TextFormField(
        obscureText: obsecureText,
        onSaved: onSaved,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'This field is required';
          }
          return null;
        },
        keyboardType: textInputType,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle: AppTextStyles.regular13.copyWith(color: Color(0xff949D9E)),
          filled: true,
          fillColor: Colors.white70,
          border: buildBorder(),
          enabledBorder: buildBorder(),
          focusedBorder: buildBorder(),
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(width: 1, color: Color(0xffE6E9E9)),
    );
  }
}
