import 'package:eco/features/personalization/screens/address/address.dart';
import 'package:eco/features/shop/screens/cart/cart.dart';
import 'package:eco/features/shop/screens/product_reviews/product_reviews.dart';
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
      home: const CartScreen(),
    );
  }
}
