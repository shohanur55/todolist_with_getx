 import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_with_getx/views_part/splash_screen.dart';

import 'views_part/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,


      theme: ThemeData(

colorScheme: ColorScheme.fromSeed(
  seedColor: Colors.transparent,
  outline: Color(0xFFEDE8FF),
),
shadowColor: Colors.white,
        cardColor: Colors.white,



       useMaterial3: true,

        appBarTheme: AppBarTheme(
          centerTitle: true,
          toolbarHeight: 80,
        ),

      ),
      scrollBehavior: const MaterialScrollBehavior().copyWith(dragDevices: {
        PointerDeviceKind.mouse,
        PointerDeviceKind.touch,
      }),
      home: SplashScreen(),
    );
  }
}
