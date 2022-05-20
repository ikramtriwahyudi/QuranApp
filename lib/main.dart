import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zulhijaya_task_project/controllers/blog_test_controller.dart';
import 'package:zulhijaya_task_project/routes.dart';

void main() async {
  runApp(const ZulhijayaApp());
}

class ZulhijayaApp extends StatelessWidget {
  const ZulhijayaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(BlogTestController());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zulhijaya',
      theme: ThemeData(
        fontFamily: GoogleFonts.lexendDeca().fontFamily,
        primarySwatch: Colors.deepOrange,
      ),
      initialRoute: '/',
      getPages: routes,
    );
  }
}
