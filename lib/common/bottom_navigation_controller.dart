import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:refactoring_todolist/common/assets_manager.dart';
import 'package:refactoring_todolist/section/todolist/views/screen/todolist_screen.dart';
import 'package:refactoring_todolist/section/selected_option/views/screen/test_screen.dart';
import 'package:refactoring_todolist/common/assets_manager.dart';
import 'package:refactoring_todolist/common/style/text_style.dart';

class BottomNavigationController extends GetxController {
  var currentIndex = 0.obs;
  //Reactiv를 통한 상태관리에서는
  //변수 타입 지정 : 'Rx~' 또는 'var' 타입 지정 / 값 대입 : 값.obs

  List<String> navigationBarTitleList = ['할 일', '선택'];

  late List<GlobalKey<NavigatorState>>
      navigatorKeyList; //late : 값의 초기화를 뒤로 미루지만, null 사용 방지
  //Stateful 위젯의 순서나 개수를 변경할 때 Key가 중요한 역할 함.
  //GlobalKey 사용 목적 2가지
  //1.위젯이 상태를 잃지 않으면서 부모를 바꿀 수 있도록 해줌.
  //(예. 서로 ㄷ른 2개의 화면에서 동일한 위젯을 동일한 상태를 유지하면서 보여줌)
  //2.특정 위젯의 정보를 완전히 다른 위젯트리에서 접근 가능하게 해줌.
  //(예. 비밀번호는 검사하고 싶은데 해당 상태 정보를 트리의 다른 위젯과 공유하고싶지 않을 때)
  //테스트 진행할 때도 유용. 특정 위젯과 그 상태 정보를 추적하고 테스트 할 수 있음.

  List<BottomNavigationBarItem> bottomWidgetList = [];

  @override
  void onInit() {
    navigatorKeyList = List.generate(
        screenWidget.length, (index) => GlobalKey<NavigatorState>());

    bottomWidgetList = [
      defaultItem(
        icon: Icons.expand_circle_down_outlined,
        activeIcon: Icons.expand_circle_down_rounded,
        label: '할 일',
      ),
      defaultItem(
        icon: Icons.forest_outlined,
        activeIcon: Icons.forest,
        label: '선택',
      )
    ];

    super.onInit();
  }

  //페이지
  final List screenWidget = [const TodolistScreen(), const TestScreen()];

  BottomNavigationBarItem defaultItem(
      {required IconData icon,
      required IconData activeIcon,
      required String label}) {
    return BottomNavigationBarItem(
        label: label,
        icon: Column(
          children: [
            Icon(icon, color: Colors.white, size: 24.0),
            const SizedBox(
              height: 4,
            ),
            Text(
              label,
              // ignore: prefer_const_constructors
              style: TextStyle(fontSize: fontSize11, color: Colors.white),
            )
          ],
        ),
        activeIcon: Column(
          children: [
            Icon(activeIcon, color: Colors.white, size: 24.0),
            const SizedBox(
              height: 4,
            ),
            Text(
              label,
              // ignore: prefer_const_constructors
              style: TextStyle(fontSize: fontSize11, color: Colors.white),
            )
          ],
        ));
  }

  Widget get currenPage => screenWidget[currentIndex.value];

  void changePage(int index, bool clear) {
    if (clear) {
      navigatorKeyList.removeAt(index);
      navigatorKeyList.insert(index, GlobalKey<NavigatorState>());
    }
    currentIndex.value = index;
  }

  refreshPage(int index) {
    navigatorKeyList.removeAt(index);
    navigatorKeyList.insert(index, GlobalKey<NavigatorState>());
  }
}
