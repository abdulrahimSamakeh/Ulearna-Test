part of 'reels_bloc.dart';

 
class GetReelsEvent extends Equatable {
  const GetReelsEvent({
    required this.reelsRequestEntite,
    required this.paginationLoading,
    required this.reset,
  });
  final ReelsRequestEntite reelsRequestEntite;
  final bool paginationLoading;
  final bool reset;

  @override
  List<Object> get props =>
      [reelsRequestEntite, paginationLoading, reset];
}
