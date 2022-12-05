import 'package:get/get.dart';
import 'package:refactoring_todolist/section/todolist/get_x/todolist_state.dart';

class TodolistLogic extends GetxController {
  final TodolistState todolistState = TodolistState();

  //task 추가
  void addTodoList(String task) {
    if (task != '') {
      todolistState.add(task);
    }
  }

  //task 삭제
  void removeTask(int index) {
    todolistState.remove(index);
  }

  //check 변경
  void changeDone(int index, value) {
    todolistState.todolists[index] =
        todolistState.todolists[index].copyWith(done: value);
  }
}
