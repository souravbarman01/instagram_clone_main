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

  // /// Update API headers
  // Map<String, String> updateHeader(String? token, {List<int>? zoneIDs, String? languageCode, String? latitude, String? longitude, bool setHeader = true,}) {
  //   final header = <String, String>{
  //     'Content-Type': 'application/json; charset=UTF-8',
  //     AppConstants.zoneId: jsonEncode(zoneIDs ?? [1]),
  //     AppConstants.latitude: jsonEncode(latitude ?? "23.735129"),
  //     AppConstants.longitude: jsonEncode(longitude ?? "90.424514"),
  //     'Authorization': 'Bearer $token',
  //   };
  //
  //   if (setHeader) {
  //     _mainHeaders = header;
  //   }
  //   return header;
  // }
  //
  // Map<String, String> getHeader() => _mainHeaders;
  //
  // /// GET request
  // Future<Response> getData(String uri, {Map<String, dynamic>? query, Map<String, String>? headers, bool handleError = true, bool showToaster = false,}) async {
  //   try {
  //     if (kDebugMode) {
  //       debugPrint('====> GET: $uri\nHeader: $_mainHeaders');
  //     }
  //     final response = await GetConnect().get(appBaseUrl + uri, query: query, headers: headers ?? _mainHeaders,).timeout(Duration(seconds: timeoutInSeconds));
  //
  //     return _handleResponse(response, uri, handleError, showToaster: showToaster);
  //   } catch (e) {
  //     return Response(statusCode: 1, statusText: noInternetMessage);
  //   }
  // }
  //
  // /// POST request
  // Future<Response> postData(String uri, dynamic body, {Map<String, String>? headers, bool handleError = true,}) async {
  //   try {
  //     if (kDebugMode) {
  //       debugPrint('====> POST: $uri\nBody: $body\nHeader: $_mainHeaders');
  //     }
  //     final response = await GetConnect().post(appBaseUrl + uri, body, headers: headers ?? _mainHeaders,).timeout(Duration(seconds: timeoutInSeconds));
  //
  //     return _handleResponse(response, uri, handleError);
  //   } catch (e) {
  //     return Response(statusCode: 1, statusText: noInternetMessage);
  //   }
  // }
  //
  // /// PUT request
  // Future<Response> putData(String uri, dynamic body, {Map<String, String>? headers, bool handleError = true,}) async {
  //   try {
  //     if (kDebugMode) {
  //       debugPrint('====> PUT: $uri\nBody: $body\nHeader: $_mainHeaders');
  //     }
  //     final response = await GetConnect().put(appBaseUrl + uri, body, headers: headers ?? _mainHeaders,).timeout(Duration(seconds: timeoutInSeconds));
  //
  //     return _handleResponse(response, uri, handleError);
  //   } catch (e) {
  //     return Response(statusCode: 1, statusText: noInternetMessage);
  //   }
  // }
  //
  // /// DELETE request
  // Future<Response> deleteData(String uri, {Map<String, String>? headers, bool handleError = true,}) async {
  //   try {
  //     if (kDebugMode) {
  //       debugPrint('====> DELETE: $uri\nHeader: $_mainHeaders');
  //     }
  //     final response = await GetConnect().delete(appBaseUrl + uri, headers: headers ?? _mainHeaders,).timeout(Duration(seconds: timeoutInSeconds));
  //     return _handleResponse(response, uri, handleError);
  //   } catch (e) {
  //     return Response(statusCode: 1, statusText: noInternetMessage);
  //   }
  // }
  //
  // /// Handle responses
  // Response _handleResponse(Response response, String uri, bool handleError, {bool showToaster = false,}) {
  //   if (response.statusCode == 200) {
  //     return response;
  //   } else {
  //     try {
  //       final errorResponse = ErrorResponse.fromJson(response.body);
  //       if (kDebugMode) {
  //         debugPrint('API Error: ${errorResponse.errors}');
  //       }
  //     } catch (_) {}
  //     return response;
  //   }
  // }

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
