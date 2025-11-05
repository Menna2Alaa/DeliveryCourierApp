import 'package:delivery_courier_app/features/payment_methods/domain/entity/payment_methods_entity.dart';

class PaymentMethodsModel extends PaymentMethodsEntity {
  PaymentMethodsModel({
    required super.id,
    required super.brand,
    required super.last4,
    required super.cardHolderName,
  });

  factory PaymentMethodsModel.fromMap(Map<String, dynamic> map) =>
      PaymentMethodsModel(
        id: map['id'],
        brand: map['brand'],
        last4: map['last4'],
        cardHolderName: map['cardHolder'],
      );

  Map<String, dynamic> toMap() => {
    'id': id,
    'brand': brand,
    'last4': last4,
    'cardHolderName': cardHolderName,
  };
}
