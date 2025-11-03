import 'package:delivery_courier_app/core/utilies/assets.dart';
import 'package:delivery_courier_app/core/widgets/app_cards.dart';
import 'package:delivery_courier_app/features/courier/domain/entity/courier_entity.dart';
import 'package:delivery_courier_app/features/courier/presentation/views/courier_details_view.dart';
import 'package:flutter/material.dart';

class HighRelatedCouriersListView extends StatelessWidget {
  const HighRelatedCouriersListView({
    super.key,
    required this.highRelatedCouriers,
  });
  final List<CourierEntity> highRelatedCouriers;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: highRelatedCouriers.map((featuredCouriers) {
        return AppCards(
          height: 84,
          text1: featuredCouriers.name,
          text2:
              '${featuredCouriers.pickupLocation} . ${featuredCouriers.dropoffLocation}',
          text3: featuredCouriers.phone,
          leftIcon: Image.asset(Assets.assetsImagesCourier),
          onTap: () {
            Navigator.pushNamed(
              context,
              CourierDetailsView.routeName,
              arguments: featuredCouriers,
            );
          },
        );
      }).toList(),
    );

    // ListView.builder(
    //   shrinkWrap: true,
    //   physics: NeverScrollableScrollPhysics(),
    //   itemCount: 5,
    //   itemBuilder: (BuildContext context, int index) {
    //     return Padding(
    //       padding: const EdgeInsets.only(bottom: 8),
    //       child: AppCards(
    //         height: 84,
    //         text1: 'John Smith',
    //         text2: '01001563144',
    //         leftIcon: Image.asset(
    //           Assets.assetsImagesCourier,
    //           width: 20,
    //           height: 20,
    //           fit: BoxFit.fill,
    //         ),
    //       ),
    //     );
    //   },
    // );
  }
}
