import 'package:instagram_clone/features/auth/controllers/instagram_auth_controller.dart';
import 'package:instagram_clone/features/home/controllers/home_controller.dart';
import 'package:instagram_clone/features/home/domain/repositories/home_repository.dart';
import 'package:instagram_clone/features/home/domain/repositories/home_repository_interface.dart';
import 'package:instagram_clone/features/home/domain/services/home_service.dart';
import 'package:instagram_clone/features/home/domain/services/home_service_interface.dart';
import 'package:instagram_clone/features/profile/controllers/profile_controller.dart';
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
  Get.lazyPut<HomeRepositoryInterface>(
    () => HomeRepository(apiClient: Get.find()),
  );
  Get.lazyPut<HomeServiceInterface>(
    () => HomeService(repository: Get.find<HomeRepositoryInterface>()),
  );
  Get.lazyPut(
    () => HomeController(homeService: Get.find<HomeServiceInterface>()),
  );
  Get.lazyPut(() => ProfileController());

  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.baseUrl));




}
