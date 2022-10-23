import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qnbfinansbank_getx_todo_app/controllers/todo_controller.dart';
import 'package:qnbfinansbank_getx_todo_app/main.dart';
import 'package:qnbfinansbank_getx_todo_app/ui/edit_todo.dart';
import 'package:qnbfinansbank_getx_todo_app/ui/todo_screen.dart';

class HomeScreen extends StatelessWidget {
  static const id = "/Home_screen";

  HomeScreen({super.key});

  final todoController = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(MyApp.title),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (() {
            Get.toNamed(TodoScreen.id);
          }),
          child: const Icon(Icons.add),
        ),
        body: Obx(
          () => ListView.builder(
            itemCount: todoController.todos.length,
            itemBuilder: (context, index) => Dismissible(
                key: UniqueKey(),
                onDismissed: (direction) {
                  todoController.todos.removeAt(index);

                  Get.snackbar('Silindi', 'yapılacak eleman silindi');
                },
                child: ListTile(
                  leading: Checkbox(
                    value: todoController.todos[index].done,
                    onChanged: (newValue) {
                      var todo = todoController.todos[index];
                      todo.done = newValue!;

                      todoController.todos[index] = todo;
                    },
                  ),
                  title: Text(
                    todoController.todos[index].text!,
                    style: todoController.todos[index].done
                        ? const TextStyle(
                            color: Colors.red,
                            decoration: TextDecoration.lineThrough,
                          )
                        : const TextStyle(color: Colors.black),
                  ),
                  trailing: IconButton(
                      onPressed: () => Get.to(TodoEdit(
                            index: index,
                            text: todoController.todos[index].text.toString(),
                          )),
                      // Get.toNamed("/TodoEdit"),

                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => TodoEdit(),
                      //     )),
                      icon: const Icon(Icons.edit)),
                )),
          ),
        ));
  }
}
