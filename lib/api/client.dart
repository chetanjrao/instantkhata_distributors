import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:instantkhata_distributors/ui/utils/constants.dart';

class APIClient {
  final String accessToken = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNTk3OTQ4Nzc2LCJqdGkiOiJmNGNlMTliNDVkMWY0NzI5OWE5ZTcyNmFhNGU1ODk5ZCIsInVzZXJfaWQiOjF9.dH2pzDoxYtyxoT4TmWnIIwjCWQXEXUbQBQthUyfOORQ";
  final String refreshToken = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYwMDU0MDc3NiwianRpIjoiMzEyMDY2ZWFiZmZkNGJlZjgyMDQ2ZmY1OGFmNGY1YmUiLCJ1c2VyX2lkIjoxfQ.L_rHsNAzuk4cE6s-uxVmaVl8sdjh9eh85vHt_O98mqM";

  Future<http.Response> getInventory() async {
    return http.get(
      "$CONTEXT_API_URL/inventory/",
      headers: {
        HttpHeaders.authorizationHeader: "Bearer $accessToken",
        HttpHeaders.contentTypeHeader: "application/json"
      }
    );
  }

  Future<http.Response> getCategories() async {
    return http.get(
      "$CONTEXT_API_URL/inventory/types/",
      headers: {
        HttpHeaders.authorizationHeader: "Bearer $accessToken",
        HttpHeaders.contentTypeHeader: "application/json"
      }
    );
  }
  

}