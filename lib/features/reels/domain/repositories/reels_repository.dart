//The Abstraction Repository Class For Article Feature
//Only The Methods Define Here Without The Implemntation

//Only The Formal Of Method Defined Here
//Either Typy Make Function Returns Left And Rifht Values
//Left Is Type Of Failure Classes
//Right Is The Data Fetched From Api Call
import 'package:dartz/dartz.dart';
import 'package:ulearna_test/features/reels/domain/entities/request/reels_request_entite.dart';
import 'package:ulearna_test/features/reels/domain/entities/response/reels_response_entite.dart';

import '../../../../core/error/failures.dart';

abstract class ReelsRepository {
  //Get Articles
  Future<Either<Failure, ReelsResponseEntite>> getReels(
      {required ReelsRequestEntite reelsRequestEntite}); 
}
