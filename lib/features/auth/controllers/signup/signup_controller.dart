import 'package:eco/data/repositories/authentication/authentication_repository.dart';
import 'package:eco/data/repositories/user/user_repository.dart';
import 'package:eco/features/auth/screens/signup/verify_email.dart';
import 'package:eco/features/personalization/models/user_model.dart';
import 'package:eco/utils/helpers/network_manager.dart';
import 'package:eco/utils/popups/full_screen_loader.dart';
import 'package:eco/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// Variables
  final hidePassword = true.obs; // Observable variable for password visibility
  final privacyPolicy =
      true.obs; // Observable variable for privacy policy checkbox status
  final email = TextEditingController(); // Controller for email input
  final firstName = TextEditingController(); // Controller for first name input
  final lastName = TextEditingController(); // Controller for last name input
  final username = TextEditingController(); // Controller for username input
  final password = TextEditingController(); // Controller for password input
  final phoneNumber =
      TextEditingController(); // Controller for phone number input
  GlobalKey<FormState> signupFormKey =
      GlobalKey<FormState>(); // Form key for form validation

  /// Signup
  void signup() async {
    try {
      /// Start Loading
      TFullScreenLoader.openLoadingDialog(
          'We are processing your information...',
          'assets/images/animations/141594-animation-of-docer.json');

      /// Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove Loader
        TFullScreenLoader.closeLoadingDialog();
      }

      /// Form Validation
      if (!signupFormKey.currentState!.validate()) {
        // Remove Loader
        TFullScreenLoader.closeLoadingDialog();
        return;
      }

      /// Privacy Policy check
      if (!privacyPolicy.value) {
        TLoaders.warningSnackBar(
            title: 'Accept Privacy Policy',
            message:
                'In order to create an account, you must have to read and accept the Privacy Policy & Terms to Use.');
        return;
      }

      /// Register User in the firebase authentication & save user data in the firebase
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      /// Save Authenticated user data in the Firebase firestore
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        userName: username.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      /// Remove Loader
      TFullScreenLoader.closeLoadingDialog();

      /// show a success message to the user
      TLoaders.successSnackBar(
          title: 'Congratulations!',
          message:
              'Your account has been created! Verify your email to continue.');

      /// Move to verify email screen
      Get.to(() => VerifyEmailScreen(
            email: email.text.trim(),
          ));
    } catch (e) {
      // Remove Loader
      TFullScreenLoader.closeLoadingDialog();

      /// Show some generic error to the user
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
