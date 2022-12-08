import 'package:flutter/material.dart';
import 'package:refactoring_todolist/section/selected_option/get_x/selected_option_logic.dart';
import 'package:get/get.dart';

class PickScreen extends StatelessWidget {
  const PickScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SelectedOptionLogic());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick an option'),
        backgroundColor: Colors.black,
      ),

      body: Container( 
        color: Colors.black,
        width: double.infinity, 
        height: double.infinity,
        child: Obx((){
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, 
                ),
                onPressed: (){
                  controller.change(0);
                  Navigator.pop(context);
                }, 
                child: Text('${controller.selectedOptionState.options[0]}', style: const TextStyle(color: Colors.black))
              ),

              const SizedBox(height: 20,),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, 
                ),
                onPressed: (){
                  controller.change(1);
                  Navigator.pop(context);
                }, 
                child: Text('${controller.selectedOptionState.options[1]}', style: const TextStyle(color: Colors.black))
              )
            ],
          );
        })
      )
    );
  }
}