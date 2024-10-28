// import 'package:daily/core/api/api_links.dart';
// import 'package:dartz/dartz.dart';

// import '../../../../../core/api/api_methods.dart';
// import '../../../../../core/error/exception.dart';
// import '../../../domain/entities/request/article_request_entity.dart';
// import '../../../domain/entities/request/set_like_request_entity.dart';
// import '../../../domain/entities/response/article_response_entity.dart';
// import '../../../domain/entities/response/categories_response_entity.dart';

// abstract class ArticleRemote {
//   Future<ArticleResponseEntity> getArticles(
//       {required ArticleRequestEntity articleRequestEntity});
//   Future<CategoriesResponseEntity> getCategories();
//   Future<Unit> setArticleLike(
//       {required SetLikeRequestEntity setLikeRequestEntity});
// }

// class ArticleRemoteImplements extends ArticleRemote {
//   //Calling Api End Point Impelementation

//   //Call Get Article Remote Implementation
//   @override
//   Future<ArticleResponseEntity> getArticles(
//       {required ArticleRequestEntity articleRequestEntity}) async {
//     final response = await ApiMethods().post(
//       url: ApiPostUrl.getAriclesUrl,
//       body: articleRequestEntity.toJson(),
//     );
//     if (articleRequestEntity.categoryIdList == null ||
//         articleRequestEntity.categoryIdList!.isEmpty) {
//       articleRequestEntity.categoryIdList = null;
//     }

//     if (response.statusCode == 200) {
//       return articleResponseEntityFromJson(response.body);
//     } else {
//       throw ServerException(response: response);
//     }
//   }

//   //Get Categories Remote Implement
//   @override
//   Future<CategoriesResponseEntity> getCategories() async {
//     final response = await ApiMethods().post(
//       url: ApiPostUrl.getCategoriesUrl,
//       body: {},
//     );
//     if (response.statusCode == 200) {
//       return categoriesResponseEntityFromJson(response.body);
//     } else {
//       throw ServerException(response: response);
//     }
//   }

//   //Set Like Remote Implement
//   @override
//   Future<Unit> setArticleLike(
//       {required SetLikeRequestEntity setLikeRequestEntity}) async {
//     final response = await ApiMethods().post(
//       url: ApiPostUrl.setArticleLikeUrl,
//       body: setLikeRequestEntity.toJson(),
//     );
//     if (response.statusCode == 200) {
//       return Future.value(unit);
//     } else {
//       throw ServerException(response: response);
//     }
//   }
// }
