// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:ulearna_test/features/reels/domain/entities/request/reels_request_entite.dart';
import 'package:ulearna_test/features/reels/domain/entities/response/reels_response_entite.dart';
import 'package:ulearna_test/features/reels/domain/repositories/reels_repository.dart';

import '../../../../core/api/connector.dart';
import '../../../../core/error/failures.dart';
import '../datasources/local/reels_local.dart';
import '../datasources/remote/reels_remote.dart';

//The Implemntaion Of Each Metod Inside Domain Repository
//Here Connect Domain Layer To Data Layer Done
class ReelsRepositoryImplements implements ReelsRepository {
  //Define Instance Of Remote Reels
  //To Call Api End Point
  //Define Instance Of Local Reels
  //To Get Local Data Throw Database SQF If There Is Any Or If There Is Some Logic Need
  final ReelsRemote reelsRemote;
  final ReelsLocal reelsLocal;
  ReelsRepositoryImplements({
    required this.reelsLocal,
    required this.reelsRemote,
  });

  //Get Reels Repo Implement
  @override
  Future<Either<Failure, ReelsResponseEntite>> getReels(
      {required ReelsRequestEntite reelsRequestEntite}) {
    //Conncetor Check Internet Connection Befor Moving To Data Layer
    return Connector<ReelsResponseEntite>().connect(
      remote: () async {
        //Calling Data Layer
        final result =
            await reelsRemote.getReels(reelsRequestEntite: reelsRequestEntite);
        //Return Result(Reels Data) As Right Class
        return Right(result);
      },
    );
  }
}
