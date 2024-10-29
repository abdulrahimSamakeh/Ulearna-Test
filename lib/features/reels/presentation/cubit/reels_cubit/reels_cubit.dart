import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ulearna_test/core/resource/enum_manger.dart';
import 'package:ulearna_test/features/reels/domain/entities/request/reels_request_entite.dart';
import 'package:ulearna_test/features/reels/domain/entities/response/reels_response_entite.dart';
import 'package:ulearna_test/features/reels/domain/usecases/get_reels_usecase.dart';

import '../../../../../core/error/error_entite.dart';
import '../../../../../core/function/maping_failure.dart';
import '../../../../../core/resource/constant_manager.dart';

part 'reels_state.dart';

class ReelsCubit extends Cubit<ReelsState> {
  final GetReelsUsecase usecase;
  ReelsCubit({
    required this.usecase,
  }) : super(ReelsState.initial());
//Get Reels
  getReels(
      {required ReelsRequestEntite reelsRequestEntite,
      bool? paginationLoading,
      bool? reset}) async {
    //Check The Pagination If Reset
    if (state.haveReachedMax == false || reset == true) {
      if (paginationLoading == false) {
        emit(state.copyWith(cubitStatus: CubitStatus.loading));
      } else {
        emit(state.copyWith(loadPagination: true));
      }
      final result = await usecase(params: reelsRequestEntite);
      //!Check if Bloc Closed
      if (isClosed) return;
      //Check Coming
      result.fold(
        (failure) async {
          final ErorrEntite errorEntite = await mapFailure(failure: failure);
          emit(state.copyWith(
              error: errorEntite.errorMessage,
              cubitStatus: CubitStatus.error,
              loadPagination: false));
        },
        (data) {
          if (reset == true) {
            state.reelsResponseEntite.data.data.clear();
            state.reelsResponseEntite.data.data.addAll(data.data.data);
          } else {
            state.reelsResponseEntite.data.data.addAll(data.data.data);
          }
          emit(
            state.copyWith(
                loadPagination: false,
                haveReachedMax:
                    data.data.data.length < AppConstantManager.itemPerPage,
                cubitStatus: CubitStatus.succses,
                reelsResponseEntite: state.reelsResponseEntite),
          );
        },
      );
    } else {
      return;
    }
  }
}
