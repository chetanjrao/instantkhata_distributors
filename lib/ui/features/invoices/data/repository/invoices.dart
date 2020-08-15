import 'dart:convert';

import 'package:http/http.dart';
import 'package:instantkhata_distributors/api/client.dart';
import 'package:instantkhata_distributors/ui/features/invoices/data/models/invoices.dart';

class InvoiceRepository {

  APIClient apiClient = new APIClient();


  Future<List<InvoiceModel>> getInvoices() async {
    Response response = await this.apiClient.getInvoices();
    dynamic json = jsonDecode(response.body);
    List<InvoiceModel> invoices = json.map<InvoiceModel>((e) =>  InvoiceModel.fromJson(e)).toList();
    return invoices;
  }

}