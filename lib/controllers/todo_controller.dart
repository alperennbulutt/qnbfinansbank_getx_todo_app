import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:qnbfinansbank_getx_todo_app/models/todo.dart';

class TodoController extends GetxController {
  var todos = List<TodoModel>.empty().obs;

  @override
  void onInit() {
    print('oninit içerisine girdi');
    List? storedTodos = GetStorage().read<List>('todo');
    if (storedTodos != null) {
      todos = storedTodos.map((e) => TodoModel.fromJson(e)).toList().obs;
    }

    ever(todos, (_) {
      print('ever içerisine girdi');
      GetStorage().write('todo', todos.toList());
    });

    super.onInit();
  }
}
