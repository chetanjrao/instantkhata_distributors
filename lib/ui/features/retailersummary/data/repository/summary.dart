import 'dart:convert';

import 'package:http/http.dart';
import 'package:instantkhata_distributors/api/client.dart';
import 'package:instantkhata_distributors/ui/features/retailersummary/data/models/summary.dart';

class SummaryRepository {

  APIClient apiClient = new APIClient();

  Future<SummaryModel> getSummary(int retailer) async {
    Response response = await this.apiClient.getRetailerSummary(retailer);
    dynamic json = jsonDecode(response.body);
    SummaryModel summary = SummaryModel.fromJson(json);
    return summary;
  }

}