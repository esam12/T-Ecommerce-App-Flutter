import 'package:eco/common/widgets/t_button.dart';
import 'package:eco/data/repositories/authentication/authentication_repository.dart';
import 'package:eco/features/auth/controllers/signup/verify_email_controller.dart';
import 'package:eco/utils/constants/image_strings.dart';
import 'package:eco/utils/constants/sizes.dart';
import 'package:eco/utils/constants/text_strings.dart';
import 'package:eco/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    return Scaffold(
      /// The close icon in the app bar is used to logout the user and redirect them to the login screen
      /// This approach is taken to handle scenarios where the user enters the registration process
      /// and the data is stored. Upon reopening the app, it checks if the email is verified
      /// if not verified, the app always navigates to the verfication screen.
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => AuthenticationRepository.instance.logout(),
            icon: const Icon(CupertinoIcons.clear),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /// Image
                Image(
                  width: THelperFunctions.screenWidth() * 0.6,
                  image: const AssetImage(TImages.deliveredEmailIllustration),
                ),
                const SizedBox(height: TSizes.spaceBtwSections),

                /// Title & Sub-Title
                Text(TTexts.confirmEmail,
                    style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: TSizes.spaceBtwItems),
                Text(email ?? '', style: Theme.of(context).textTheme.bodyLarge),
                const SizedBox(height: TSizes.spaceBtwItems),

                Text(
                  TTexts.confirmEmailSubTitle,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: TSizes.spaceBtwSections),

                /// Buttons
                TElevatedButton(
                  text: TTexts.tContinue,
                  onPressed: () => controller.checkEmailVerificationStatus(),
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    child: const Text(TTexts.resendEmail),
                    onPressed: () => controller.sendEmailVerification(),
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
