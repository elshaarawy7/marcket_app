// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tip.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tip _$TipFromJson(Map<String, dynamic> json) => Tip(
  id: json['id'] as String?,
  amount: (json['amount'] as num?)?.toDouble(),
  currency: json['currency'] as String?,
);

Map<String, dynamic> _$TipToJson(Tip instance) => <String, dynamic>{
  'id': instance.id,
  'amount': instance.amount,
  'currency': instance.currency,
};
