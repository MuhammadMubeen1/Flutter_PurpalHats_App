// ignore_for_file: unused_local_variable, prefer_const_constructors, unused_import, depend_on_referenced_packages, unused_element




import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:flutter_downloader/flutter_downloader.dart';/
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:property_managment/controller/notification/notification_controller.dart';
import 'package:property_managment/services/app_route.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
final notificationCo = Get.put(NotificationController());

FirebaseMessaging? _firebaseMessaging;
late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message1: ${message.messageId}");
  await Firebase.initializeApp();
}

void main() async {
   

  Stripe.publishableKey = 'pk_test_51MRaTJF6Z1rhh5U4MNaqxGCB6W0q9jpChr38P0XGxBWxwxHCq0Zcoj51ocXiDz3vv07ngUxak47ndtbaNk9Hyojq00ANDUYmf5';

 
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
 SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  final Locale? deviceLocale = Get.deviceLocale;
  await GetStorage.init();

  String initialRoute = AppPages.INITIAL;
  _initializeFlutterDownloader();
  notification();

  // await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  runApp(
     
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: initialRoute,
      fallbackLocale: Locale('en', 'US'),
      locale: deviceLocale,
      getPages: AppPages.routes,
      theme: ThemeData(fontFamily: "Muli"),
      themeMode: ThemeMode.system,
    ),
  );
}

_initializeFlutterDownloader() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize();
}

notification() async {
  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  _firebaseMessaging?.getNotificationSettings();
  // NotificationSettings settings = await _firebaseMessaging!.requestPermission(
  //   alert: true,
  //   badge: true,
  //   provisional: false,
  //   sound: true,
  // );
}
