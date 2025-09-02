import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:nutsacktodo/app/base/constants/color_constants.dart';
import 'package:nutsacktodo/app/base/network_sensitive/cubit/internet_cubit.dart';
import 'package:nutsacktodo/app/base/router/router.dart';
import 'package:nutsacktodo/app/base/theme/cubit/theme_cubit.dart';
import 'package:nutsacktodo/app/base/theme/theme_data.dart';
import 'package:nutsacktodo/app/base/dependency_injection/di.dart' as di;
import 'package:sizer/sizer.dart';

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

void main() async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    const bool dev = true;
    if (dev) {
      HttpOverrides.global = new MyHttpOverrides();
    }
    // Initialize DB before app starts
    // await DatabaseHelper.instance.database;

    di.init();
    // await ScreenUtil.ensureScreenSize();
    runApp(App());
  }, (error, stackTrace) {});
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
          create: (_) => di.sl<InternetCubit>(),
        ),
        BlocProvider<ThemeCubit>(
          create: (_) => ThemeCubit(),
        ),
      ],
      child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light
              .copyWith(statusBarColor: ColorConstants.backgroundColor),
          child: const MyApp()),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: ColorConstants.backgroundColor,
        statusBarBrightness: Brightness.light,
      ),
    );

    return Sizer(
        builder: (context, orientation, screenType) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'NewApps Task',
            theme: lightThemeData(),
            initialRoute: Routes.splashView,
            getPages: Routes.routes,
          );
        }
    );
  }
}