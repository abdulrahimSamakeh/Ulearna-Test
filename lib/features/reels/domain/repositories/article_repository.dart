// //The Abstraction Repository Class For Article Feature
// //Only The Methods Define Here Without The Implemntation

// //Only The Formal Of Method Defined Here
// //Either Typy Make Function Returns Left And Rifht Values
// //Left Is Type Of Failure Classes
// //Right Is The Data Fetched From Api Call
// import 'package:daily/core/error/failures.dart';
// import 'package:daily/features/article/domain/entities/request/article_request_entity.dart';
// import 'package:daily/features/article/domain/entities/request/set_like_request_entity.dart';
// import 'package:daily/features/article/domain/entities/response/article_response_entity.dart';
// import 'package:daily/features/article/domain/entities/response/categories_response_entity.dart';
// import 'package:dartz/dartz.dart';

// abstract class ArticleRepository {
//   //Get Articles
//   Future<Either<Failure, ArticleResponseEntity>> getArticles(
//       {required ArticleRequestEntity articleRequestEntity});
//   //Get Categories
//   Future<Either<Failure, CategoriesResponseEntity>> getCategories();
//   //Set Like
//   Future<Either<Failure, Unit>> setArticleLike(
//       {required SetLikeRequestEntity setLikeRequestEntity});
// }
