import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:zulhijaya_task_project/apis/blog_test.dart';
import 'package:zulhijaya_task_project/models/blog_test_model.dart';

class BlogTestController extends GetxController {
  List<BlogTestModel>? _blogs;
  BlogTestModel? _blog;

  List<BlogTestModel>? get blogs => _blogs;
  BlogTestModel? get blog => _blog;

  Future<void> list() async {
    await BlogTestAPI().list().then((value) => _blogs = value);
    update();
  }

  Future<void> setBlog(BlogTestModel blog) async {
    _blog = blog;
    update();
  }

  Future<void> edit(int id, Map<String, dynamic> data) async {
    _blog = await BlogTestAPI().edit(id, data);
    list();
  }

  Future<void> add(Map<String, dynamic> data) async {
    _blog = await BlogTestAPI().add(data);
    list();
  }

  Future<void> del(int id) async {
    await BlogTestAPI().del(id);
    list();
  }

  clearBlog() {
    _blog = null;
    update();
  }
}
