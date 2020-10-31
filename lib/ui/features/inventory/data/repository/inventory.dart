import 'dart:convert';

import 'package:http/http.dart';
import 'package:instantkhata_distributors/api/client.dart';
import 'package:instantkhata_distributors/ui/features/inventory/data/models/inventory.dart';

class InventoryRepository {
  final APIClient apiClient = new APIClient();

  Future<List<InventoryModel>> getInventory() async {
    Response response = await this.apiClient.getInventory();
    dynamic json = jsonDecode(response.body);
    print(json);
    List<InventoryModel> inventory =
        json.map<InventoryModel>((e) => InventoryModel.fromJson(e)).toList();
    return inventory;
  }

  Future<List<CategoryModel>> getCategories() async {
    Response response = await this.apiClient.getCategories();
    dynamic json = jsonDecode(response.body);
    List<CategoryModel> categories =
        json.map<CategoryModel>((e) => CategoryModel.fromJson(e)).toList();
    return categories;
  }

  Future<dynamic> addCategory(String name) async {
    Response response = await this.apiClient.addCategory(name);
    dynamic json = jsonDecode(response.body);
    return json;
  }

  Future<dynamic> addNewInventory(String name, double mrp, String hsn,
      double basePrice, int type, int quantity) async {
    Response response = await this
        .apiClient
        .addNewInventory(name, mrp, hsn, basePrice, type, quantity);
    dynamic json = jsonDecode(response.body);
    return json;
  }
}
