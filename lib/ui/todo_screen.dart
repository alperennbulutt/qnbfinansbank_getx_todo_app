import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qnbfinansbank_getx_todo_app/controllers/todo_controller.dart';
import 'package:qnbfinansbank_getx_todo_app/models/todo.dart';

class TodoScreen extends StatelessWidget {
  static const id = "/Todo_Screen";
  TodoScreen({super.key});

  final TextEditingController textEditingController = TextEditingController();
  final todoController = Get.put(TodoController());

  // final TodoController todoController = Get.find<TodoController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo Screen'),
      ),
      body: Column(
        children: [
          // textfield
          Expanded(
            child: TextField(
              maxLines: 5,
              style: const TextStyle(fontSize: 25),
              decoration: const InputDecoration(
                  hintText: "Yapmak istediğinizi yazınız..."),
              controller: textEditingController,
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text('Cancel')),
              ElevatedButton(
                  onPressed: () {
                    todoController.todos
                        .add(TodoModel(text: textEditingController.text));

                    // context = todoscreen
                    Get.back();

                    Get.snackbar('title', 'message');

                    // context == snackbar
                  },
                  child: const Text('Kaydet')),
            ],
          )
        ],
      ),
    );
  }
}
