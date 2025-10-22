import 'package:flutter/material.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });
  final Widget icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        shape: BoxShape.circle,
      ),
      child: IconButton(onPressed: onPressed, icon: icon),
    );
  }
}
