import 'package:flutter/material.dart';

class Todolist extends StatefulWidget {
  const Todolist({Key? key}):super(key:key);

  @override 
  State<Todolist> createState() => TodolistState();
}

class TodolistState extends State<Todolist> {

  @override
  void initState() { //위젯이 생성될 때 처음으로 호출되는 메서드(오직 한 번만 호출)
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text('test'),
      ),
    );
  }

}