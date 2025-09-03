import 'tip.dart';

class AmountDetails {
  final Tip? tip; // <-- اجعلها اختيارية

  AmountDetails({this.tip});

  factory AmountDetails.fromJson(Map<String, dynamic> json) {
    return AmountDetails(
      tip: json['tip'] == null ? null : Tip.fromJson(json['tip']),
    );
  }

  Map<String, dynamic> toJson() => {if (tip != null) 'tip': tip!.toJson()};
}
