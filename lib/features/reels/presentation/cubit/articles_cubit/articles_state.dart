// part of 'articles_cubit.dart';

// class ArticlesState extends Equatable {
//   final String error;
//   final ArticleResponseEntity articleResponseEntity;
//   final CubitStatus status;
//   final bool haveReachedMax;
//   final bool loadPagination;
//   const ArticlesState({
//     required this.error,
//     required this.articleResponseEntity,
//     required this.status,
//     required this.haveReachedMax,
//     required this.loadPagination,
//   });

//   factory ArticlesState.initial() {
//     return ArticlesState(
//         haveReachedMax: false,
//         loadPagination: false,
//         articleResponseEntity: ArticleResponseEntity.initial(),
//         error: '',
//         status: CubitStatus.initial);
//   }

//   @override
//   bool get stringify => true;

//   ArticlesState copyWith({
//     String? error,
//     ArticleResponseEntity? articleResponseEntity,
//     CubitStatus? status,
//     bool? haveReachedMax,
//     bool? loadPagination,
//   }) {
//     return ArticlesState(
//       error: error ?? this.error,
//       articleResponseEntity:
//           articleResponseEntity ?? this.articleResponseEntity,
//       status: status ?? this.status,
//       haveReachedMax: haveReachedMax ?? this.haveReachedMax,
//       loadPagination: loadPagination ?? this.loadPagination,
//     );
//   }

//   @override
//   List<Object> get props {
//     return [
//       error,
//       articleResponseEntity,
//       status,
//       haveReachedMax,
//       loadPagination,
//     ];
//   }
// }
