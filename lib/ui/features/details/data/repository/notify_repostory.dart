import 'package:instantkhata_distributors/api/client.dart';
import 'dart:convert';
import 'package:http/http.dart';

class NotifyRepository {

  APIClient apiClient = new APIClient();

  Future<Map<String, dynamic>> sendNotification(String invoice) async {
    Response response = await this.apiClient.sendNotification(invoice);
    dynamic json = jsonDecode(response.body);
    return json;
  }

}