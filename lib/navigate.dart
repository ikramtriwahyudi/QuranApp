import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ikram_task_project/preference/color_palette.dart';
import 'package:ikram_task_project/services/auth.dart';

class Navigate extends StatelessWidget {
  const Navigate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> navigate() async {
      Future.delayed(const Duration(seconds: 10), (() {
        Auth.loadToken();
        Auth.loggedIn() == Get.offNamed('/home');
      }));
    }

    return FutureBuilder(
      future: navigate(),
      builder: ((context, snapshot) {
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset("assets/home.jpg"),
              ),
              const Text(
                "By Ikramee",
                style: TextStyle(fontSize: 24, color: ColorPalette.threeColor),
              )
            ],
          ),
        );
      }),
    );
  }
}
