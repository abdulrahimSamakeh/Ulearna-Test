import 'package:equatable/equatable.dart';
import 'package:http/http.dart';

abstract class Failure extends Equatable {}

class OfflineFailure extends Failure {
  final String message;
  OfflineFailure({
    required this.message,
  });
  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {
  final Response? response;
  ServerFailure({
    this.response,
  });

  @override
  List<Object?> get props => [response];
}

class EmptyCacheFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class WrongDataFailure extends Failure {
  @override
  List<Object?> get props => [];
}
