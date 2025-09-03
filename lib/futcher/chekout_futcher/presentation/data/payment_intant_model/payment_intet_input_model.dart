class PaymentIntetInputModel {
  final String amount;
  final String currency;
  final String customer_id;

  PaymentIntetInputModel({
    required this.amount,
    required this.currency,
    required this.customer_id,
  });

  tojson() {
    return {
      'amount': "${amount}00",
      'currency': currency,
      'customer': customer_id,
    };
  }
}
