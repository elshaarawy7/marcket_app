class Metadata {
  String? orderId; // أو أي key متوقع، وممكن تسيبه فاضي لو مش محتاجه

  Metadata({this.orderId});

  factory Metadata.fromJson(Map<String, dynamic> json) {
    return Metadata(
      orderId: json['orderId'] as String?, // أو أي key انت ضايفه
    );
  }

  Map<String, dynamic> toJson() {
    return {'orderId': orderId};
  }
}
