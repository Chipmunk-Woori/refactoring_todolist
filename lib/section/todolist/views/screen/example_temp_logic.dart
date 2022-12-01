// import 'package:get/get.dart';
// import 'package:goldnrose_flutter_app/common/config/network/result.dart';
// import 'package:goldnrose_flutter_app/section/temp/api/temp_repo_impl.dart';
// import 'package:goldnrose_flutter_app/section/temp/api/use_case/get_temp.dart';
// import 'package:goldnrose_flutter_app/section/temp/api/use_case/post_temp.dart';

// import 'temp_state.dart';

// class TempLogic extends GetxController {
//   final TempState state = TempState();
//   GetTemp getTemp = GetTemp();
//   PostTemp postTemp = PostTemp();

//   Future<void> setData() async {
//     Result<String> result = await getTemp();
//     result.when(success: (String value) {
//       state.temp.value = state.temp.value.copyWith(data: value);
//     }, error: (data) {
//       /// 에러처리
//       state.temp.value = state.temp.value.copyWith(data: 'Error');
//     });
//   }

//   Future<void> setLength(String data) async {
//     Result<int> result = await postTemp(data);
//     result.when(success: (int value) {
//       state.temp.value = state.temp.value.copyWith(length: value);
//     }, error: (data) {
//       /// 에러처리
//       state.temp.value = state.temp.value.copyWith(data: 'Error');
//     });
//   }
// }
