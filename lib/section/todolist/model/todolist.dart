class Todolist {
  Todolist({this.done = false, this.task = ""});

  final bool done;
  final String task;

  Todolist copyWith({
    bool? done,
    String? task,
  }) {
    return Todolist(done: done ?? this.done, task: task ?? this.task);
  }
}


//copyWith() : 위젯 커스텀 시 변경하고 싶은 속성값만 편하게 변경
//위젯의 기존 속성값은 그대로 사용하면서 변경하려는 속성값의 코드만 작성하면 됨