import 'package:flutter/material.dart';
import 'package:refactoring_todolist/section/selected_option/get_x/selected_option_logic.dart';
import 'package:get/get.dart';
import 'package:refactoring_todolist/section/selected_option/views/screen/pick_screen.dart';

class SelectedOptionScreen extends StatefulWidget {
  const SelectedOptionScreen({super.key});

  @override
  State<SelectedOptionScreen> createState() => SelectedOptionScreenState();
}

class SelectedOptionScreenState extends State<SelectedOptionScreen> {
  @override
  void initState() {
    super.initState();
  }

  void moveToPickScreen (BuildContext context) async {
    await Navigator.push(context, 
      MaterialPageRoute(builder: (context) => const PickScreen())
    );
  }

  Text showSelectedOption (SelectedOptionLogic controller) {
    if (controller.selectedOptionState.selectedOption.value < controller.selectedOptionState.options.length ) {
      return (
        Text(
          'Pick : ${controller.selectedOptionState.options[controller.selectedOptionState.selectedOption.value]}', 
          style: const TextStyle(color: Colors.white, fontSize: 25)
        )
      );
    } else {
      return (
        const Text('')
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SelectedOptionLogic());

    return Container(
      color: Colors.black,
      width: double.infinity, 
      height: double.infinity,
      child: Obx((){
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            showSelectedOption(controller),

            const SizedBox(height: 20),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, 
              ),
              onPressed: (){
                moveToPickScreen(context);
              }, 
              child: const Text(
                'Pick an option', 
                style: TextStyle(color: Colors.black)
              )
            )
          ],
        );
      })
    );
  }
}
