import 'package:get/get.dart';


class TodolistLogic extends GetxController {
  //task 목록
  List todoList = [
    {
      'done': true,
      'task': 'X_할 일 1',
    },
    {
      'done': false,
      'task': 'X_할 일 2',
    },
    {
      'done': false,
      'task': 'X_할 일 3',
    },
    {
      'done': false,
      'task': 'X_할 일 4',
    },
    {
      'done': false,
      'task': 'X_할 일 5',
    }
  ];

  //task 추가
  void addTodoList (String task) {
    if (task != '') {
      todoList.add(
        {
          'done': false,
          'task': task
        }
      );

      update();
    } 
  }

  //task 삭제
  void removeTask (int index) {
    todoList.removeAt(index);

    update();
  }

  //check 변경
  void changeDone (int index, bool value) {
    todoList[index]['done'] = value;

    update();
  }

}