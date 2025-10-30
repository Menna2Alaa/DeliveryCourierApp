import 'package:delivery_courier_app/core/utilies/app_text_styles.dart';
import 'package:delivery_courier_app/core/widgets/background_widget.dart';
import 'package:delivery_courier_app/core/widgets/custome_search_text_field.dart';
import 'package:delivery_courier_app/features/packages/presentation/views/widgets/packages_list_view.dart';
import 'package:flutter/material.dart';

class PackageViewBody extends StatelessWidget {
  const PackageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            BackGroundWidget(heigth: 240),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 18),

              child: Column(
                children: [
                  Align(
                    alignment: AlignmentGeometry.topLeft,
                    child: Text(
                      "Check your package",
                      style: AppTextStyles.semiBold20.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 45),
                  const CustomeSearchTextField(
                    hintText: 'Serch about your packages..',
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        const Expanded(child: PackagesListView()),
      ],
    );
  }
}
