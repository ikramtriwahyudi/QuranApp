import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zulhijaya_task_project/services/auth.dart';

class Navigate extends StatelessWidget {
  const Navigate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> navigate() async {
      await Auth.loadToken();
      await Auth.loggedIn() ? Get.offNamed('/home') : Get.offNamed('/login');
    }

    return FutureBuilder(
      future: navigate(),
      builder: ((context, snapshot) {
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }),
    );
  }
}
