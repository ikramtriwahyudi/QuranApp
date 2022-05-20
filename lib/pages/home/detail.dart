import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:zulhijaya_task_project/components/alert.dart';
import 'package:zulhijaya_task_project/components/loading.dart';
import 'package:zulhijaya_task_project/controllers/blog_test_controller.dart';

class DetailBlogPage extends StatelessWidget {
  const DetailBlogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text('Detail Blog'),
        actions: [
          PopupMenuButton(
            key: const Key('detail_action_button'),
            itemBuilder: ((context) => [
                  PopupMenuItem(
                    key: const Key('detail_action_button_edit'),
                    onTap: () => Future.delayed(
                      const Duration(milliseconds: 100),
                      () => Get.toNamed('/home/edit'),
                    ),
                    child: const Text('Edit'),
                  ),
                  PopupMenuItem(
                    key: const Key('detail_action_button_delete'),
                    onTap: () => Future.delayed(
                      const Duration(milliseconds: 100),
                      () async {
                        showLoading(context, 'Deleting...');
                        try {
                          final id = Get.find<BlogTestController>().blog!.id;
                          await Get.find<BlogTestController>().del(id);
                          await Get.find<BlogTestController>().clearBlog();
                          Get.offNamedUntil('/home', (route) => false);
                        } catch (e) {
                          Get.back();
                          showAlert(context, e.toString());
                        }
                      },
                    ),
                    child: const Text('Delete'),
                  ),
                ]),
          )
        ],
      ),
      body: GetBuilder<BlogTestController>(
        builder: (controller) => controller.blog == null
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.all(24.0),
                child: ListView(
                  children: [
                    Text(
                      'Title',
                      style: Theme.of(context).textTheme.caption,
                    ),
                    Text(
                      controller.blog!.title.toString(),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Description',
                      style: Theme.of(context).textTheme.caption,
                    ),
                    Text(
                      controller.blog!.description.toString(),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Status',
                      style: Theme.of(context).textTheme.caption,
                    ),
                    Text(
                      controller.blog!.status.toString(),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Created At',
                      style: Theme.of(context).textTheme.caption,
                    ),
                    Text(
                      controller.blog?.dateCreated == null
                          ? '-'
                          : DateFormat('d/M/y H:m').format(
                              DateTime.parse(
                                controller.blog!.dateCreated.toString(),
                              ),
                            ),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Last Update',
                      style: Theme.of(context).textTheme.caption,
                    ),
                    Text(
                      controller.blog?.dateUpdated == null
                          ? '-'
                          : DateFormat('d/M/y H:m').format(
                              DateTime.parse(
                                controller.blog!.dateUpdated.toString(),
                              ),
                            ),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
