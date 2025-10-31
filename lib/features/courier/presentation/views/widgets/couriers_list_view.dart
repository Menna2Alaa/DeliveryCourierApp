import 'package:delivery_courier_app/core/widgets/app_cards.dart';
import 'package:delivery_courier_app/features/courier/domain/entity/courier_entity.dart';
import 'package:delivery_courier_app/features/courier/presentation/cubits/get_all_couriers_cubit/get_all_couriers_cubit.dart';
import 'package:delivery_courier_app/features/courier/presentation/views/courier_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CouriersListView extends StatelessWidget {
  const CouriersListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllCouriersCubit, GetAllCouriersState>(
      builder: (context, state) {
        if (state is GetAllCouriersLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetAllCouriersSuccess) {
          if (state.couriers.isEmpty) {
            return const Center(child: Text('No couriers found'));
          }
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.couriers.length,
            itemBuilder: (context, index) {
              final courier = state.couriers[index];

              return Padding(
                padding: const EdgeInsets.only(left: 18, right: 18, bottom: 8),
                child: AppCards(
                  height: 84,
                  text1: courier.name,
                  leftIcon: Image.asset('assets/images/courier.png'),
                  text2:
                      '${courier.pickupLocation} • ${courier.dropoffLocation}',
                  text3: courier.estimatedTime,
                  text4: courier.phone,
                  onTap: () {
                    navigateToDetails(context, courier);
                  },
                ),
              );
            },
          );
        } else if (state is GetAllCouriersFailure) {
          return Center(child: Text(state.message));
        }
        return SizedBox.shrink();
      },
    );
  }

  void navigateToDetails(BuildContext context, CourierEntity courier) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CourierDetailsView(courier: courier),
      ),
    );
  }
}
