// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:daily/core/error/failures.dart';

// import 'package:daily/features/article/domain/entities/request/article_request_entity.dart';
// import 'package:daily/features/article/domain/entities/request/set_like_request_entity.dart';

// import 'package:daily/features/article/domain/entities/response/article_response_entity.dart';
// import 'package:daily/features/article/domain/entities/response/categories_response_entity.dart';

// import 'package:dartz/dartz.dart';

// import '../../../../core/api/connector.dart';
// import '../../domain/repositories/article_repository.dart';
// import '../datasources/local/article_local.dart';
// import '../datasources/remote/article_remote.dart';

// //The Implemntaion Of Each Metod Inside Domain Repository
// //Here Connect Domain Layer To Data Layer Done
// class ArticleRepositoryImplements implements ArticleRepository {
//   //Define Instance Of Remote Article
//   //To Call Api End Point
//   //Define Instance Of Local Article
//   //To Get Local Data Throw Database SQF If There Is Any Or If There Is Some Logic Need
//   final ArticleRemote articleRemote;
//   final ArticleLocal articleLocal;
//   ArticleRepositoryImplements({
//     required this.articleLocal,
//     required this.articleRemote,
//   });

//   //Get Articles Repo Implement
//   @override
//   Future<Either<Failure, ArticleResponseEntity>> getArticles(
//       {required ArticleRequestEntity articleRequestEntity}) {
//     return Connector<ArticleResponseEntity>().connect(
//       remote: () async {
//         final result = await articleRemote.getArticles(
//             articleRequestEntity: articleRequestEntity);
//         return Right(result);
//       },
//     );
//   }

//   //Get Categories Repository Implements
//   @override
//   Future<Either<Failure, CategoriesResponseEntity>> getCategories() async {
//     return Connector<CategoriesResponseEntity>().connect(
//       remote: () async {
//         final result = await articleRemote.getCategories();
//         return Right(result);
//       },
//     );
//   }

//   //Set Article Like Rempository Implements
//   @override
//   Future<Either<Failure, Unit>> setArticleLike(
//       {required SetLikeRequestEntity setLikeRequestEntity}) {
//     return Connector<Unit>().connect(
//       remote: () async {
//         final result = await articleRemote.setArticleLike(
//             setLikeRequestEntity: setLikeRequestEntity);
//         return Right(result);
//       },
//     );
//   }
// }
