import 'package:eco/bindings/general_bindings.dart';
import 'package:eco/utils/constants/colors.dart';
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
       initialBinding: GeneralBindings(),
      /// Show Loader or Circular Progress Indicator mean while Authentication Repository is deciding to show relevant screen
      home: const Scaffold(
        backgroundColor: TColors.primary,
        body: Center(
          child: CircularProgressIndicator(color: TColors.white),
        ),
      ),
    );
  }
}
