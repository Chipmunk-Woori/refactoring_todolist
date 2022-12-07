import 'package:get/get.dart';

class SelectedOptionState {
  SelectedOptionState();

  RxString selectedOption = '변경 전'.obs;
  RxList options = ['option_1','option_2'].obs;

  void changeOption(String option) {
    selectedOption = option as RxString;
  }
}