import 'package:delivery_courier_app/core/widgets/custome_button.dart';
import 'package:flutter/material.dart';

class RatingSection extends StatelessWidget {
  const RatingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomeButton(onPressed: () {}, text: 'Courier Review', width: 140),
        Row(
          children: List.generate(
            5,
            (index) => Icon(
              Icons.star,
              color: index < 4
                  ? Colors.amber
                  : Colors.grey.shade300, // e.g. 4/5 stars
              size: 18,
            ),
          ),
        ),
      ],
    );
  }
}
