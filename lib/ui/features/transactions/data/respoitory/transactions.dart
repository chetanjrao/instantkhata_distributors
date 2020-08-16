import 'dart:convert';

import 'package:http/http.dart';
import 'package:instantkhata_distributors/api/client.dart';
import 'package:instantkhata_distributors/ui/features/transactions/data/models/transactions.dart';

class TransactionRepository {
  APIClient apiClient = new APIClient();
  
  Future<List<TransactionModel>> getTransactions() async {
    Response source = await apiClient.getTransactions();
    dynamic json = jsonDecode(source.body);
    List<TransactionModel> data = json.map<TransactionModel>((e) => TransactionModel.fromJson(e)).toList();
    return data;
  }

}