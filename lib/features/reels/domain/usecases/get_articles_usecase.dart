// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:dartz/dartz.dart';

// import 'package:daily/core/error/failures.dart';
// import 'package:daily/core/usecase/usecase.dart';
// import 'package:daily/features/article/domain/repositories/article_repository.dart';

// import '../entities/request/article_request_entity.dart';
// import '../entities/response/article_response_entity.dart';

// class GetArticlesUsecase
//     implements BaseUsecase<ArticleResponseEntity, ArticleRequestEntity> {
//   final ArticleRepository articleRepository;
//   GetArticlesUsecase({
//     required this.articleRepository,
//   });

//   @override
//   Future<Either<Failure, ArticleResponseEntity>> call(
//       {required ArticleRequestEntity params}) {
//     return articleRepository.getArticles(articleRequestEntity: params);
//   }
// }
