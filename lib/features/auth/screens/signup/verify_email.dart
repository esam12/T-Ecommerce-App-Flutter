import 'package:eco/common/widgets/t_button.dart';
import 'package:eco/utils/constants/image_strings.dart';
import 'package:eco/utils/constants/sizes.dart';
import 'package:eco/utils/constants/text_strings.dart';
import 'package:eco/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(CupertinoIcons.clear),
            ),
          ],
        ),
        body: SingleChildScrollView(
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
                Text("alzeabiesam@gmail.com",
                    style: Theme.of(context).textTheme.bodyLarge),
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
                  onPressed: () {},
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    child: const Text(TTexts.resendEmail),
                    onPressed: () {},
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
