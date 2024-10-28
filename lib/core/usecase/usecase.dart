import 'package:dartz/dartz.dart';

import '../error/failures.dart';

abstract class BaseUsecase<T, Params> {
  Future<Either<Failure, T>> call({required Params params});
}
