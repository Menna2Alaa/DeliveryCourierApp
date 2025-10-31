import 'package:delivery_courier_app/core/utilies/app_text_styles.dart';
import 'package:delivery_courier_app/features/courier/presentation/views/widgets/courier_header.dart';
import 'package:delivery_courier_app/features/courier/presentation/views/widgets/couriers_list_view.dart';
import 'package:flutter/material.dart';

class CourierViewBody extends StatelessWidget {
  const CourierViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CourierHeader(),
        const SizedBox(height: 8),
        const Padding(
          padding: EdgeInsets.only(left: 18),
          child: Text('Available couriers', style: AppTextStyles.medium16),
        ),
        const SizedBox(height: 12),
        const Expanded(child: CouriersListView()),
      ],
    );
  }
}
