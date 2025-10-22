import 'package:delivery_courier_app/core/widgets/custome_text_form_field.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({super.key, this.onSaved});

  final void Function(String?)? onSaved;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obsecureText = true;
  @override
  Widget build(BuildContext context) {
    return CustomeTextFormField(
      obsecureText: obsecureText,
      onSaved: widget.onSaved,
      hintText: 'Enter your password',
      textInputType: TextInputType.visiblePassword,
      suffixIcon: GestureDetector(
        onTap: () {
          obsecureText = !obsecureText;
          setState(() {});
        },
        child: obsecureText
            ? const Icon(Icons.remove_red_eye, color: Color(0xff949D9E))
            : const Icon(Icons.visibility_off, color: Color(0xff949D9E)),
      ),
    );
  }
}
