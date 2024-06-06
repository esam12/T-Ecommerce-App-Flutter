import 'package:eco/data/repositories/authentication/authentication_repository.dart';
import 'package:eco/data/repositories/user/user_repository.dart';
import 'package:eco/features/auth/screens/login/login.dart';
import 'package:eco/features/personalization/models/user_model.dart';
import 'package:eco/features/personalization/screens/profile/widgets/re_authenticate_user_login_form.dart';
import 'package:eco/utils/constants/image_strings.dart';
import 'package:eco/utils/constants/sizes.dart';
import 'package:eco/utils/helpers/network_manager.dart';
import 'package:eco/utils/popups/full_screen_loader.dart';
import 'package:eco/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;

  final hidePassword = false.obs;
  final imageUploading = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  Future<void> fetchUserRecord() async {
    try {
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    }
  }

  // Save user record from any Registration provider
  Future<void> saveRecords(UserCredential userCredential) async {
    try {
      // First Update Rx User and then check if user data is already stored. if not store new data.
      await fetchUserRecord();

      if (user.value.id.isEmpty) {
        // ignore: unnecessary_null_comparison
        if (userCredential != null) {
          // Convert name to first name and last name
          final nameParts =
              UserModel.nameParts(userCredential.user!.displayName ?? '');
          final username = UserModel.generateUserName(
              userCredential.user!.displayName ?? '');

          // Map data
          final user = UserModel(
            id: userCredential.user!.uid,
            firstName: nameParts[0],
            lastName:
                nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
            email: userCredential.user!.email ?? '',
            userName: username,
            phoneNumber: userCredential.user!.phoneNumber ?? '',
            profilePicture: userCredential.user!.photoURL ?? '',
          );

          // Save data
          await userRepository.saveUserRecord(user);
        }
      }
    } catch (e) {
      TLoaders.warningSnackBar(
          title: 'Data not saved',
          message:
              "Something went wrong while saving your information. You can re-save your data in your profile.");
    }
  }

  /// Delete Account Warning
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(TSizes.md),
      title: 'Delete Account',
      middleText:
          'Are you sure you want to delete your account permanently?. This action is not reversible and all your data will be permanently deleted.',
      confirm: ElevatedButton(
        onPressed: () async => deleteUserAccount(),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          side: const BorderSide(color: Colors.red),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: TSizes.lg),
          child: Text('Delete'),
        ),
      ),
      cancel: OutlinedButton(
          onPressed: () => Navigator.of(Get.overlayContext!).pop(),
          child: const Text('Cancel')),
    );
  }

  /// Delete User Account
  void deleteUserAccount() async {
    try {
      /// Start Loading
      TFullScreenLoader.openLoadingDialog(
          'Please wait...', TImages.docerAnimation);

      /// First re-authenticate user
      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        // Re verify auth email
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          TFullScreenLoader.closeLoadingDialog();
          Get.offAll(() => const LoginScreen());
        } else if (provider == 'password') {
          TFullScreenLoader.closeLoadingDialog();
          Get.to(() => const ReAuthLoginForm());
        }
      }
    } catch (e) {
      TFullScreenLoader.closeLoadingDialog();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  /// RE-AUTHENTICATE before deleting account
  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog(
          'Please wait...', TImages.docerAnimation);

      // Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.closeLoadingDialog();
        return;
      }

      // Form Validation
      if (!reAuthFormKey.currentState!.validate()) {
        TFullScreenLoader.closeLoadingDialog();
        return;
      }

      // Re authenticate user
      await AuthenticationRepository.instance
          .reAuthenticateWithEmailAndPassword(
              verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      TFullScreenLoader.closeLoadingDialog();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      // Remove Loader
      TFullScreenLoader.closeLoadingDialog();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  /// Upload Profile Picture
  uploadUserProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          imageQuality: 70,
          maxHeight: 512,
          maxWidth: 512);
      if (image != null && image.path.isNotEmpty) {
        imageUploading.value = true;

        final imageUrl =
            await userRepository.uploadImage("Users/Images/Profile/", image);
        // update user image record
        await userRepository.updateSingleField({"ProfilePicture": imageUrl});

        user.value.profilePicture = imageUrl;
        user.refresh();

        TLoaders.successSnackBar(
            title: 'Success!',
            message: 'Your profile picture updated successfully');
      }
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      imageUploading.value = false;
    }
  }
}
