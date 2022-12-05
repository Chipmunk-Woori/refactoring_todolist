import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:refactoring_todolist/section/todolist/get_x/todolist_logic.dart';

class TodolistScreen extends StatefulWidget {
  const TodolistScreen({Key? key}) : super(key: key);

  @override
  State<TodolistScreen> createState() => TodolistScreenState();
}

class TodolistScreenState extends State<TodolistScreen> {
  @override
  void initState() {
    //위젯이 생성될 때 처음으로 호출되는 메서드(오직 한 번만 호출)
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: GetBuilder<TodolistLogic>(
          init: TodolistLogic(),
          builder: (TodolistLogic logic) {
            return SafeArea(
              child: (Container(
                color: Colors.black,
                width: double.infinity,
                height: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: SingleChildScrollView(
                  child: Column(children: [
                    Container(
                      //2 (todolist 박스)
                      padding: const EdgeInsets.only(bottom: 0, top: 0),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(251, 251, 251, 251),
                        borderRadius: BorderRadius.circular(15),
                      ),

                      child: Obx(() {
                        //수정
                        return (ListView.builder(
                          padding: const EdgeInsets.only(bottom: 0),
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: logic.todolistState.todolists.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 15),
                              child: Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(left: 0),
                                    child: Theme(
                                      data: Theme.of(context).copyWith(
                                        unselectedWidgetColor: Colors.black,
                                      ),
                                      child: Container(
                                          height: 24,
                                          width: 24,
                                          margin:
                                              const EdgeInsets.only(right: 20),
                                          child: Checkbox(
                                            value: logic.todolistState
                                                .todolists[index].done,
                                            onChanged: (value) {
                                              logic.changeDone(index, value);
                                            },
                                            checkColor: const Color.fromARGB(
                                                251, 251, 251, 251),
                                            activeColor: Colors.black,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                          )),
                                    ),
                                  ),
                                  Flexible(
                                    // ignore: sort_child_properties_last
                                    child: Text(
                                      logic.todolistState.todolists[index]
                                          .task, //수정
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 15),
                                    ),
                                    flex: 6,
                                    fit: FlexFit.tight,
                                  ),
                                  Flexible(
                                    // ignore: sort_child_properties_last
                                    child: Container(
                                      padding: EdgeInsets.zero,
                                      child: IconButton(
                                        padding: EdgeInsets.zero,
                                        constraints: BoxConstraints(),
                                        icon: Icon(Icons.cancel_outlined),
                                        color: Colors.black,
                                        iconSize: 15.0,
                                        onPressed: () {
                                          logic.removeTask(index);
                                        },
                                      ),
                                    ),
                                    flex: 1,
                                    fit: FlexFit.tight,
                                  ),
                                ],
                              ),
                            );
                          },
                        ));
                      }),
                    )
                  ]),
                ),
              )),
            );
          }),
    );
  }
}
