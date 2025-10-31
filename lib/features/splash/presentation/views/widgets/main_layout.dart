import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_courier_app/features/account/presentation/widgets/account_view_body.dart';
import 'package:delivery_courier_app/features/courier/data/repos/courier_repo_impl.dart';
import 'package:delivery_courier_app/features/courier/domain/repos/courier_repo.dart';
import 'package:delivery_courier_app/features/courier/presentation/cubits/get_all_couriers_cubit/get_all_couriers_cubit.dart';
import 'package:delivery_courier_app/features/courier/presentation/views/widgets/courier_view_body.dart';
import 'package:delivery_courier_app/features/delivery/data/repos/delivery_repo_impl.dart';
import 'package:delivery_courier_app/features/delivery/presentation/cubits/add_new_delivery_cubit/add_new_delivery_cubit.dart';
import 'package:delivery_courier_app/features/delivery/presentation/views/widgets/delivery_view_body_bloc_consumer.dart';
import 'package:delivery_courier_app/features/home/presentation/views/widgets/custome_bottom_navigation_bar.dart';
import 'package:delivery_courier_app/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:delivery_courier_app/features/packages/data/repos/package_repo_impl.dart';
import 'package:delivery_courier_app/features/packages/presentation/cubits/get_package_by_id/get_package_by_id_cubit.dart';
import 'package:delivery_courier_app/features/packages/presentation/cubits/get_packages_cubit/get_packages_cubit.dart';
import 'package:delivery_courier_app/features/packages/presentation/views/widgets/package_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});
  static const routeName = 'main_layout';

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  late final PackageRepoImpl packageRepo;
  late final DeliveryRepoImpl deliveryRepo;
  late final CourierRepo courierRepo;

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    packageRepo = PackageRepoImpl(firestore: FirebaseFirestore.instance);
    deliveryRepo = DeliveryRepoImpl(firestore: FirebaseFirestore.instance);
    courierRepo = CourierRepoImpl(firestore: FirebaseFirestore.instance);
  }

  void onTabChanged(int index) {
    setState(() => currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => GetPackagesCubit(packageRepo)..getAllPackages(),
        ),
        BlocProvider(create: (_) => GetPackageByIdCubit(packageRepo)),
        BlocProvider(create: (_) => AddNewDeliveryCubit(deliveryRepo)),
        BlocProvider(
          create: (_) => GetAllCouriersCubit(courierRepo)..getAllCouriers(),
        ),
      ],
      child: Scaffold(
        body: SafeArea(
          child: IndexedStack(
            index: currentIndex,
            children: const [
              HomeViewBody(),
              PackageViewBody(),
              CourierViewBody(),
              DeliveryViewBodyBlocConsumer(),
              AccountViewBody(),
            ],
          ),
        ),
        bottomNavigationBar: CustomeBottomNavigationBar(
          currentIndex: currentIndex,
          onTap: onTabChanged,
        ),
      ),
    );
  }
}
