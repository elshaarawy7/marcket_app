class ItemOrderModel {
  String? name;
  int? quantity;
  String? price;
  String? currency;

  ItemOrderModel({this.name, this.quantity, this.price, this.currency});

  factory ItemOrderModel.fromJson(Map<String, dynamic> json) => ItemOrderModel(
    name: json['name'] as String?,
    quantity: json['quantity'] as int?,
    price: json['price'] as String?,
    currency: json['currency'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'quantity': quantity,
    'price': price,
    'currency': currency,
  };
}
