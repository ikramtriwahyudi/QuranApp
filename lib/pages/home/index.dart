import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zulhijaya_task_project/controllers/blog_test_controller.dart';
import 'package:zulhijaya_task_project/services/auth.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<BlogTestController>().list();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'List Blogs',
          key: Key('home_title'),
        ),
        actions: [
          PopupMenuButton(
            key: const Key('home_action_button'),
            itemBuilder: ((context) => [
                  PopupMenuItem(
                    key: const Key('home_action_button_edit'),
                    onTap: () async {
                      await Get.find<BlogTestController>().clearBlog();
                      await Future.delayed(
                        const Duration(milliseconds: 100),
                        () => Get.toNamed('/home/edit'),
                      );
                    },
                    child: const Text('Add New'),
                  ),
                  PopupMenuItem(
                    key: const Key('home_action_button_logout'),
                    onTap: () async {
                      await Auth.logout();
                      Get.offAllNamed('/');
                    },
                    child: const Text('Logout'),
                  ),
                ]),
          )
        ],
      ),
      body: Center(
        child: GetBuilder<BlogTestController>(
            init: BlogTestController(),
            builder: (controller) {
              if (controller.blogs == null) {
                return const CircularProgressIndicator();
              }

              return ListView.separated(
                key: const Key('home_list_blogs'),
                separatorBuilder: (context, index) => const Divider(),
                itemCount: controller.blogs!.length,
                itemBuilder: (context, index) {
                  final blog = controller.blogs![index];
                  return InkWell(
                    onTap: () {
                      Get.find<BlogTestController>().setBlog(blog);
                      Get.toNamed('/home/detail');
                    },
                    child: ListTile(
                      title: Text(blog.title.toString()),
                      subtitle: Text(blog.description.toString()),
                    ),
                  );
                },
              );
            }),
      ),
    );
  }
}
