import 'package:delivery_courier_app/features/payment_methods/domain/entity/payment_methods_entity.dart';

class PaymentMethodsModel extends PaymentMethodsEntity {
  PaymentMethodsModel({
    super.expiryDate,
    super.cvv,
    required super.brand,
    required super.last4,
    required super.cardHolderName,
  });

  factory PaymentMethodsModel.fromMap(Map<String, dynamic> map) =>
      PaymentMethodsModel(
        expiryDate: map['expiryDate'],
        cvv: map['cvv'],
        brand: map['brand'] ?? "",
        last4: map['last4'] ?? "",
        cardHolderName: map['cardHolderName'] ?? "",
      );

  Map<String, dynamic> toMap() => {
    'brand': brand,
    'last4': last4,
    'cardHolderName': cardHolderName,
    'expiryDate': expiryDate,
    'cvv': cvv,
  };
}
