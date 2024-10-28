 

import 'package:flutter/material.dart';

import '../core/navigation/fade_builder_route.dart';
import '../core/page/not_found_page.dart';
import '../features/intro/presentation/pages/splash_page.dart';

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
      // case RouteNamedScreens.reelNameRoutePage:
      //   return FadeBuilderRoute(
      //     page: BlocProvider(
      //       create: (context) => di.sl<SendCodeCubit>(),
      //       child: const LoginPage(),
      //     ),
      //   );    
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
