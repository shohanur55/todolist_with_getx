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

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: SplashScreen() ,
    );
  }
}


