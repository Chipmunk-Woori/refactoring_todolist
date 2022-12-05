import 'package:flutter/material.dart';
import 'package:refactoring_todolist/section/todolist/get_x/todolist_logic.dart';
import 'package:refactoring_todolist/section/todolist/get_x/todolist_state.dart';

class AddButton extends StatelessWidget {
  const AddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GetBuilder<TasksController>(builder: (controller) {
        return FloatingActionButton(
          backgroundColor: const Color.fromARGB(251, 251, 251, 251),

          // onPressed: _addTask,
          onPressed: () {
            BuildContext dialogContext;
            showDialog(
                context: context,
                builder: (context) {
                  dialogContext = context;
                  return Dialog(
                    child: Container(
                      height: 300,
                      child: Column(
                        children: [
                          TextField(
                              decoration: InputDecoration(
                                hintText: '어떤 일을 하시겠습니까?',
                              ),

                              // onSubmitted: (text) {
                              //   widget.addTodoList(text, dialogContext);
                              // },
                              onSubmitted: (text) {
                                if (text != '') {
                                  controller.xAddTodoList(text);
                                  Navigator.pop(dialogContext);
                                  setState(() {
                                    text = '';
                                  });
                                } else {
                                  Fluttertoast.showToast(
                                      msg: '내용을 입력해주세요.',
                                      gravity: ToastGravity.CENTER,
                                      fontSize: 15,
                                      textColor: Colors.black,
                                      backgroundColor:
                                          Color.fromARGB(251, 251, 251, 251),
                                      toastLength: Toast.LENGTH_SHORT);
                                }
                              },
                              controller: inputData,
                              keyboardType: TextInputType.multiline,
                              maxLines: null),
                          TextButton(
                            child: Text('추가'),

                            // onPressed: (){
                            //   widget.addTodoList(inputData.text, dialogContext);
                            // },
                            onPressed: () {
                              if (inputData.text != '') {
                                controller.xAddTodoList(inputData.text);
                                Navigator.pop(dialogContext);
                                setState(() {
                                  inputData.text = '';
                                });
                              } else {
                                Fluttertoast.showToast(
                                    msg: '내용을 입력해주세요.',
                                    gravity: ToastGravity.CENTER,
                                    fontSize: 15,
                                    textColor: Colors.black,
                                    backgroundColor:
                                        Color.fromARGB(251, 251, 251, 251),
                                    toastLength: Toast.LENGTH_SHORT);
                              }
                            },
                          )
                        ],
                      ),
                    ),
                  );
                });
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add, color: Colors.black),
        );
      }),
    );
  }
}
