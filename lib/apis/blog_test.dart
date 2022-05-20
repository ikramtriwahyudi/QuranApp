import 'package:dio/dio.dart';
import 'package:zulhijaya_task_project/models/blog_test_model.dart';
import 'package:zulhijaya_task_project/services/api.dart';
import 'package:zulhijaya_task_project/services/api_exception.dart';

class BlogTestAPI {
  Future<List<BlogTestModel>> list() async {
    try {
      final res = await API().useAuth().client().get('/items/blog_test');
      return BlogTestModel.fromList(res.data['data']) as List<BlogTestModel>;
    } on DioError catch (e) {
      throw APIException(e);
    }
  }

  Future<BlogTestModel> single(int id) async {
    try {
      final res = await API().useAuth().client().get('/items/blog_test/$id');
      return BlogTestModel.fromJson(res.data['data']);
    } on DioError catch (e) {
      throw APIException(e);
    }
  }

  Future<BlogTestModel> edit(int id, Map<String, dynamic> data) async {
    try {
      final res = await API()
          .useAuth()
          .client()
          .patch('/items/blog_test/$id', data: data);
      return BlogTestModel.fromJson(res.data['data']);
    } on DioError catch (e) {
      throw APIException(e);
    }
  }

  Future<BlogTestModel> add(Map<String, dynamic> data) async {
    try {
      final res =
          await API().useAuth().client().post('/items/blog_test', data: data);
      return BlogTestModel.fromJson(res.data['data']);
    } on DioError catch (e) {
      throw APIException(e);
    }
  }

  Future del(int id) async {
    try {
      return await API().useAuth().client().delete('/items/blog_test/$id');
    } on DioError catch (e) {
      throw APIException(e);
    }
  }
}
