import 'package:delivery_courier_app/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String routeName = 'homeView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //bottomNavigationBar: CustomeBottomNavigationBar(),
      body: const SafeArea(child: HomeViewBody()),
    );
  }
}
