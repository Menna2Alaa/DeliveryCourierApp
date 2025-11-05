import 'package:delivery_courier_app/core/helper_function/build_error_bar.dart';
import 'package:delivery_courier_app/core/widgets/custome_progress_hud.dart';
import 'package:delivery_courier_app/features/delivery/presentation/cubits/add_new_delivery_cubit/add_new_delivery_cubit.dart';
import 'package:delivery_courier_app/features/delivery/presentation/views/widgets/delivery_view_body.dart';
import 'package:delivery_courier_app/features/splash/presentation/views/widgets/main_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeliveryViewBodyBlocConsumer extends StatelessWidget {
  const DeliveryViewBodyBlocConsumer({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNewDeliveryCubit, AddNewDeliveryState>(
      listener: (BuildContext context, state) {
        if (state is AddNewDeliverySuccess) {
          Navigator.pushNamed(context, MainLayout.routeName);
        } else if (state is AddNewDeliveryFailure) {
          return buildErrorBar(context, 'can not add the package');
        }
      },
      builder: (BuildContext context, state) {
        return CustomeProgressHud(
          isLoading: state is AddNewDeliveryLoading ? true : false,
          child: SafeArea(child: const DeliveryViewBody()),
        );
      },
    );
  }
}
