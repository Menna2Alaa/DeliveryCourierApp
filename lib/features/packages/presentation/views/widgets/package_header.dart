import 'package:delivery_courier_app/core/utilies/app_text_styles.dart';
import 'package:delivery_courier_app/core/widgets/background_widget.dart';
import 'package:delivery_courier_app/core/widgets/custome_search_text_field.dart';
import 'package:flutter/material.dart';

class PackageHeader extends StatelessWidget {
  const PackageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackGroundWidget(heigth: 240),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Packages',
                style: AppTextStyles.semiBold20.copyWith(color: Colors.white),
              ),
              const SizedBox(height: 60),
              const CustomeSearchTextField(
                hintText: 'Search, or Filter your packages',
              ),
            ],
          ),
        ),
        //CustomeSearchTextField(hintText: 'Search, or Filter your packages'),
      ],
    );
  }
}
