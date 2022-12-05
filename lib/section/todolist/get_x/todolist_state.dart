import 'package:refactoring_todolist/section/todolist/model/todolist.dart';
import 'package:get/get.dart';

class TodolistState {
  TodolistState();

  RxList<Todolist> todolists = [
    Todolist(done: true, task: "할 일_1"),
    Todolist(done: false, task: "할 일_2"),
    Todolist(done: false, task: "할 일_3"),
    Todolist(done: false, task: "할 일_4"),
    Todolist(done: false, task: "할 일_5")
  ].obs;

  void add(String task) {
    todolists.add(Todolist(done: false, task: task));
  }

  void remove(int index) {
    todolists.removeAt(index);
  }
}
