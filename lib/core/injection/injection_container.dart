import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:ulearna_test/features/reels/data/datasources/local/reels_local.dart';
import 'package:ulearna_test/features/reels/data/datasources/remote/reels_remote.dart';
import 'package:ulearna_test/features/reels/data/repositories/reels_repository_implement.dart';
import 'package:ulearna_test/features/reels/domain/repositories/reels_repository.dart';
import 'package:ulearna_test/features/reels/domain/usecases/get_reels_usecase.dart';
import 'package:ulearna_test/features/reels/presentation/bloc/reels_bloc/reels_bloc.dart'; 
import '../theme/theme_cubit/theme_cubit.dart';

//Get It Global Instance
final sl = GetIt.instance;

//!Function To Initilized Get It Dependacy Injections
//And Register Classes
Future<void> init() async {
//!Features - Reels
//Blocs
  sl.registerFactory(() => ReelsBloc(usecase: sl())); 

  //Usecases
  sl.registerLazySingleton(() => GetReelsUsecase(reelsRepository: sl())); 

  // Reposetories
  sl.registerLazySingleton<ReelsRepository>(
    () => ReelsRepositoryImplements(reelsRemote: sl(), reelsLocal: sl()),
  );

  // DataSources
  // Remote
  sl.registerLazySingleton<ReelsRemote>(() => ReelsRemoteImplements());
  // Local
  sl.registerLazySingleton<ReelsLocal>(() => ReelsLocalImplements());

  //! Core
  sl.registerFactory(() => ThemeCubit());

  //! External
  sl.registerLazySingleton(() => Client());
}

final ThemeCubit themeCubit = ThemeCubit();
