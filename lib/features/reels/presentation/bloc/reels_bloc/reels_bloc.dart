import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

import 'package:ulearna_test/features/reels/domain/entities/request/reels_request_entite.dart';

import '../../../../../core/error/error_entite.dart';
import '../../../../../core/function/maping_failure.dart';
import '../../../../../core/resource/constant_manager.dart';
import '../../../../../core/resource/enum_manger.dart';
import '../../../domain/entities/response/reels_response_entite.dart';
import '../../../domain/usecases/get_reels_usecase.dart';

part 'reels_event.dart';
part 'reels_state.dart';

class ReelsBloc extends Bloc<GetReelsEvent, ReelsState> {
  final GetReelsUsecase usecase;

  ReelsBloc({
    required this.usecase,
  }) : super(ReelsState.initial()) {
    on<GetReelsEvent>((event, emit)async {
       if (event.paginationLoading == false || event.reset) {
        emit(
          state.copyWith(cubitStatus: CubitStatus.loading),
        );
      } else {
        emit(
          state.copyWith(loadPagination: true),
        );
      }
      final result = await usecase(
          params: event.reelsRequestEntite);
      //!Check if Bloc Closed
      if (isClosed) return;
      result.fold(
        (failure) async {
          final ErorrEntite errorEntite =
              await mapFailure(failure: failure);
          emit(state.copyWith(
              error: errorEntite.errorMessage,
              cubitStatus: CubitStatus.error,
              loadPagination: false));
        },
        (data) {     
          event.reelsRequestEntite.page++;
          if (event.reset) {
            state.reelsResponseEntite.data.data.clear();
            state.reelsResponseEntite.data.data.addAll(data.data.data);
          } else {
            state.reelsResponseEntite.data.data.addAll(data.data.data);
          }
          emit(
            state.copyWith(
              cubitStatus: CubitStatus.succses,
              reelsResponseEntite: state.reelsResponseEntite,
              haveReachedMax: data.data.data.length < AppConstantManager.itemPerPage,
              loadPagination: false,
            ),
          );
        },
      );
    },  transformer: droppable());
  }
}
