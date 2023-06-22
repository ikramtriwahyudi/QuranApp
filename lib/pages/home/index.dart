import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/quran_controller.dart';
import '../../controllers/surah_controller.dart';
import '../../preference/color_palette.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Get.find<QuranController>().list();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: GetBuilder<QuranController>(builder: (controller) {
          if (controller.items == null) {
            return const CircularProgressIndicator();
          }

          return Padding(
            padding: const EdgeInsets.only(top: 15, right: 20, left: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(padding: EdgeInsets.only(top: 50)),
                const Text(
                  "Assalamualaikum",
                  style: TextStyle(fontSize: 25),
                ),
                const Text(
                  "Selamat Datang Di Quran App",
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    log("message");
                  },
                  child: Container(
                    height: 200,
                    width: 400,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: ColorPalette.primaryColor,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1.5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          )
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            "My Quran",
                            style: TextStyle(
                                fontSize: 30,
                                color: ColorPalette.secondaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                          Image.asset("assets/home.jpg")
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 60,
                  child: GetBuilder<QuranController>(
                      init: QuranController(),
                      builder: (con) {
                        return TextField(
                          decoration: InputDecoration(
                              suffixIcon: const Icon(Icons.search),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              hintText: "Cari Surah",
                              fillColor: ColorPalette.secondaryColor),
                          onChanged: (value) => con.filterlist(value),
                        );
                      }),
                ),
                Expanded(
                  child: ListView.separated(
                    key: const Key('home_list_blogs'),
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: controller.filteritems!.length,
                    itemBuilder: (context, index) {
                      final item = controller.filteritems![index];

                      return InkWell(
                        onTap: () {
                          Get.find<QuranController>().setItem(item);
                          Get.find<SurahController>()
                              .getDetail(item.number.toString());
                          Get.toNamed('/home/detail');
                        },
                        child: Column(
                          children: [
                            ListTile(
                              title: Text(item.name.toString()),
                              subtitle: Text(item.translationId.toString()),
                              trailing: Text(
                                item.asma.toString(),
                                style: const TextStyle(fontSize: 28),
                              ),
                              leading: Container(
                                height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    color: ColorPalette.secondaryColor),
                                child: Center(
                                  child: Text(
                                    item.number.toString(),
                                    style: const TextStyle(
                                        fontSize: 15, color: Colors.black87),
                                  ),
                                ),
                              ),
                            ),
                            const Divider(
                              color: Colors.black,
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
