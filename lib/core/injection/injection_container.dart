import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import '../theme/theme_cubit/theme_cubit.dart';

//Get It Global Instance
final sl = GetIt.instance;

//!Function To Initilized Get It Dependacy Injections
//And Register Classes
Future<void> init() async {
//!Features - Reels
//Blocs
  // sl.registerFactory(() => SendCodeCubit(usecase: sl()));

  //Usecases
  // sl.registerLazySingleton(() => SendCodeUsecase(repository: sl()));

  // Reposetories
  // sl.registerLazySingleton<AuthRepository>(
  //   () => AuthRepositoryImplements(
  //     authRemote: sl(),
  //   ),
  // );

  // DataSources
  // Remote
  // sl.registerLazySingleton<AuthRemote>(() => AuthRemoteImplement());
  // Local
  // sl.registerLazySingleton<ArticleLocal>(() => ArticleLocalImplements());

  //! Core
  sl.registerFactory(() => ThemeCubit());

  //! External
  sl.registerLazySingleton(() => Client());
}

final ThemeCubit themeCubit = ThemeCubit();
