import 'package:delivery_courier_app/core/utilies/app_text_styles.dart';
import 'package:delivery_courier_app/core/widgets/background_widget.dart';
import 'package:flutter/material.dart';

class NewDeliveryHeader extends StatelessWidget {
  const NewDeliveryHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackGroundWidget(heigth: 240),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 18),
          child: Text(
            'Add New Delivery',
            style: AppTextStyles.semiBold20.copyWith(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
