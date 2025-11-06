import 'package:delivery_courier_app/core/helper_function/build_error_bar.dart';
import 'package:delivery_courier_app/core/widgets/custome_progress_hud.dart';
import 'package:delivery_courier_app/features/payment_methods/presentation/cubits/payment_methods_cubit/add_new_payment_methods_cubit.dart';
import 'package:delivery_courier_app/features/payment_methods/presentation/views/widgets/add_new_card_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNewCardViewBodyBlocConsumer extends StatelessWidget {
  const AddNewCardViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNewPaymentMethodsCubit, AddNewPaymentMethodsState>(
      listener: (context, state) {
        if (state is AddNewPaymentMethodsSuccess) {
          Navigator.pop(context);
        }
        if (state is AddNewPaymentMethodsFailure) {
          buildErrorBar(context, state.message);
        }
      },
      builder: (context, state) {
        return CustomeProgressHud(
          isLoading: state is AddNewPaymentMethodsLoading ? true : false,
          child: const SafeArea(child: AddNewCardViewBody()),
        );
      },
    );
  }
}
