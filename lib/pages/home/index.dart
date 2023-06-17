import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/quran_controller.dart';
import '../../controllers/surah_controller.dart';

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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(padding: EdgeInsets.only(top: 50)),
                Text("Assalamualaikum"),
                Text("Selamat Datang Di Quran App"),
                Image.asset(
                  "assets/6630675.jpg",
                  scale: 7,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 60,
                  child: GetBuilder<QuranController>(
                      init: QuranController(),
                      builder: (con) {
                        return TextField(
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            hintText: "Cari Surah",
                          ),
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
                        child: ListTile(
                          title: Text(item.name.toString()),
                          subtitle: Text(item.translationId.toString()),
                          trailing: Text(
                            item.asma.toString(),
                            style: const TextStyle(fontSize: 28),
                          ),
                          leading: Text(item.number.toString(),
                              style: const TextStyle(fontSize: 18)),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
