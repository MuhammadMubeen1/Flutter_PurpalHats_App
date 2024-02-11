import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:property_managment/components/color.dart';

void configureApp() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: WHITE_COLOR,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
}