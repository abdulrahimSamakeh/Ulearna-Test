import 'package:json_annotation/json_annotation.dart';

part 'reels_response_entite.g.dart';

@JsonSerializable()
class ReelsResponseEntite {
  final int statusCode;
  final String message;
  final Data data;

  ReelsResponseEntite({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  // Factory constructor for generating a ReelsResponseEntite instance from JSON
  factory ReelsResponseEntite.fromJson(Map<String, dynamic> json) => _$ReelsResponseEntiteFromJson(json);

  // Method for converting a ReelsResponseEntite instance to JSON
  Map<String, dynamic> toJson() => _$ReelsResponseEntiteToJson(this);
}

@JsonSerializable()
class Data {
  final List<Datum> data;
  final MetaData metaData;

  Data({
    required this.data,
    required this.metaData,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
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
  String videoPath;

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
    required this.videoPath,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}

@JsonSerializable()
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

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class MetaData {
  final int total;
  final int page;
  final int limit;

  MetaData({
    required this.total,
    required this.page,
    required this.limit,
  });

  factory MetaData.fromJson(Map<String, dynamic> json) => _$MetaDataFromJson(json);

  Map<String, dynamic> toJson() => _$MetaDataToJson(this);
}
