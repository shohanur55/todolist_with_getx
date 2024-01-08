import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controllers_part/todoController.dart';
import 'Animation_text.dart';
import 'home_screen.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key,});


  @override
  Widget build(BuildContext context) {
    TodoController controller = Get.put(TodoController());

  Future.delayed(Duration(seconds: 6), () {
    // Loading data in the splash screen
    controller.loading().then((_) {
      // Navigating to the home page when data is loaded
      Get.off(() => MyHomePage());
    });


  });


    return Scaffold(
      backgroundColor:Colors.cyanAccent,//Color(0xFF3498db),
      body: SafeArea(
        child: Center(
          child:
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Space at top
              SizedBox(height: 20),
              Flexible(flex:2,child:AnimatedText() ),

              // Logo and status
              Flexible(

                child: Column(
                  children: [
                    SizedBox(child: Image.asset("lib/assets/logo/gtr.png",fit: BoxFit.fitWidth,)),
                    const SizedBox(height: 20),
                    //Text(status, style: subTitle1),
                  ],
                ),
              ),
            ],
          ),

        ),
      ),
    );
  }
}
