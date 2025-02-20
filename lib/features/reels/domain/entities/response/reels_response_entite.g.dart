// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reels_response_entite.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReelsResponseEntite _$ReelsResponseEntiteFromJson(Map<String, dynamic> json) =>
    ReelsResponseEntite(
      statusCode: json['statusCode'] ?? 0,
      message: json['message'] ?? "",
      data: Data.fromJson(json['data'] ?? {}),
    );

Map<String, dynamic> _$ReelsResponseEntiteToJson(
        ReelsResponseEntite instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      data: json['data'] == null
          ? []
          : (json['data'] as List<dynamic>)
              .map((e) => Datum.fromJson(e as Map<String, dynamic>))
              .toList(),
      metaData: MetaData.fromJson(json['metaData'] ?? {}),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'data': instance.data,
      'metaData': instance.metaData,
    };

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
        videoPath: '',
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
        bunnyStreamVideoId: json["bunny_stream_video_id"] ?? "",
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

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'url': instance.url,
      'cdnUrl': instance.cdnUrl,
      'thumbCdnUrl': instance.thumbCdnUrl,
      'userId': instance.userId,
      'status': instance.status,
      'slug': instance.slug,
      'encodeStatus': instance.encodeStatus,
      'priority': instance.priority,
      'categoryId': instance.categoryId,
      'totalViews': instance.totalViews,
      'totalLikes': instance.totalLikes,
      'totalComments': instance.totalComments,
      'totalShare': instance.totalShare,
      'totalWishlist': instance.totalWishlist,
      'duration': instance.duration,
      'byteAddedOn': instance.byteAddedOn.toIso8601String(),
      'byteUpdatedOn': instance.byteUpdatedOn.toIso8601String(),
      'bunnyStreamVideoId': instance.bunnyStreamVideoId,
      'language': instance.language,
      'bunnyEncodingStatus': instance.bunnyEncodingStatus,
      'videoHeight': instance.videoHeight,
      'videoWidth': instance.videoWidth,
      'isPrivate': instance.isPrivate,
      'isHideComment': instance.isHideComment,
      'description': instance.description,
      'user': instance.user,
      'isLiked': instance.isLiked,
      'isWished': instance.isWished,
      'isFollow': instance.isFollow,
      'videoAspectRatio': instance.videoAspectRatio,
      'videoPath': instance.videoPath,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      userId: json['userId'] ?? 0,
      fullname: json['fullname'] ?? "",
      username: json['username'] ?? "",
      profilePicture: json['profilePicture'] ?? "",
      profilePictureCdn: json['profilePictureCdn'] ?? "",
      designation: json['designation'] ?? "",
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'userId': instance.userId,
      'fullname': instance.fullname,
      'username': instance.username,
      'profilePicture': instance.profilePicture,
      'profilePictureCdn': instance.profilePictureCdn,
      'designation': instance.designation,
    };

MetaData _$MetaDataFromJson(Map<String, dynamic> json) => MetaData(
      total: json['total'] ?? 0,
      page: json['page'] ?? 0,
      limit: json['limit'] ?? 0,
    );

Map<String, dynamic> _$MetaDataToJson(MetaData instance) => <String, dynamic>{
      'total': instance.total,
      'page': instance.page,
      'limit': instance.limit,
    };
