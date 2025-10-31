import 'package:delivery_courier_app/core/utilies/assets.dart';
import 'package:delivery_courier_app/core/widgets/app_cards.dart';
import 'package:flutter/material.dart';

class HighRelatedCouriersListView extends StatelessWidget {
  const HighRelatedCouriersListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: AppCards(
            height: 84,
            text1: 'John Smith',
            text2: '01001563144',
            leftIcon: Image.asset(
              Assets.assetsImagesCourier,
              width: 20,
              height: 20,
              fit: BoxFit.fill,
            ),
          ),
        );
      },
    );
  }
}
