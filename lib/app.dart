import 'package:eco/features/shop/screens/order/order.dart';
import 'package:eco/features/shop/screens/sub_category/sub_category.dart';
import 'package:eco/utils/constants/text_strings.dart';
import 'package:eco/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: TTexts.appName,
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      // initialBinding: GeneralBindings(),
      home: const SubCategoriesScreen(),
    );
  }
}
