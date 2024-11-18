part of 'reels_bloc.dart';
class ReelsState extends Equatable {
  final ReelsResponseEntite reelsResponseEntite;
  final CubitStatus cubitStatus;
  final String error;
  final bool haveReachedMax;
  final bool loadPagination;
  const ReelsState({
    required this.reelsResponseEntite,
    required this.cubitStatus,
    required this.error,
    required this.haveReachedMax,
    required this.loadPagination,
  });

  factory ReelsState.initial() {
    return ReelsState(
        reelsResponseEntite: ReelsResponseEntite.fromJson({}),
        cubitStatus: CubitStatus.loading,
        haveReachedMax: false,
        loadPagination: false,
        error: '');
  }

  ReelsState copyWith({
    ReelsResponseEntite? reelsResponseEntite,
    CubitStatus? cubitStatus,
    bool? haveReachedMax,
    bool? loadPagination,
    String? error,
  }) {
    return ReelsState(
      reelsResponseEntite: reelsResponseEntite ?? this.reelsResponseEntite,
      cubitStatus: cubitStatus ?? this.cubitStatus,
      error: error ?? this.error,
      haveReachedMax: haveReachedMax ?? this.haveReachedMax,
      loadPagination: loadPagination ?? this.loadPagination,
    );
  }

  @override
  List<Object> get props => [
        reelsResponseEntite,
        cubitStatus,
        error,
        haveReachedMax,
        loadPagination,
      ];
}
