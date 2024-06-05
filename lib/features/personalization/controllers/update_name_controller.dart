import 'package:eco/data/repositories/user/user_repository.dart';
import 'package:eco/features/personalization/controllers/user_controller.dart';
import 'package:eco/utils/constants/image_strings.dart';
import 'package:eco/utils/helpers/network_manager.dart';
import 'package:eco/utils/popups/full_screen_loader.dart';
import 'package:eco/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();

  final lastName = TextEditingController();
  final userCotroller = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateNameFormKey = GlobalKey<FormState>();

  /// init user data when Home screen appears
  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  /// Fetch user record
  Future<void> initializeNames() async {
    firstName.text = userCotroller.user.value.firstName;
    lastName.text = userCotroller.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog(
          'We are updating your information...', TImages.docerAnimation);

      // Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove Loader
        TFullScreenLoader.closeLoadingDialog();
        return;
      }

      // Form Validation
      if (!updateNameFormKey.currentState!.validate()) {
        // Remove Loader
        TFullScreenLoader.closeLoadingDialog();
        return;
      }

      // Update user name in firestore
      await userRepository.updateSingleField({
        "FirstName": firstName.text.trim(),
        "LastName": lastName.text.trim()
      });

      // Update the Rx User value
      userCotroller.user.value.firstName = firstName.text.trim();
      userCotroller.user.value.lastName = lastName.text.trim();

      // Remove Loader
      TFullScreenLoader.closeLoadingDialog();

      // Show success snackbar
      TLoaders.successSnackBar(
          title: 'Success', message: 'Your name has been updated successfully');

      // // Move to previous screen
      // Get.off(() => const ProfileScreen());
    } catch (e) {
      // Remove Loader
      TFullScreenLoader.closeLoadingDialog();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
