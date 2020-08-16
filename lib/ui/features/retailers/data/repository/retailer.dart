import 'dart:convert';

import 'package:http/http.dart';
import 'package:instantkhata_distributors/api/client.dart';
import 'package:instantkhata_distributors/ui/features/retailers/data/models/retailer.dart';

class RetailerRepository {

  APIClient apiClient = new APIClient();

  Future<List<RetailerModel>> getRetailers() async {
    Response response = await this.apiClient.getRetailers();
    dynamic json = jsonDecode(response.body);
    List<RetailerModel> retailers = json.map<RetailerModel>((e) => RetailerModel.fromJson(e)).toList();
    return retailers;
  }

}