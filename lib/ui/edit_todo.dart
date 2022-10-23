import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qnbfinansbank_getx_todo_app/controllers/todo_controller.dart';

class TodoEdit extends StatelessWidget {
  final int? index;

  final String text;
  TodoEdit({super.key, required this.index, required this.text});

  final todoController = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    final TextEditingController textEditingController = TextEditingController();
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      // ),
      body: Container(
        padding: const EdgeInsets.only(top: 80),
        child: Column(
          children: [
            // textfield alanı
            Expanded(
              child: TextField(
                keyboardType: TextInputType.multiline,
                maxLines: 2,
                autofocus: true,
                decoration: InputDecoration(
                    hintText: text,
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none),
                style: TextStyle(fontSize: 25),
                controller: textEditingController,
              ),
            ),

            // buttonlar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        textStyle: const TextStyle(
                          color: Colors.black,
                        )),
                    onPressed: () {
                      // bir önceki sayfaya gidecez
                      // yani stack son elemanı çıkaracağız

                      Get.back();
                      print('pressed');
                    },
                    child: const Text(
                      'cancel',
                      style: TextStyle(color: Colors.black),
                    )),

                //  Spacer(),
                // SizedBox(
                //   width: 200,
                // ),
                ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    onPressed: () {
                      var editing = todoController.todos[index!];
                      editing.text = textEditingController.text;
                      todoController.todos[index!] = editing;

                      Get.back();
                    },
                    child: const Text('update')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
