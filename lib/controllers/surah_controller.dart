import 'dart:developer';

import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:ikram_task_project/models/surah_model.dart';
import 'package:ikram_task_project/services/api.dart';

class SurahController extends GetxController {
  SurahModel? _item;

  SurahModel? get item => _item;

  Future<void> getDetail(String number) async {
    final respon = await API().client().get("/surah/$number");
    _item = SurahModel.fromJson(respon.data);
    update();
  }

  Future<void> setItem(SurahModel newitem) async {
    _item = newitem;
    log(_item!.number.toString());
    update();
  }

  // Future<void> edit(int id, Map<String, dynamic> data) async {
  //   _blog = await BlogTestAPI().edit(id, data);
  //   list();
  // }

  // Future<void> add(Map<String, dynamic> data) async {
  //   _blog = await BlogTestAPI().add(data);
  //   list();
  // }

  // Future<void> del(int id) async {
  //   await BlogTestAPI().del(id);
  //   list();
  // }

  // clearBlog() {
  //   _blog = null;
  //   update();
  // }
}
