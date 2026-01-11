import 'package:instagram_clone/features/auth/controllers/instagram_auth_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

import '../common/controllers/theme_controller.dart';
import '../api/api_client.dart';
import '../util/app_constants.dart';

Future<void> init() async {

  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut<SharedPreferences>(() => sharedPreferences);
  Get.lazyPut(() => ThemeController(sharedPreferences: Get.find()));
  Get.lazyPut(() => InstagramAuthController());

  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.baseUrl));






}
