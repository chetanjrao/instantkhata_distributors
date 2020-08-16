import 'dart:convert';

import 'package:http/http.dart';
import 'package:instantkhata_distributors/api/client.dart';
import 'package:instantkhata_distributors/ui/features/salesman/data/models/salesman.dart';

class SalesmanRepository {

  APIClient apiClient = new APIClient();

  Future<List<SalesmanModel>> getSalesman() async {
    Response response = await this.apiClient.getSalesman();
    dynamic json = jsonDecode(response.body);
    List<SalesmanModel> retailers = json.map<SalesmanModel>((e) => SalesmanModel.fromJson(e)).toList();
    return retailers;
  }

}