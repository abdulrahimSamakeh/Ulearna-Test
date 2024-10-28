import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../core/resource/image_manger.dart';
import '../../../../core/resource/size_manger.dart';
import '../../../../router/app_router.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  //Function To Make Loader For Splash Screen Time
  timerLoad(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushNamedAndRemoveUntil(
          context, RouteNamedScreens.reelNameRoutePage, (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    //Start Timer When Root Widget Build
    timerLoad(context);
    //Page
    return Scaffold(
      body: SizedBox(
        width: AppWidthManger.w100,
        height: AppHeightManger.h100,
        child: Image.asset(
          AppImageManger.splashImage,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
