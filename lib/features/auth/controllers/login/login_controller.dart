import 'package:eco/data/repositories/authentication/authentication_repository.dart';
import 'package:eco/utils/helpers/network_manager.dart';
import 'package:eco/utils/popups/full_screen_loader.dart';
import 'package:eco/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  /// Variables
  final localStorage = GetStorage();
  final hidePassword = true.obs; // Observable variable for password visibility
  final rememberMe = false.obs; // Observable variable for remember me
  final email = TextEditingController(); // Controller for email input
  final password = TextEditingController(); // Controller for password input
  GlobalKey<FormState> loginFormKey =
      GlobalKey<FormState>(); // Form key for form validation

  @override
  void onInit() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? '';
    password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? '';
    super.onInit();
  }

  // Login
  void login() async {
    try {
      /// Start Loading
      TFullScreenLoader.openLoadingDialog('Logging you in...',
          'assets/images/animations/141594-animation-of-docer.json');

      /// Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove Loader
        TFullScreenLoader.closeLoadingDialog();
      }

      /// Form Validation
      if (!loginFormKey.currentState!.validate()) {
        // Remove Loader
        TFullScreenLoader.closeLoadingDialog();
        return;
      }

      /// Save Data if remember me is selected
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      /// Login user in firebase auth
      final userCredential = await AuthenticationRepository.instance
          .signInWithEmailAndPassword(email.text.trim(), password.text.trim());

      /// Remove Loader
      TFullScreenLoader.closeLoadingDialog();

      /// Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TFullScreenLoader.closeLoadingDialog();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
