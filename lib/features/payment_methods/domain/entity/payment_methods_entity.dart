class PaymentMethodsEntity {
  final String id;
  final String brand;
  final String last4;
  final String cardHolderName;

  PaymentMethodsEntity({
    required this.id,
    required this.brand,
    required this.last4,
    required this.cardHolderName,
  });
}
