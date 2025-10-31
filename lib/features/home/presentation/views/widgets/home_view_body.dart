import 'package:delivery_courier_app/core/utilies/app_text_styles.dart';
import 'package:delivery_courier_app/features/home/presentation/views/widgets/ads_banner_widget.dart';
import 'package:delivery_courier_app/features/home/presentation/views/widgets/high_related_couriers_list_view.dart';
import 'package:delivery_courier_app/features/home/presentation/views/widgets/search_package_by_id_bloc_listener.dart';
import 'package:delivery_courier_app/features/home/presentation/views/widgets/shipped_packages.dart';
import 'package:delivery_courier_app/features/packages/presentation/cubits/get_packages_cubit/get_packages_cubit.dart';
import 'package:delivery_courier_app/features/home/presentation/views/widgets/home_header_widget.dart';
import 'package:delivery_courier_app/features/home/presentation/views/widgets/home_app_bar_widget.dart';
import 'package:delivery_courier_app/core/widgets/background_widget.dart';
import 'package:delivery_courier_app/features/courier/presentation/cubits/get_all_couriers_cubit/get_all_couriers_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetPackagesCubit, GetPackageState>(
      builder: (context, packageState) {
        if (packageState is GetPackagesLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (packageState is GetPackagesSuccess) {
          final shippedPackages = packageState.packages
              .where((pkg) => pkg.deliveryStatus.toLowerCase() == 'shipped')
              .toList();

          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Stack(
                  children: [
                    const BackGroundWidget(heigth: 368),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const HomeAppBarWidget(),
                          const SizedBox(height: 80),

                          Text(
                            "Let's Track your package",
                            style: AppTextStyles.semiBold20.copyWith(
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 14),
                          SearchPackageByIdBlocListener(
                            searchController: _searchController,
                          ),

                          const SizedBox(height: 50),
                          const AdsBannerWidget(),
                          const SizedBox(height: 14),

                          HomeHeadersWidget(
                            text1: 'Current shipment',
                            text2: 'View all',
                            onTap: () {},
                          ),
                          const SizedBox(height: 12),

                          if (shippedPackages.isNotEmpty)
                            ShippedPackages(shippedPackages: shippedPackages)
                          else
                            const Text(
                              'No shipped packages yet.',
                              style: TextStyle(color: Colors.grey),
                            ),

                          const SizedBox(height: 28),
                          const HomeHeadersWidget(
                            text1: 'High related couriers',
                            text2: 'View all',
                          ),
                          const SizedBox(height: 12),

                          BlocBuilder<GetAllCouriersCubit, GetAllCouriersState>(
                            builder: (context, courierState) {
                              if (courierState is GetAllCouriersLoading) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else if (courierState
                                  is GetAllCouriersSuccess) {
                                final featuredCouriers = courierState.couriers
                                    .where(
                                      (courier) => courier.isFeatured == true,
                                    )
                                    .toList();

                                if (featuredCouriers.isEmpty) {
                                  return const Text(
                                    'No featured couriers available.',
                                    style: TextStyle(color: Colors.grey),
                                  );
                                }

                                return HighRelatedCouriersListView(
                                  highRelatedCouriers: featuredCouriers,
                                );
                              } else if (courierState
                                  is GetAllCouriersFailure) {
                                return Center(
                                  child: Text('Error: ${courierState.message}'),
                                );
                              }
                              return const SizedBox.shrink();
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        } else if (packageState is GetPackagesFailure) {
          return Center(child: Text('Error: ${packageState.message}'));
        }
        return const SizedBox.shrink();
      },
    );
  }
}
