// To parse this JSON data, do
//
//     final errorResponseEntite = errorResponseEntiteFromJson(jsonString);

import 'dart:convert';

ErrorResponseEntite errorResponseEntiteFromJson(String str) =>
    ErrorResponseEntite.fromJson(json.decode(str));

class ErrorResponseEntite {
  final int errorCode;
  final String error;
  final String message;

  ErrorResponseEntite({
    required this.errorCode,
    required this.message,
    required this.error
  });

  factory ErrorResponseEntite.fromRawJson(String str) =>
      ErrorResponseEntite.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ErrorResponseEntite.fromJson(Map<String, dynamic> json) =>
      ErrorResponseEntite(
        errorCode: json["statusCode"] ?? 0,
        message: json["message"] ?? '',
        error: json["error"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "statusCode": errorCode,
        "message": message,
        "error": error,
      };
}
