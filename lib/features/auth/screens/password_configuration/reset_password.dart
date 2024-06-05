import 'package:eco/common/widgets/t_button.dart';
import 'package:eco/features/auth/controllers/forget_password/forget_password_controller.dart';
import 'package:eco/features/auth/screens/login/login.dart';
import 'package:eco/utils/constants/image_strings.dart';
import 'package:eco/utils/constants/sizes.dart';
import 'package:eco/utils/constants/text_strings.dart';
import 'package:eco/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    final controller = ForgetPasswordController.instance;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(CupertinoIcons.clear),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                /// Image
                Image(
                    width: THelperFunctions.screenWidth() * 0.6,
                    image:
                        const AssetImage(TImages.deliveredEmailIllustration)),
                const SizedBox(height: TSizes.spaceBtwSections),

                /// Email, Title & Sub-Title
                Text(email,
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center),
                Text(
                  TTexts.changeYourPasswordTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                Text(TTexts.changeYourPasswordSubTitle,
                    style: Theme.of(context).textTheme.labelMedium,
                    textAlign: TextAlign.center),
                const SizedBox(height: TSizes.spaceBtwSections),

                /// Button
                TElevatedButton(
                  text: TTexts.done,
                  onPressed: () => Get.offAll(() => const LoginScreen()),
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    child: const Text(TTexts.resendEmail),
                    onPressed: () => controller.reSendPasswordResetEmail(email),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
