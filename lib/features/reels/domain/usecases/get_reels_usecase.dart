import 'package:dartz/dartz.dart';
import 'package:ulearna_test/features/reels/domain/entities/request/reels_request_entite.dart';
import 'package:ulearna_test/features/reels/domain/entities/response/reels_response_entite.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/reels_repository.dart';

class GetReelsUsecase
    implements BaseUsecase<ReelsResponseEntite, ReelsRequestEntite> {
  final ReelsRepository reelsRepository;
  GetReelsUsecase({
    required this.reelsRepository,
  });

  @override
  Future<Either<Failure, ReelsResponseEntite>> call(
      {required ReelsRequestEntite params}) {
    return reelsRepository.getReels(reelsRequestEntite: params);
  }
}
