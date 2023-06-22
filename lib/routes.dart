import 'package:get/route_manager.dart';
import 'package:ikram_task_project/navigate.dart';
import 'package:ikram_task_project/pages/home/detail.dart';

import 'package:ikram_task_project/pages/home/index.dart';
import 'package:ikram_task_project/pages/login/index.dart';

List<GetPage> routes = [
  GetPage(name: '/', page: () => const Navigate()),
  GetPage(name: '/login', page: () => LoginPage()),
  GetPage(name: '/home', page: () => const HomePage()),
  GetPage(name: '/home/detail', page: () => DetailBlogPage()),
];
