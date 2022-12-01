// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:goldnrose_flutter_app/section/temp/get_x/temp/temp_logic.dart';
// import 'package:goldnrose_flutter_app/section/temp/views/widgets/temp_inkwell.dart';
// import 'package:goldnrose_flutter_app/section/temp/views/widgets/temp_text.dart';

// class TempScreen extends StatefulWidget {
//   const TempScreen({Key? key}) : super(key: key);

//   @override
//   State<TempScreen> createState() => _TempScreenState();
// }

// class _TempScreenState extends State<TempScreen> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: GetBuilder<TempLogic>(
//         init: TempLogic(),
//         builder: (TempLogic logic) {
//           return Padding(
//             padding: const EdgeInsets.all(100.0),
//             child: Column(
//               children: [
//                 Semantics(
//                   label: '텍스트',
//                   child: Obx(() {
//                     return TempText(
//                       title: logic.state.temp.value.data,
//                     );
//                   }),
//                 ),
//                 Semantics(
//                   label: '길이',
//                   child: Obx(() {
//                     return TempText(
//                       title: logic.state.temp.value.length.toString(),
//                     );
//                   }),
//                 ),
//                 Semantics(
//                   label: '버튼 Get 예시',
//                   child: TempInkWell(
//                     onTap: () {
//                       logic.setData();
//                     },
//                     child: const SizedBox(
//                       child: TempText(
//                         title: '버튼 바꾸기',
//                       ),
//                     ),
//                   ),
//                 ),
//                 Semantics(
//                   label: '버튼 Post 예시',
//                   child: TempInkWell(
//                     onTap: () {
//                       logic.setLength('1033213');
//                     },
//                     child: const SizedBox(
//                       child: TempText(
//                         title: '버튼 바꾸기',
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
