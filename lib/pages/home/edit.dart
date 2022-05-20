import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:zulhijaya_task_project/components/alert.dart';
import 'package:zulhijaya_task_project/components/loading.dart';
import 'package:zulhijaya_task_project/components/rounded_textfield.dart';
import 'package:zulhijaya_task_project/components/rounded_textlongfield.dart';
import 'package:zulhijaya_task_project/controllers/blog_test_controller.dart';

class EditBlogPage extends StatelessWidget {
  EditBlogPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final bool isNewPost =
        Get.find<BlogTestController>().blog == null ? true : false;

    Future<void> editPost() async {
      if (_formKey.currentState?.value != null) {
        showLoading(context, 'Saving...');
        try {
          _formKey.currentState!.saveAndValidate();
          final id = Get.find<BlogTestController>().blog!.id;
          final Map<String, dynamic> data = {
            'title': _formKey.currentState!.value['title'],
            'description': _formKey.currentState!.value['description'],
          };
          await Get.find<BlogTestController>().edit(id, data);
          Get.back();
          Get.back();
        } catch (e) {
          Get.back();
          showAlert(context, e.toString());
        }
      }
    }

    Future<void> newPost() async {
      if (_formKey.currentState?.value != null) {
        showLoading(context, 'Saving...');
        try {
          _formKey.currentState!.saveAndValidate();
          final Map<String, dynamic> data = {
            'title': _formKey.currentState!.value['title'],
            'description': _formKey.currentState!.value['description'],
            'status': 'published',
          };
          await Get.find<BlogTestController>().add(data);
          Get.back();
          Get.back();
        } catch (e) {
          Get.back();
          showAlert(context, e.toString());
        }
      }
    }

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: const Text('Edit Blog'),
          actions: [
            IconButton(
              key: const Key('edit_save'),
              onPressed: () async {
                if (isNewPost) {
                  await newPost();
                } else {
                  await editPost();
                }
              },
              icon: const Icon(Icons.check),
            )
          ],
        ),
        body: GetBuilder<BlogTestController>(
          builder: (controller) => FormBuilder(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: ListView(
                children: [
                  RoundedTextField(
                    key: const Key('edit_title'),
                    name: 'title',
                    label: 'Title',
                    initialValue: controller.blog?.title.toString() ?? '',
                  ),
                  const SizedBox(height: 12),
                  RoundedTextLongField(
                    key: const Key('edit_description'),
                    name: 'description',
                    label: 'Description',
                    initialValue: controller.blog?.description.toString() ?? '',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
