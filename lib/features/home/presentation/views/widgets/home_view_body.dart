import 'package:delivery_courier_app/core/utilies/app_text_styles.dart';
import 'package:delivery_courier_app/core/utilies/assets.dart';
import 'package:delivery_courier_app/features/home/presentation/views/widgets/ads_banner_widget.dart';
import 'package:delivery_courier_app/features/home/presentation/views/widgets/high_related_couriers_list_view.dart';
import 'package:delivery_courier_app/features/packages/presentation/views/widgets/package_card.dart';
import 'package:delivery_courier_app/features/home/presentation/views/widgets/home_header_widget.dart';
import 'package:delivery_courier_app/core/widgets/custome_search_text_field.dart';
import 'package:delivery_courier_app/features/home/presentation/views/widgets/home_app_bar_widget.dart';
import 'package:delivery_courier_app/core/widgets/background_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Stack(
            children: [
              const BackGroundWidget(heigth: 368),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  children: [
                    const HomeAppBarWidget(),
                    const SizedBox(height: 80),

                    Align(
                      alignment: AlignmentGeometry.topLeft,
                      child: Text(
                        "Let's Track your package",
                        style: AppTextStyles.semiBold20.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),
                    const CustomeSearchTextField(
                      hintText: 'Enter your trackig number',
                    ),

                    const SizedBox(height: 50),
                    const AdsBannerWidget(),
                    const SizedBox(height: 14),
                    const HomeHeadersWidget(
                      text1: 'Current shipment',
                      text2: 'View all',
                    ),
                    const SizedBox(height: 12),

                    PackageCard(
                      text1: '#HWDSF776567DS',
                      text2: 'On the way . 24 June',
                      leftIcon: SvgPicture.asset(
                        Assets.assetsImagesPackageIcon,
                      ),
                    ),
                    const SizedBox(height: 28),
                    const HomeHeadersWidget(
                      text1: 'High related couriers',
                      text2: 'View all',
                    ),
                    const SizedBox(height: 12),
                    const HighRelatedCouriersListView(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
