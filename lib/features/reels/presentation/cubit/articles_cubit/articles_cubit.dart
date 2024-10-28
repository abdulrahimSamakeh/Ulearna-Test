// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:equatable/equatable.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:daily/core/resource/enum_manger.dart';
// import 'package:daily/features/article/domain/entities/response/article_response_entity.dart';
// import 'package:daily/features/article/domain/usecases/get_articles_usecase.dart';

// import '../../../../../core/error/error_entite.dart';
// import '../../../../../core/function/maping_failure.dart';
// import '../../../../../core/resource/constant_manager.dart';
// import '../../../domain/entities/request/article_request_entity.dart';

// part 'articles_state.dart';

// class ArticlesCubit extends Cubit<ArticlesState> {
//   final GetArticlesUsecase usecase;
//   ArticlesCubit({
//     required this.usecase,
//   }) : super(ArticlesState.initial());
//   //Get Articals
//   getArticles(
//       {required ArticleRequestEntity articleRequestEntity,
//       bool? paginationLoading,
//       bool? reset}) async {
//     if (state.haveReachedMax == false || reset == true) {
//       if (paginationLoading != true) {
//         emit(state.copyWith(status: CubitStatus.loading));
//       } else {
//         emit(state.copyWith(loadPagination: true));
//       }
//       final result = await usecase(params: articleRequestEntity);
//       //!Check if Bloc Closed
//       if (isClosed) return;
//       result.fold(
//         (failure) async {
//           final ErorrEntite errorEntite = await mapFailure(failure: failure);
//           emit(state.copyWith(
//               error: errorEntite.errorMessage,
//               status: CubitStatus.error,
//               loadPagination: false));
//         },
//         (data) {
//           if (reset == true) {
//             state.articleResponseEntity.result.clear();
//             state.articleResponseEntity.result.addAll(data.result);
//           } else {
//             state.articleResponseEntity.result.addAll(data.result);
//           }
//           emit(
//             state.copyWith(
//                 loadPagination: false,
//                 haveReachedMax:
//                     data.result.length < AppConstantManager.itemPerPage,
//                 status: CubitStatus.succses,
//                 articleResponseEntity: state.articleResponseEntity),
//           );
//         },
//       );
//     } else {
//       return;
//     }
//   }
// }
