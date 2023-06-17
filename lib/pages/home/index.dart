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
      body: Center(
        child: GetBuilder<QuranController>(builder: (controller) {
          if (controller.items == null) {
            return const CircularProgressIndicator();
          }

          return Padding(
            padding: const EdgeInsets.only(top: 15, right: 20, left: 20),
            child: Column(
              children: [
                Container(
                  height: 200,
                  width: 200,
                  color: Colors.amber,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 60,
                  child: TextField(
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      hintText: "Cari Surah",
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    key: const Key('home_list_blogs'),
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: controller.items!.length,
                    itemBuilder: (context, index) {
                      final item = controller.items![index];

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
