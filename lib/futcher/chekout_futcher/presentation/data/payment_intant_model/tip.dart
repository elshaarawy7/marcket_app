// في ملف tip.dart
import 'package:json_annotation/json_annotation.dart';

part 'tip.g.dart';

@JsonSerializable()
class Tip {
  // اجعل جميع الخصائص اختيارية بإضافة '?'
  final String? id;
  final double? amount;
  final String? currency;

  Tip({this.id, this.amount, this.currency});

  factory Tip.fromJson(Map<String, dynamic> json) => _$TipFromJson(json);

  Map<String, dynamic> toJson() => _$TipToJson(this);
}
