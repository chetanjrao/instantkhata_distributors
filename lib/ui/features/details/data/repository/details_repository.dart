import 'dart:convert';

import 'package:http/http.dart';
import 'package:instantkhata_distributors/api/client.dart';
import 'package:instantkhata_distributors/ui/features/details/data/models/details_model.dart';

class InvoiceInfoRepository {

  APIClient _apiClient = new APIClient();

  Future<InvoiceDetail> getInvoiceInfo(String invoiceID) async{
    Response _responseData = await _apiClient.getInvoiceInfo(invoiceID);
    dynamic parsedData = jsonDecode(_responseData.body);
    InvoiceDetail _invoiceInfo = await InvoiceDetail.fromJson(parsedData);
    return _invoiceInfo;
  }


  Future<bool> getNotificationsInfo(String invoiceID) async{
    Response _responseData = await _apiClient.getNotificationsInfo(invoiceID);
    dynamic parsedData = jsonDecode(_responseData.body);
    return parsedData["message"] == "done";
  }

}