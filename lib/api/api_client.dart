import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ApiClient extends GetxService {
  final String appBaseUrl;
  static final String noInternetMessage = 'connection_to_api_server_failed'.tr;
  final int timeoutInSeconds = 30;

  String? token;

  ApiClient({required this.appBaseUrl}) {
   // updateHeader(null);
  }

  Future<dynamic> getData(String assetPath) async {
    final jsonString = await rootBundle.loadString(assetPath);
    return jsonDecode(jsonString);
  }

}

/// ErrorResponse Model
class ErrorResponse {
  final List<Errors>? errors;

  ErrorResponse({this.errors});

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    return ErrorResponse(
      errors: json["errors"] != null ? List<Errors>.from(json["errors"].map((v) => Errors.fromJson(v))) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "errors": errors?.map((e) => e.toJson()).toList(),
    };
  }
}

/// Errors Model
class Errors {
  final String? code;
  final String? message;

  Errors({this.code, this.message});

  factory Errors.fromJson(Map<String, dynamic> json) {
    return Errors(code: json["code"], message: json["message"],);
  }

  Map<String, dynamic> toJson() {
    return {"code": code, "message": message,};
  }
}
