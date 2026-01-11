import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/common/controllers/theme_controller.dart';
import 'package:instagram_clone/helper/get_di.dart' as di;
import 'package:instagram_clone/helper/route_helper.dart';
import 'package:instagram_clone/theme/dark_theme.dart';
import 'package:instagram_clone/theme/light_theme.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      builder: (themeController) {
        return MaterialApp.router(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: instagramLightTheme,
          darkTheme: instagramDarkTheme,
          themeMode: themeController.themeMode,
          routerConfig: RouteHelper.router,
        );
      },
    );
  }
}
