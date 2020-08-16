import 'dart:convert';
import 'package:http/src/response.dart';
import 'package:instantkhata_distributors/api/client.dart';
import 'package:instantkhata_distributors/ui/features/statistics/data/models/statistics_models.dart';

class StatisticsRepository {
  final APIClient _apiClient = new APIClient();

  Future<Statistics> getStatisticsData(int distributor) async {
    Response _response = await _apiClient.getDashboardStatistics(distributor);
    Statistics _statistics = Statistics.fromJson(jsonDecode(_response.body));
    return _statistics;
  }

  Future<List<RecentTransactions>> getRecentTransactions(int distributor) async {
    Response _response = await _apiClient.getSalesmanTransactions(distributor);
    List<dynamic> _parsedJson = jsonDecode(_response.body);
    List<RecentTransactions> _transactions = _parsedJson.map((e) => RecentTransactions.fromJson(e)).toList();
    return _transactions;
  }

  Future<List<SingleInvoice>> getInvoices(int distributor) async {
    Response _response = await _apiClient.getSalesmanInvoices(distributor);
    List<dynamic> _parsedJson = jsonDecode(_response.body);
    List<SingleInvoice> _transactions = _parsedJson.map((e) => SingleInvoice.fromJson(e)).toList();
    return _transactions;
  }
}
