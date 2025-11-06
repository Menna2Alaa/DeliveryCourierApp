class PaymentMethodsEntity {
  final String brand;
  final String last4;
  final String cardHolderName;
  final String? expiryDate;
  final String? cvv;

  PaymentMethodsEntity({
    this.expiryDate,
    this.cvv,
    required this.brand,
    required this.last4,
    required this.cardHolderName,
  });
}
