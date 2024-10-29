// To parse this JSON data, do
//
//     final reelsRequestEntite = reelsRequestEntiteFromJson(jsonString);

import 'dart:convert';

ReelsRequestEntite reelsRequestEntiteFromJson(String str) =>
    ReelsRequestEntite.fromJson(json.decode(str));

String reelsRequestEntiteToJson(ReelsRequestEntite data) =>
    json.encode(data.toJson());

class ReelsRequestEntite {
  int page;
  final int limit;
  final String country;

  ReelsRequestEntite({
    required this.page,
    required this.limit,
    required this.country,
  });

  //Make Initial Factory For Request Entite
  factory ReelsRequestEntite.initial() {
    return reelsRequestEntiteFromJson('{}');
  }

  factory ReelsRequestEntite.fromJson(Map<String, dynamic> json) =>
      ReelsRequestEntite(
        page: json["page"] ?? 1,
        limit: json["limit"] ?? 9,
        country: json["country"] ?? "United+States",
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "limit": limit,
        "country": country,
      };
}
