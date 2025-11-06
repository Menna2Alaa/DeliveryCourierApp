import 'package:delivery_courier_app/core/widgets/custome_button.dart';
import 'package:delivery_courier_app/core/widgets/custome_text_form_field.dart';
import 'package:delivery_courier_app/features/payment_methods/data/models/payment_methods_model.dart';
import 'package:delivery_courier_app/features/payment_methods/presentation/cubits/payment_methods_cubit/add_new_payment_methods_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNewCardViewBody extends StatefulWidget {
  const AddNewCardViewBody({super.key});

  @override
  State<AddNewCardViewBody> createState() => _AddNewCardViewBodyState();
}

class _AddNewCardViewBodyState extends State<AddNewCardViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  late String cardHolderName, cardNumber, expiryDate, cvv;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: autovalidateMode,
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            CustomeTextFormField(
              onSaved: (value) {
                cardHolderName = value!;
              },
              hintText: 'CardHolder Name',
              textInputType: TextInputType.name,
            ),
            const SizedBox(height: 10),
            CustomeTextFormField(
              onSaved: (value) {
                cardNumber = value!;
              },
              hintText: 'Card Number',
              textInputType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CustomeTextFormField(
                    onSaved: (value) {
                      expiryDate = value!;
                    },
                    hintText: 'Expiry Date',
                    textInputType: TextInputType.datetime,
                  ),
                ),
                Expanded(
                  child: CustomeTextFormField(
                    onSaved: (value) {
                      cvv = value!;
                    },
                    hintText: 'CVV',
                    textInputType: TextInputType.number,
                  ),
                ),
              ],
            ),
            const Spacer(flex: 4),
            CustomeButton(
              onPressed: () {
                FocusScope.of(context).unfocus();
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  String brand = '';
                  if (cardNumber.startsWith('4')) {
                    brand = 'Visa';
                  } else if (cardNumber.startsWith('5')) {
                    brand = 'Mastercard';
                  } else {
                    brand = 'Unknown';
                  }

                  // Only last 4 digits
                  String last4 = cardNumber.length > 4
                      ? cardNumber.substring(cardNumber.length - 4)
                      : cardNumber;
                  context.read<AddNewPaymentMethodsCubit>().addNewPaymentMethod(
                    paymntMethod: PaymentMethodsModel(
                      expiryDate: expiryDate,
                      cvv: cvv,
                      brand: brand,

                      last4: last4,
                      cardHolderName: cardHolderName,
                    ),
                    userId: FirebaseAuth.instance.currentUser!.uid,
                  );
                } else {
                  setState(() => autovalidateMode = AutovalidateMode.always);
                }
              },
              text: "Add Card",
              width: double.infinity,
            ),
            const Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
