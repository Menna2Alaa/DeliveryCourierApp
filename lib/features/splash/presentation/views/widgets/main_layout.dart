import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_courier_app/features/packages/data/repos/package_repo_impl.dart';
import 'package:delivery_courier_app/features/packages/presentation/cubits/get_packages_cubit/get_packages_cubit.dart';
import 'package:flutter/material.dart';
import 'package:delivery_courier_app/features/home/presentation/views/widgets/custome_bottom_navigation_bar.dart';
import 'package:delivery_courier_app/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:delivery_courier_app/features/packages/presentation/views/widgets/package_view_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});
  static const routeName = 'main_layout';

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int currentIndex = 0;

  final List<Widget> screens = [
    BlocProvider(
      create: (BuildContext context) => GetPackagesCubit(
        PackageRepoImpl(firestore: FirebaseFirestore.instance),
      )..getAllPackages(),
      child: const SafeArea(child: HomeViewBody()),
    ),
    BlocProvider(
      create: (BuildContext context) => GetPackagesCubit(
        PackageRepoImpl(firestore: FirebaseFirestore.instance),
      )..getAllPackages(),
      child: const SafeArea(child: PackageViewBody()),
    ),
    Center(child: Text('Couriers Screen')), // Replace with CouriersViewBody
    Center(child: Text('Delivery Screen')), // Replace with DeliveryViewBody
    Center(child: Text('Profile Screen')), // Replace with ProfileViewBody
  ];

  void onTabChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          // keeps state of each screen
          index: currentIndex,
          children: screens,
        ),
      ),
      bottomNavigationBar: CustomeBottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTabChanged,
      ),
    );
  }
}
