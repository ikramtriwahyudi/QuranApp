import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ikram_task_project/components/alert.dart';

import 'package:ikram_task_project/controllers/quran_controller.dart';
import 'package:ikram_task_project/controllers/surah_controller.dart';

class DetailBlogPage extends StatelessWidget {
  const DetailBlogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<SurahController>().getDetail.toString();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,

        // title: GetBuilder<QuranController>(builder: (con) {
        //   return Text(
        //     con.item!.name.toString(),
        //     style: const TextStyle(color: Colors.black),
        //   );
        // }),
      ),
      body: Center(
        child: GetBuilder<SurahController>(
            init: SurahController(),
            builder: (controller) {
              if (controller.item == null) {
                return const CircularProgressIndicator();
              }

              return Column(
                children: [
                  Container(
                    height: 200,
                    width: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xffFFFAF5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1.5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GetBuilder<QuranController>(builder: (controller) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Surah",
                                style: TextStyle(
                                    fontSize: 25, color: Color(0XFFecb67a)),
                              ),
                              Text(
                                controller.item!.name.toString(),
                                style: const TextStyle(
                                    fontSize: 30, color: Color(0XFFecb67a)),
                              ),
                            ],
                          );
                        }),
                        Image.asset(
                          "assets/detail.png",
                          scale: 3,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) => const Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Divider(
                          color: Colors.black,
                        ),
                      ),
                      itemCount: controller.item!.ayahs.length,
                      itemBuilder: (context, index) {
                        final ayat = controller.item!.ayahs[index];

                        return InkWell(
                            child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                ayat.ayahText,
                                style: const TextStyle(
                                  fontSize: 25,
                                ),
                                textAlign: TextAlign.end,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                ayat.readText.toString(),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                ayat.indoText,
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                        ));
                      },
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
