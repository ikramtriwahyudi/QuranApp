import 'dart:developer';

import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:ikram_task_project/models/quran_model.dart';
import 'package:ikram_task_project/services/api.dart';

class QuranController extends GetxController {
  List<QuranModel>? _items;
  QuranModel? _item;
  List<QuranModel>? _filteritems;

  List<QuranModel>? get items => _items;
  QuranModel? get item => _item;
  List<QuranModel>? get filteritems => _filteritems;

//ini function
  Future<void> list() async {
    final respon = await API().client().get("/surah");
    // log(respon.toString());
    _items = QuranModel.fromList(respon.data['data']) as List<QuranModel>;
    _filteritems = [..._items ?? []];
    update();
  }

  Future<void> setItem(QuranModel newitem) async {
    _item = newitem;
    log(_item!.name.toString());
    update();
  }

  //function pencarian
  Future<void> filterlist(String keyword) async {
    _filteritems = _items
        ?.where((element) =>
            element.name.toLowerCase().contains(keyword.toLowerCase()))
        .toList();
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
