import 'package:eco/features/auth/controllers/signup/signup_controller.dart';
import 'package:eco/utils/constants/colors.dart';
import 'package:eco/utils/constants/text_strings.dart';
import 'package:eco/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TTermsAndConditionsAndCheckbox extends StatelessWidget {
  const TTermsAndConditionsAndCheckbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = SignupController.instance;

    return Row(
      children: [
        Obx(
          () => Checkbox(
            value: controller.privacyPolicy.value,
            onChanged: (val) => controller.privacyPolicy.value = val!,
          ),
        ),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                    text: '${TTexts.iAgreeTo} ',
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                  text: '${TTexts.privacyPolicy} ',
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: dark ? TColors.white : TColors.primary,
                      decoration: TextDecoration.underline,
                      decorationColor: dark ? TColors.white : TColors.primary),
                ),
                TextSpan(
                    text: '${TTexts.and} ',
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                  text: '${TTexts.termsOfUse} ',
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: dark ? TColors.white : TColors.primary,
                      decoration: TextDecoration.underline,
                      decorationColor: dark ? TColors.white : TColors.primary),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
