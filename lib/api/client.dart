import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:instantkhata_distributors/ui/utils/constants.dart';

class APIClient {
  final String accessToken =
      "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNTk3OTQ4Nzc2LCJqdGkiOiJmNGNlMTliNDVkMWY0NzI5OWE5ZTcyNmFhNGU1ODk5ZCIsInVzZXJfaWQiOjF9.dH2pzDoxYtyxoT4TmWnIIwjCWQXEXUbQBQthUyfOORQ";
  final String refreshToken =
      "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYwMDU0MDc3NiwianRpIjoiMzEyMDY2ZWFiZmZkNGJlZjgyMDQ2ZmY1OGFmNGY1YmUiLCJ1c2VyX2lkIjoxfQ.L_rHsNAzuk4cE6s-uxVmaVl8sdjh9eh85vHt_O98mqM";

  Future<http.Response> getInventory() async {
    print("$CONTEXT_API_URL/inventory/");
    return http.get("$CONTEXT_API_URL/inventory/", headers: {
      HttpHeaders.authorizationHeader: "Bearer $accessToken",
      HttpHeaders.contentTypeHeader: "application/json"
    });
  }

  Future<http.Response> getCategories() async {
    return http.get("$CONTEXT_API_URL/inventory/types/", headers: {
      HttpHeaders.authorizationHeader: "Bearer $accessToken",
      HttpHeaders.contentTypeHeader: "application/json"
    });
  }

  Future<http.Response> getInvoices() async {
    return http.get("$CONTEXT_API_URL/invoices/", headers: {
      HttpHeaders.authorizationHeader: "Bearer $accessToken",
      HttpHeaders.contentTypeHeader: "application/json"
    });
  }

  Future<http.Response> getInvoiceInfo(String invoice) async {
    return http.get("$CONTEXT_API_URL/invoices/info/$invoice/", headers: {
      HttpHeaders.authorizationHeader: "Bearer $accessToken",
      HttpHeaders.contentTypeHeader: "application/json"
    });
  }

  Future<http.Response> getNotificationsInfo(String invoice) async {
    return http.post("$CONTEXT_API_URL/invoices/notify/check/",
        headers: {
          HttpHeaders.authorizationHeader: "Bearer $accessToken",
          HttpHeaders.contentTypeHeader: "application/json"
        },
        body: jsonEncode({"invoice": invoice}));
  }

  Future<http.Response> getTransactions() async {
    return http.get("$CONTEXT_API_URL/transactions/", headers: {
      HttpHeaders.authorizationHeader: "Bearer $accessToken",
      HttpHeaders.contentTypeHeader: "application/json"
    });
  }

  Future<http.Response> getRetailers() async {
    return http.get("$CONTEXT_API_URL/retailers/", headers: {
      HttpHeaders.authorizationHeader: "Bearer $accessToken",
      HttpHeaders.contentTypeHeader: "application/json"
    });
  }

  Future<http.Response> getSalesman() async {
    return http.get("$CONTEXT_API_URL/salesman/", headers: {
      HttpHeaders.authorizationHeader: "Bearer $accessToken",
      HttpHeaders.contentTypeHeader: "application/json"
    });
  }

  Future<http.Response> getRetailerSummary(int retailer) async {
    return http.get("$CONTEXT_API_URL/retailers/$retailer/", headers: {
      HttpHeaders.authorizationHeader: "Bearer $accessToken",
      HttpHeaders.contentTypeHeader: "application/json"
    });
  }

  Future<http.Response> getDashboardStatistics(int salesman) async {
    return http.post("$CONTEXT_API_URL/salesman/analytics/",
        headers: {
          HttpHeaders.authorizationHeader: "Bearer $accessToken",
          HttpHeaders.contentTypeHeader: "application/json"
        },
        body: jsonEncode({"salesman": salesman}));
  }

  Future<http.Response> getSalesmanInvoices(int salesman) async {
    return http.post("$CONTEXT_API_URL/salesman/invoices/",
        headers: {
          HttpHeaders.authorizationHeader: "Bearer $accessToken",
          HttpHeaders.contentTypeHeader: "application/json"
        },
        body: jsonEncode({"salesman": salesman}));
  }

  Future<http.Response> getSalesmanTransactions(int salesman) async {
    return http.post("$CONTEXT_API_URL/salesman/transactions/",
        headers: {
          HttpHeaders.authorizationHeader: "Bearer $accessToken",
          HttpHeaders.contentTypeHeader: "application/json"
        },
        body: jsonEncode({"salesman": salesman}));
  }

  Future<http.Response> sendNotification(String invoice) async {
    return http.post("$CONTEXT_API_URL/invoices/notify/",
        headers: {
          HttpHeaders.authorizationHeader: "Bearer $accessToken",
          HttpHeaders.contentTypeHeader: "application/json"
        },
        body: jsonEncode({"invoice": invoice}));
  }

  Future<http.Response> addCategory(String name) async {
    return http.post("$CONTEXT_API_URL/inventory/types/",
        headers: {
          HttpHeaders.authorizationHeader: "Bearer $accessToken",
          HttpHeaders.contentTypeHeader: "application/json"
        },
        body: jsonEncode({"name": name}));
  }

  Future<http.Response> addNewInventory(String name, double mrp, String hsn,
      double basePrice, int type, int quantity) async {
    return http.post("$CONTEXT_API_URL/inventory/add/",
        headers: {
          HttpHeaders.authorizationHeader: "Bearer $accessToken",
          HttpHeaders.contentTypeHeader: "application/json"
        },
        body: jsonEncode({
          "name": name,
          "mrp": mrp,
          "hsn": hsn,
          "base_price": basePrice,
          "type": type,
          "quantity": quantity
        }));
  }
}
