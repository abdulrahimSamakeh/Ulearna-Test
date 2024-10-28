import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../core/injection/injection_container.dart';
import '../core/theme/app_theme.dart';
import '../core/theme/theme_cubit/theme_cubit.dart';
import '../router/app_router.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  static final myAppKey = GlobalKey<NavigatorState>();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRouter appRouter = AppRouter();

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: themeCubit,
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return ResponsiveSizer(
            builder: (context, orientation, screenType) {
              return MaterialApp(
                navigatorKey: MyApp.myAppKey,
                themeMode: state.isLightMode ? ThemeMode.light : ThemeMode.dark,
                darkTheme: darkTheme(),
                theme: lightTheme(),
                onGenerateRoute: appRouter.onGenerateRoute,
                debugShowCheckedModeBanner: false,
              );
            },
          );
        },
      ),
    );
  }
}
