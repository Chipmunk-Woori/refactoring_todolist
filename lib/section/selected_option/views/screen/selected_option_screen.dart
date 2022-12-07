import 'package:flutter/material.dart';
import 'package:refactoring_todolist/section/selected_option/get_x/selected_option_logic.dart';
import 'package:get/get.dart';

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

  String option = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      width: double.infinity, 
      height: double.infinity,
      child: GetBuilder<SelectedOptionLogic>(
        init: SelectedOptionLogic(),
        builder: (SelectedOptionLogic logic) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('${logic.selectedOptionState.selectedOption}', style: const TextStyle(color: Colors.white, fontSize: 25)),
              Text('선택한 옵션 : ${logic.selectedOptionState.selectedOption}', style: const TextStyle(color: Colors.white, fontSize: 25)),

              const SizedBox(height: 20),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, 
                ),
                onPressed: (){
                  logic.selectedOptionState.changeOption('test');
                }, 
                child: const Text('Pick an option', style: TextStyle(color: Colors.black))
              )
            ],
          );
        }
      ),
    );
  }
}
