import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:refactoring_todolist/section/todolist/get_x/todolist_logic.dart';

class TodolistScreen extends StatefulWidget {
  const TodolistScreen({Key? key}):super(key:key);

  @override 
  State<TodolistScreen> createState() => TodolistScreenState();
}

class TodolistScreenState extends State<TodolistScreen> {

  @override
  void initState() { //위젯이 생성될 때 처음으로 호출되는 메서드(오직 한 번만 호출)
    super.initState();
  }

  //여기
  bool done = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // appBar: AppBar(),

      body: GetBuilder<TodolistLogic>(
        init: TodolistLogic(),
        builder: (TodolistLogic logic) {
          return Container(
            color: Colors.black,
            width: double.infinity, 
            height: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: SingleChildScrollView(
              child: Column( 
                children: [
                  Container( //2 (todolist 박스)
                    padding: const EdgeInsets.only(bottom:0, top: 0),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(251, 251, 251, 251),
                      borderRadius: BorderRadius.circular(15),
                    ),
                      
                    child: (
                      ListView.builder(
                        padding: const EdgeInsets.only(bottom: 0),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: logic.todoList.length,
                        itemBuilder: (BuildContext context, int index){
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(left:0),
                                  child: Theme(
                                    data: Theme.of(context).copyWith(
                                      unselectedWidgetColor: Colors.black,
                                    ),
                                    child: Container(
                                      height: 24,
                                      width: 24,
                                      margin: const EdgeInsets.only(right: 20),
                                      child: Checkbox(
                                        //여기
                                        value: logic.todoList[index]['done'], 

                                        //여기
                                        // onChanged: (value) {
                                        //   logic.changeDone(index, value);
                                        // },
                                        onChanged: (value) {
                                          logic.changeDone(index, true);
                                        },
                                        //----

                                        checkColor: const Color.fromARGB(251, 251, 251, 251),
                                        activeColor: Colors.black,
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)), 
                                      ),
                                    ),
                                  ),
                                ),
                      
                                
                                Flexible(
                                  // ignore: sort_child_properties_last
                                  child: Text(
                                    '${logic.todoList[index]['task']}',
                                    style: const TextStyle(color: Colors.black, fontSize: 15),
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
                                      
                                      onPressed: (){
                                        logic.removeTask(index);
                                      },
                                      // onPressed: (){
                                      //   setState(() {
                                      //     widget.todoList.removeAt(index);
                                      //   });
                                      // },
                                    ),
                                  ),
                                  flex: 1,
                                  fit: FlexFit.tight,
                                ),
                              ],
                            ),
                          );
                        },
                      )
                    ),
                  )
                ]),
            ),
          );
        }
      ),
    );
  }

}