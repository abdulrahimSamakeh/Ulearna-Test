import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearna_test/features/reels/domain/entities/request/reels_request_entite.dart';

import '../core/navigation/fade_builder_route.dart';
import '../core/page/not_found_page.dart';
import '../features/intro/presentation/pages/splash_page.dart';
import '../core/injection/injection_container.dart' as di;
import '../features/reels/presentation/bloc/reels_bloc/reels_bloc.dart';
import '../features/reels/presentation/pages/reels_page.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    // ignore: unused_local_variable
    final argument = settings.arguments;
    switch (settings.name) {
      //!Intro
      //Splash
      case RouteNamedScreens.splashNameRoutePage:
        return FadeBuilderRoute(page: const SplashPage());
      //!Reel
      //Reel Home Page
      case RouteNamedScreens.reelNameRoutePage:
        return FadeBuilderRoute(
          page: BlocProvider(
            create: (context) => di.sl<ReelsBloc>()
              ..add(
                GetReelsEvent(
                  paginationLoading: false,
                  reset: false,
                  reelsRequestEntite: ReelsRequestEntite.initial(),
                ),
              ),
            child: const ReelsPage(),
          ),
        );
      //!Core Pages

      //Deafult Page To Handel Routing Failure
      default:
        return FadeBuilderRoute(page: const NotFoundPage());
    }
  }
}

class RouteNamedScreens {
  // Routing Naming Class
  //!Core
  //!Intro
  static const String splashNameRoutePage = '/';
  //!Reel Feature
  static const String reelNameRoutePage = '/reel-page';
}
