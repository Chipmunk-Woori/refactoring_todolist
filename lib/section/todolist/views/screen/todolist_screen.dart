import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:refactoring_todolist/section/todolist/get_x/todolist_logic.dart';
import 'package:refactoring_todolist/section/todolist/views/widgets/add_button.dart';
import 'package:fluttertoast/fluttertoast.dart';

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

  TextEditingController inputData = TextEditingController(); 
  String inputTask = '';
  

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
                        return (ListView.builder(
                          padding: const EdgeInsets.only(bottom: 0),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
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
                                            value: logic.todolistState.todolists[index].done,
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
                                      logic.todolistState.todolists[index].task, //수정
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
                                        constraints: const BoxConstraints(),
                                        icon: const Icon(Icons.cancel_outlined),
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
                    ),

                    Container(
                      alignment: Alignment.centerRight,
                      child: AddButton(onTab: (){
                        BuildContext dialogContext;
                        showDialog(
                          context: context, 
                          builder: (context) {
                            dialogContext = context;
                            return Dialog(
                              child: SizedBox(
                                height: 300,
                                child: Column(
                                  children: [
                                    TextField(
                                      decoration: const InputDecoration(
                                        hintText: '어떤 일을 하시겠습니까?',
                                      ),
                                      controller: inputData,
                                      keyboardType: TextInputType.multiline,
                                      maxLines: null,
                                      onChanged: (value) {
                                        setState(() {
                                          inputTask = value;
                                        });
                                      },
                                    ),

                                    TextButton(
                                      child: const Text('추가'),
                                      onPressed: (){
                                        if (inputData.text != '') {
                                          logic.addTodoList(inputTask); 
                                          Navigator.pop(dialogContext);
                                          setState(() {
                                            inputTask = '';
                                            inputData.text = '';
                                          });
                                        } else {
                                          Fluttertoast.showToast(
                                            msg: '내용을 입력해주세요.',
                                            gravity: ToastGravity.CENTER,
                                            fontSize: 15,
                                            textColor: Colors.black,
                                            backgroundColor: const Color.fromARGB(251, 251, 251, 251),
                                            toastLength: Toast.LENGTH_SHORT
                                          );
                                        }
                                      },
                                    )
                                  ],
                                ),
                              ),
                            );
                          }
                        );
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
