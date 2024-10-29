// To parse this JSON data, do
//
//     final reelsResponseEntite = reelsResponseEntiteFromJson(jsonString);

import 'dart:convert';

ReelsResponseEntite reelsResponseEntiteFromJson(String str) =>
    ReelsResponseEntite.fromJson(json.decode(str));

String reelsResponseEntiteToJson(ReelsResponseEntite data) =>
    json.encode(data.toJson());

class ReelsResponseEntite {
  final int statusCode;
  final String message;
  final Data data;

  ReelsResponseEntite({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  //Make Initial Factory For Entite
  factory ReelsResponseEntite.initial() {
    return reelsResponseEntiteFromJson('{}');
  }

  factory ReelsResponseEntite.fromJson(Map<String, dynamic> json) =>
      ReelsResponseEntite(
        statusCode: json["statusCode"] ?? 0,
        message: json["message"] ?? '',
        data: Data.fromJson(json["data"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  final List<Datum> data;
  final MetaData metaData;

  Data({
    required this.data,
    required this.metaData,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        metaData: MetaData.fromJson(json["meta_data"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "meta_data": metaData.toJson(),
      };
}

class Datum {
  final int id;
  final String title;
  final String url;
  final String cdnUrl;
  final String thumbCdnUrl;
  final int userId;
  final String status;
  final String slug;
  final String encodeStatus;
  final int priority;
  final int categoryId;
  final int totalViews;
  final int totalLikes;
  final int totalComments;
  final int totalShare;
  final int totalWishlist;
  final int duration;
  final DateTime byteAddedOn;
  final DateTime byteUpdatedOn;
  final String bunnyStreamVideoId;
  final String language;
  final int bunnyEncodingStatus;
  final int videoHeight;
  final int videoWidth;
  final int isPrivate;
  final int isHideComment;
  final String description;
  final User user;
  final bool isLiked;
  final bool isWished;
  final bool isFollow;
  final String videoAspectRatio;

  Datum({
    required this.id,
    required this.title,
    required this.url,
    required this.cdnUrl,
    required this.thumbCdnUrl,
    required this.userId,
    required this.status,
    required this.slug,
    required this.encodeStatus,
    required this.priority,
    required this.categoryId,
    required this.totalViews,
    required this.totalLikes,
    required this.totalComments,
    required this.totalShare,
    required this.totalWishlist,
    required this.duration,
    required this.byteAddedOn,
    required this.byteUpdatedOn,
    required this.bunnyStreamVideoId,
    required this.language,
    required this.bunnyEncodingStatus,
    required this.videoHeight,
    required this.videoWidth,
    required this.isPrivate,
    required this.isHideComment,
    required this.description,
    required this.user,
    required this.isLiked,
    required this.isWished,
    required this.isFollow,
    required this.videoAspectRatio,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"] ?? 0,
        title: json["title"] ?? "",
        url: json["url"] ?? "",
        cdnUrl: json["cdn_url"] ?? "",
        thumbCdnUrl: json["thumb_cdn_url"] ?? "",
        userId: json["user_id"] ?? 0,
        status: json["status"] ?? "",
        slug: json["slug"] ?? "",
        encodeStatus: json["encode_status"] ?? "",
        priority: json["priority"] ?? 0,
        categoryId: json["category_id"] ?? 0,
        totalViews: json["total_views"] ?? 0,
        totalLikes: json["total_likes"] ?? 0,
        totalComments: json["total_comments"] ?? 0,
        totalShare: json["total_share"] ?? 0,
        totalWishlist: json["total_wishlist"] ?? 0,
        duration: json["duration"] ?? 0,
        byteAddedOn: DateTime.parse(json["byte_added_on"] ?? DateTime(0)),
        byteUpdatedOn: DateTime.parse(json["byte_updated_on"] ?? DateTime(0)),
        bunnyStreamVideoId: json["bunny_stream_video_id"] ?? 0,
        language: json["language"] ?? '',
        bunnyEncodingStatus: json["bunny_encoding_status"] ?? 0,
        videoHeight: json["video_height"] ?? 0,
        videoWidth: json["video_width"] ?? 0,
        isPrivate: json["is_private"] ?? 0,
        isHideComment: json["is_hide_comment"] ?? 0,
        description: json["description"] ?? '',
        user: User.fromJson(json["user"] ?? {}),
        isLiked: json["is_liked"] ?? false,
        isWished: json["is_wished"] ?? false,
        isFollow: json["is_follow"] ?? false,
        videoAspectRatio: json["video_aspect_ratio"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "url": url,
        "cdn_url": cdnUrl,
        "thumb_cdn_url": thumbCdnUrl,
        "user_id": userId,
        "status": status,
        "slug": slug,
        "encode_status": encodeStatus,
        "priority": priority,
        "category_id": categoryId,
        "total_views": totalViews,
        "total_likes": totalLikes,
        "total_comments": totalComments,
        "total_share": totalShare,
        "total_wishlist": totalWishlist,
        "duration": duration,
        "byte_added_on": byteAddedOn.toIso8601String(),
        "byte_updated_on": byteUpdatedOn.toIso8601String(),
        "bunny_stream_video_id": bunnyStreamVideoId,
        "language": language,
        "bunny_encoding_status": bunnyEncodingStatus,
        "video_height": videoHeight,
        "video_width": videoWidth,
        "is_private": isPrivate,
        "is_hide_comment": isHideComment,
        "description": description,
        "user": user.toJson(),
        "is_liked": isLiked,
        "is_wished": isWished,
        "is_follow": isFollow,
        "video_aspect_ratio": videoAspectRatio,
      };
}

class User {
  final int userId;
  final String fullname;
  final String username;
  final String profilePicture;
  final String profilePictureCdn;
  final String designation;

  User({
    required this.userId,
    required this.fullname,
    required this.username,
    required this.profilePicture,
    required this.profilePictureCdn,
    required this.designation,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json["user_id"] ?? 0,
        fullname: json["fullname"] ?? "",
        username: json["username"] ?? "",
        profilePicture: json["profile_picture"] ?? "",
        profilePictureCdn: json["profile_picture_cdn"] ?? "",
        designation: json["designation"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "fullname": fullname,
        "username": username,
        "profile_picture": profilePicture,
        "profile_picture_cdn": profilePictureCdn,
        "designation": designation,
      };
}

class MetaData {
  final int total;
  final int page;
  final int limit;

  MetaData({
    required this.total,
    required this.page,
    required this.limit,
  });

  factory MetaData.fromJson(Map<String, dynamic> json) => MetaData(
        total: json["total"] ?? 0,
        page: json["page"] ?? 0,
        limit: json["limit"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "page": page,
        "limit": limit,
      };
}
