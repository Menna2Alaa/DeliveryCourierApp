import 'package:delivery_courier_app/core/utilies/app_text_styles.dart';
import 'package:delivery_courier_app/core/widgets/background_widget.dart';
import 'package:delivery_courier_app/core/widgets/custome_search_text_field.dart';
import 'package:flutter/material.dart';

class CourierHeader extends StatelessWidget {
  const CourierHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackGroundWidget(heigth: 240),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'See all available couriers',
                style: AppTextStyles.semiBold20.copyWith(color: Colors.white),
              ),
              const SizedBox(height: 50),
              const CustomeSearchTextField(hintText: 'Search couriers..'),
            ],
          ),
        ),
      ],
    );
  }
}
