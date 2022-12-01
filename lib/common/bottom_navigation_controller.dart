// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:goldnrose_flutter_app/common/assets_manager.dart';
// import 'package:goldnrose_flutter_app/common/style/color.dart';
// import 'package:goldnrose_flutter_app/common/style/text_style.dart';
// import 'package:goldnrose_flutter_app/common/widget/text.dart';
// import 'package:goldnrose_flutter_app/section/alarm/views/screen/alarm_screen.dart';
// import 'package:goldnrose_flutter_app/section/circle/views/screen/circle_screen.dart';
// import 'package:goldnrose_flutter_app/section/link/views/screen/link_screen.dart';
// import 'package:goldnrose_flutter_app/section/my_info/views/screen/my_info_screen.dart';
// import 'package:goldnrose_flutter_app/section/today/views/screen/today_screen.dart';

// class BottomNavigationController extends GetxController {
//   var currentIndex = 0.obs;
//   List<String> navigationBarTitleList = ['투데이', '링크', '알림', '서클', '내정보'];
//   late List<GlobalKey<NavigatorState>> navigatorKeyList;
//   List<BottomNavigationBarItem> bottomWidgetList = [];

//   @override
//   void onInit() {
//     navigatorKeyList =
//         List.generate(widget.length, (index) => GlobalKey<NavigatorState>());
//     bottomWidgetList = [
//       defaultItem(
//         icon: assetManager.today,
//         activeIcon: assetManager.ic_nav_today_on,
//         label: '투데이',
//       ),
//       defaultItem(
//         icon: assetManager.ic_link,
//         activeIcon: assetManager.ic_nav_link_on,
//         label: '링크',
//       ),
//       defaultItem(
//         icon: assetManager.ic_nav_notice,
//         activeIcon: assetManager.ic_nav_notice_on2,
//         label: '알림',
//       ),
//       defaultItem(
//         icon: assetManager.circle,
//         activeIcon: assetManager.ic_nav_circle_on,
//         label: '서클',
//       ),
//       defaultItem(
//         icon: assetManager.myinfo,
//         activeIcon: assetManager.ic_nav_myinfo,
//         label: '내정보',
//       ),
//     ];
//     super.onInit();
//   }

//   // 페이지를 넣으시면 됩니다.
//   final List widget = [
//     const TodayScreen(),
//     const LinkScreen(),
//     const AlarmScreen(),
//     const CirCleScreen(),
//     const MyInfoScreen(),
//   ];

//   BottomNavigationBarItem defaultItem(
//       {required String icon,
//       required String activeIcon,
//       required String label}) {
//     return BottomNavigationBarItem(
//       label: label,
//       icon: Column(
//         children: [
//           SvgPicture.asset(
//             icon,
//             width: 24,
//             height: 24,
//           ),
//           const SizedBox(
//             height: 4,
//           ),
//           TextWidget(
//             title: label,
//             fontSize: fontSize11,
//             color: white,
//           ),
//         ],
//       ),
//       activeIcon: Column(
//         children: [
//           SvgPicture.asset(
//             activeIcon,
//             width: 24,
//             height: 24,
//           ),
//           const SizedBox(
//             height: 4,
//           ),
//           TextWidget(
//             title: label,
//             fontSize: fontSize11,
//             color: cC9A46D,
//           ),
//         ],
//       ),
//     );
//   }

//   Widget get currentPage => widget[currentIndex.value];

//   void changePage(int index, bool clear) {
//     if (clear) {
//       navigatorKeyList.removeAt(index);
//       navigatorKeyList.insert(index, GlobalKey<NavigatorState>());
//     }
//     currentIndex.value = index;
//   }

//   refreshPage(int index) {
//     navigatorKeyList.removeAt(index);
//     navigatorKeyList.insert(index, GlobalKey<NavigatorState>());
//   }
// }
