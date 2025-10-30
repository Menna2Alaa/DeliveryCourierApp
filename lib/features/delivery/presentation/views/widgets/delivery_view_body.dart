import 'package:delivery_courier_app/core/widgets/custome_button.dart';
import 'package:delivery_courier_app/core/widgets/custome_text_form_field.dart';
import 'package:delivery_courier_app/features/delivery/data/model/delivery_model.dart';
import 'package:delivery_courier_app/features/delivery/presentation/cubits/add_new_delivery_cubit/add_new_delivery_cubit.dart';
import 'package:delivery_courier_app/features/delivery/presentation/views/widgets/new_delivery_header.dart';
import 'package:delivery_courier_app/features/packages/data/models/package_model.dart';
import 'package:delivery_courier_app/features/packages/presentation/cubits/get_packages_cubit/get_packages_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeliveryViewBody extends StatefulWidget {
  const DeliveryViewBody({super.key});

  @override
  State<DeliveryViewBody> createState() => _DeliveryViewBodyState();
}

class _DeliveryViewBodyState extends State<DeliveryViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String pkgContent,
      pkgSize,
      pkgWeight,
      recieverName,
      recieverPhone,
      recieverAddress,
      recieverLocation,
      deliveryType,
      paymentDetails,
      priceDetails;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          children: [
            const NewDeliveryHeader(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              child: Column(
                children: [
                  CustomeTextFormField(
                    onSaved: (value) {
                      pkgContent = value!;
                    },
                    hintText: 'Package Content',
                    textInputType: TextInputType.text,
                  ),
                  CustomeTextFormField(
                    onSaved: (value) {
                      pkgSize = value!;
                    },
                    hintText: 'Package Size',
                    textInputType: TextInputType.text,
                  ),
                  CustomeTextFormField(
                    onSaved: (value) {
                      pkgWeight = value!;
                    },
                    hintText: 'Package weight',
                    textInputType: TextInputType.text,
                  ),
                  CustomeTextFormField(
                    onSaved: (value) {
                      recieverName = value!;
                    },
                    hintText: 'Reciever Name',
                    textInputType: TextInputType.name,
                  ),
                  CustomeTextFormField(
                    onSaved: (value) {
                      recieverPhone = value!;
                    },
                    hintText: 'Reciever Phone',
                    textInputType: TextInputType.number,
                  ),
                  CustomeTextFormField(
                    onSaved: (value) {
                      recieverAddress = value!;
                    },
                    hintText: 'Reciever address',
                    textInputType: TextInputType.text,
                  ),
                  CustomeTextFormField(
                    onSaved: (value) {
                      recieverLocation = value!;
                    },
                    hintText: 'Reciever Location',
                    textInputType: TextInputType.text,
                  ),
                  CustomeTextFormField(
                    onSaved: (value) {
                      deliveryType = value!;
                    },
                    hintText: 'Delivery type',
                    textInputType: TextInputType.text,
                  ),
                  CustomeTextFormField(
                    onSaved: (value) {
                      paymentDetails = value!;
                    },
                    hintText: 'Payment Method',
                    textInputType: TextInputType.text,
                  ),
                  CustomeTextFormField(
                    onSaved: (value) {
                      priceDetails = value!;
                    },
                    hintText: 'Price Details',
                    textInputType: TextInputType.text,
                  ),
                  CustomeButton(
                    onPressed: () {
                      FocusScope.of(context).unfocus();

                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();

                        final package = PackageModel(
                          pkgId:
                              '#PKG-${DateTime.now().millisecondsSinceEpoch}',
                          content: pkgContent,
                          size: pkgSize,
                          weight: pkgWeight,
                          totalPrice: priceDetails,
                          deliveryStatus: deliveryType,
                          paymentDetails: paymentDetails,
                          receiverName: recieverName,
                          phoneNumber: recieverPhone,
                          address: recieverAddress,
                          location: recieverLocation,
                        );

                        final delivery = DeliveryModel(
                          deliveryType: deliveryType,
                          packageEntity: package,
                        );

                        context.read<AddNewDeliveryCubit>().addNewDelivery(
                          delivery,
                        );
                        context.read<GetPackagesCubit>().getAllPackages();
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                    },
                    text: 'Confirm',
                    width: double.infinity,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
