import 'package:equatable/equatable.dart';

class InventoryModel extends Equatable {
  
  final int id;
  final String name;
  final int type;
  final double mrp;
  final String hsn;
  final double basePrice;

  InventoryModel(this.id, this.name, this.type, this.mrp, this.hsn, this.basePrice);

  @override
  List<Object> get props => [id, name, type, mrp, hsn, basePrice];
  
  static InventoryModel fromJson(dynamic json) => InventoryModel(
    json["id"],
    json["name"],
    json["type"],
    json["mrp"],
    json["hsn"],
    json["base_price"]
  );

}

class CategoryModel extends Equatable {

  final int id;
  final String name;

  CategoryModel(this.id, this.name);

  @override
  List<Object> get props => [id, name];

  static CategoryModel fromJson(dynamic json) => CategoryModel(
    json["id"],
    json["name"]
  );

}