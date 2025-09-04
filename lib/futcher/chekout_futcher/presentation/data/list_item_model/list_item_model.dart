import 'item.dart';

class ListItemModel {
  List<Item>? items;

  ListItemModel({this.items});

  factory ListItemModel.fromJson(Map<String, dynamic> json) => ListItemModel(
    items: (json['items'] as List<dynamic>?)
        ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'items': items?.map((e) => e.toJson()).toList(),
  };
}
