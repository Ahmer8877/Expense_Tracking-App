import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/utils.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    nextScreen();
    super.initState();
  }

  void nextScreen()async{
     Future.delayed(const Duration(seconds: 3),(){
      if(!mounted){
        return;
      }
      Get.offNamed('/dashboard');
    });
  }
  @override
  Widget build(BuildContext context) {

    return const Scaffold(

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            CircleAvatar(
              backgroundColor: CupertinoColors.white,
                radius: 100,
                child: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Image(image:
                  AssetImage('assets/icons/expense.png')),
                )
            )
          ],
        ),
      ),
    );
  }
}
