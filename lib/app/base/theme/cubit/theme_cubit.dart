import 'dart:io';

import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:nutsacktodo/app/base/theme/cubit/theme_state.dart';
import 'package:nutsacktodo/app/base/theme/theme_manager.dart';

class ThemeCubit extends Cubit<ThemeState> {
  // final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
  // FlutterLocalNotificationsPlugin();

  ThemeCubit() : super(ThemeState(themeMode: ThemeMode.light)) {
    updateAppTheme();
  }

  void initializeNotification() {
    print("initializeNotification");
    setupFCMNotification();
    // initializeLocalNotificationPlugin();
  }

  void updateAppTheme() {
    final Brightness currentBrightness = ThemeManager.currentSystemBrightness;
    currentBrightness == Brightness.light
        ? _setTheme(ThemeMode.light)
        : _setTheme(ThemeMode.dark);
  }

  void _setTheme(ThemeMode themeMode) {
    ThemeManager.setStatusBarAndNavigationBarColors(themeMode);
    emit(ThemeState(themeMode: themeMode));
  }

  setupFCMNotification() async {
    if (Platform.isIOS) {
      await iOSPermission();
      await Future.delayed(const Duration(milliseconds: 2000));
    }
    /*FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      if (message != null) {
        print('Remote message: ${message.toString()}');
      }
    });
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification notification = message.notification!;
      AndroidNotification android = message.notification!.android!;
      print('A new onMessage.listen received!');
      if (notification != null && android != null) {
        showForegroundNotification(notification.title!, notification.body!);
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
    });*/
    await getPushToken();
  }

  Future iOSPermission() async {
    /*await _firebaseMessaging.requestPermission(
      sound: true,
      badge: false,
      alert: true,
    );
    _firebaseMessaging.onTokenRefresh.listen((settings) {
      print("Settings registered: $settings");
    });*/
  }

  Future getPushToken() async {
    /*await _firebaseMessaging.getToken().then((token) {
      print('FCM Token: $token');
    });*/
  }

  /*Future initializeLocalNotificationPlugin() async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

    AndroidInitializationSettings androidInitializationSettings =
    AndroidInitializationSettings("launcher_icon");

    IOSInitializationSettings iosInitializationSettings =
    IOSInitializationSettings();

    final InitializationSettings initializationSettings =
    InitializationSettings(
        android: androidInitializationSettings,
        iOS: iosInitializationSettings);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }*/

  /*Future showForegroundNotification(String title, String body) async {
    // var android = AndroidNotificationDetails("id", "channel", "description");
    var android = AndroidNotificationDetails("id", "channel");

    var ios = IOSNotificationDetails();

    var platform = new NotificationDetails(android: android, iOS: ios);

    await _flutterLocalNotificationsPlugin.show(0, title, body, platform,
        payload: body);
  }*/
}
