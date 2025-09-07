import 'item.dart';

class ListItemModel {
  List<ItemOrderModel>? orders;

  ListItemModel({this.orders});

  factory ListItemModel.fromJson(Map<String, dynamic> json) => ListItemModel(
    orders: (json['items'] as List<dynamic>?)
        ?.map((e) => ItemOrderModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'items': orders?.map((e) => e.toJson()).toList(),
  };
}
