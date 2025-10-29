import 'package:cloud_firestore/cloud_firestore.dart';
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
  final packageRepo = PackageRepoImpl(firestore: FirebaseFirestore.instance);

  late final List<Widget> screens;

  @override
  void initState() {
    super.initState();
    screens = [
      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => GetPackagesCubit(packageRepo)..getAllPackages(),
          ),
          BlocProvider(create: (_) => GetPackageByIdCubit(packageRepo)),
        ],
        child: const SafeArea(child: HomeViewBody()),
      ),

      BlocProvider(
        create: (_) => GetPackagesCubit(packageRepo)..getAllPackages(),
        child: const SafeArea(child: PackageViewBody()),
      ),

      const Center(child: Text('Couriers Screen')),
      const Center(child: Text('Delivery Screen')),
      const Center(child: Text('Profile Screen')),
    ];
  }

  int currentIndex = 0;

  void onTabChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(index: currentIndex, children: screens),
      ),
      bottomNavigationBar: CustomeBottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTabChanged,
      ),
    );
  }
}
