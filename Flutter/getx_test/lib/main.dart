import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_test/services/bindings/home_bindings.dart';
import 'package:getx_test/services/bindings/cart_bindings.dart';
import 'package:getx_test/services/bindings/translation_bindings.dart';
import 'package:getx_test/services/bindings/user_bindings.dart';
import 'package:getx_test/services/settings.dart';
import 'package:getx_test/services/translations/translations.dart';
import 'package:getx_test/themes/modules/theme.dart';
import 'package:getx_test/themes/theme_controller.dart';
import 'package:getx_test/views/cart/cart.dart';
import 'package:getx_test/views/first_page.dart';
import 'package:getx_test/views/home_page.dart';
import 'package:getx_test/views/users/users_view.dart';

Future<void> initServices() async {
  // need to init all services such in this functions
  debugPrint("starting services ...");
  await GetStorage.init();
  await Get.putAsync(() => SettingsService().init());
  debugPrint("services started ...");
}

void main() async {
  // must call WidgetsFlutterBinding to init async services`
  // shared_pref, hive, get_storage
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  final controller = Get.put(ThemeController());

  runApp(
    GetMaterialApp(
      home: MyApp(),
      initialRoute: "/",
      translations: TranslationMessage(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale("en", "US"),
      initialBinding: TranslationBinding(),
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      themeMode: controller.theme,
      getPages: [
        GetPage(
            name: '/first',
            page: () => FirstPage(),
            // fenix is used to recreate the instance from 'same place'
            // binding: BindingsBuilder(
            //     () => Get.lazyPut(() => HomeController(), fenix: true)),
            binding: HomeBinding()),
        GetPage(
          name: '/home',
          page: () => HomePage(),
        ),
        GetPage(
          name: '/cart',
          page: () => Cart(),
          binding: CartBinding(),
        ),
        GetPage(
          name: '/users',
          page: () => UsersView(),
          binding: UserBinding(),
        ),
      ],
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final controller = Get.find<SettingsService>();
  // or we can use GetView<SettingsService> this is StatelessWidget
  // and initialize controller instance
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Get.toNamed('/home');
                },
                child: const Text("Get.toNamed('/home')"),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed('/cart');
                },
                child: const Text("Get.toNamed('/cart')"),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed('/users');
                },
                child: const Text("Get.toNamed('/users')"),
              ),
              Obx(
                () => Text("Pressed ${controller.counter.value} time"),
              ),
              ElevatedButton(
                child: const Text("Increment"),
                onPressed: () => controller.incrementCounter(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
