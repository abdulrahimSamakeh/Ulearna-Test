import 'package:dartz/dartz.dart';

import '../argument/check_connection_arg.dart';
import '../error/exception.dart';
import '../error/failures.dart';
import '../function/network_functions.dart';

//This Connector Class Made To Handel All The States That Can Be Happend When Api Called
//If Server Exception Happened
//If Internet Connection Exception
//If Cahced Data Called And Somthing Wrong Happened
class Connector<T> {
  Future<Either<Failure, T>> connect(
      {required Future<Right<Failure, T>> Function() remote,
      Future<Right<Failure, T>> Function()? cache}) async {
    //Check Internet Connection Function
    final CheckConnectionArgs connectionArgs = await isThereConnection();
    if (connectionArgs.isConnected) {
      try {
        return await remote();
      } on ServerException catch (error) {
        return Left(ServerFailure(response: error.response));
      }
    } else {
      if (cache == null) {
        return Left(OfflineFailure(message: connectionArgs.message));
      } else {
        try {
          return await cache();
        } on EmptyCacheException {
          return Left(EmptyCacheFailure());
        }
      }
    }
  }
}
