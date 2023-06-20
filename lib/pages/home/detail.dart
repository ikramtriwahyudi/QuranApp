import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ikram_task_project/controllers/quran_controller.dart';
import 'package:ikram_task_project/controllers/surah_controller.dart';

class DetailBlogPage extends StatelessWidget {
  const DetailBlogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<SurahController>().getDetail.toString();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: GetBuilder<QuranController>(builder: (con) {
          return Text(con.item!.name.toString());
        }),
      ),
      body: Center(
        child: GetBuilder<SurahController>(
            init: SurahController(),
            builder: (controller) {
              if (controller.item == null) {
                return const CircularProgressIndicator();
              }

              return ListView.separated(
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
              );
            }),
      ),
    );
  }
}
