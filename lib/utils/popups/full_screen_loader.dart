import 'package:eco/common/widgets/loaders/animation_loader.dart';
import 'package:eco/utils/constants/colors.dart';
import 'package:eco/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// A utility class for managing a full-screen loading dialog.
class TFullScreenLoader {
  /// Open a full-screen loading dialog with a given text and animation.
  /// This method doesn't return anything.
  ///
  /// Parameters:
  ///   - text: The text to be displayed in the loading dialog.
  ///   - animation: The Lottie animation to be shown.
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get
          .overlayContext!, // Use Get.overlayContext for overlay dialogs barrierDismissible: false, // The dialog can't be dismissed by tapping outside it builder: () => PopScope(
      barrierDismissible:
          false, // The dialog can't be dismissed by tapping outside it
      builder: (BuildContext context) => PopScope(
        canPop: false, // disable popping with the back button
        child: Container(
          color: THelperFunctions.isDarkMode(Get.context!)
              ? TColors.dark
              : TColors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 250),
              TAnimationLoaderWidget(text: text, animation: animation),
            ],
          ),
        ),
      ),
    );
  }

  /// Stop the currently open full-screen loading dialog.
  /// This method doesn't return anything.
  static void closeLoadingDialog() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
