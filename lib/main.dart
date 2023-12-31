import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:ikram_task_project/controllers/quran_controller.dart';
import 'package:ikram_task_project/controllers/surah_controller.dart';
import 'package:ikram_task_project/routes.dart';

void main() async {
  runApp(const IkramApp());
}

class IkramApp extends StatelessWidget {
  const IkramApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SurahController());
    Get.put(QuranController());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ikram',
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      initialRoute: '/',
      getPages: routes,
    );
  }
}
