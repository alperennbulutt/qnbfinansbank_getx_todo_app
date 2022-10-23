import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'ui/home_screen.dart';
import 'ui/todo_screen.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String title = "Getx Todo App";

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      debugShowCheckedModeBanner: false,
      title: title,
      initialRoute: HomeScreen.id,
      getPages: [
        // screen todo
        GetPage(
          name: TodoScreen.id,
          page: () => TodoScreen(),
        ),

        // home page
        GetPage(
          name: HomeScreen.id,
          page: () => HomeScreen(),
        ),
      ],
    );
  }
}
