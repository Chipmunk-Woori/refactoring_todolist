import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:refactoring_todolist/common/bottom_navigation_controller.dart';

class MainViewPage extends StatefulWidget {
  const MainViewPage({super.key});

  @override
  State<MainViewPage> createState() => MainViewPageState();
}

class MainViewPageState extends State<MainViewPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavigationController>(
      init: BottomNavigationController(),
      builder: (con) {
        return Obx(
          () => WillPopScope(
            onWillPop: () async {
              return !(await con
                  .navigatorKeyList[con.currentIndex.value].currentState!
                  .maybePop());
            },
            child: Scaffold(
              // appBar: appbar(
              //   con.navigationBarTitleList[con.currentIndex.value],
              // ),
              bottomNavigationBar: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.0,
                  ),
                ),
                child: BottomNavigationBar(
                  backgroundColor: Colors.black,
                  type: BottomNavigationBarType.fixed,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  elevation: 0,
                  currentIndex: con.currentIndex.value,
                  onTap: (idx) => con.changePage(idx, false),
                  items: con.bottomWidgetList,
                ),
              ),
              body: IndexedStack(
                index: con.currentIndex.value,
                children: con.screenWidget.map(
                  (page) {
                    int index = con.screenWidget.indexOf(page);
                    return Navigator(
                      key: con.navigatorKeyList[index],
                      onGenerateRoute: (_) {
                        return MaterialPageRoute(builder: (context) => page);
                      },
                    );
                  },
                ).toList(),
              ),
            ),
          ),
        );
      },
    );
  }
}