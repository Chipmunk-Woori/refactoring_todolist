import 'package:get/get.dart';
import 'package:refactoring_todolist/section/selected_option/get_x/selected_option_state.dart';

class SelectedOptionLogic extends GetxController {
  final SelectedOptionState selectedOptionState = SelectedOptionState();

  void change(int index) {
    selectedOptionState.changeOption(index);
  }
}