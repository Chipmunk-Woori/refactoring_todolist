import 'package:get/get.dart';

class SelectedOptionState {
  SelectedOptionState();

  RxInt selectedOption = 3.obs;
  RxList options = ['option_1','option_2'].obs;

  void changeOption(int index) {
    selectedOption(index); //반응형 상태 변수 값 변경
  }
}