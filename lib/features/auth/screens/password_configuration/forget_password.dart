import 'package:eco/common/widgets/t_button.dart';
import 'package:eco/common/widgets/t_text_form_field.dart';
import 'package:eco/features/auth/controllers/forget_password/forget_password_controller.dart';
import 'package:eco/utils/constants/sizes.dart';
import 'package:eco/utils/constants/text_strings.dart';
import 'package:eco/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                /// Headings
                Text(TTexts.forgetPasswordTitle,
                    style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: TSizes.spaceBtwItems),
                Text(TTexts.forgetPasswordSubTitle,
                    style: Theme.of(context).textTheme.labelMedium),
                const SizedBox(height: TSizes.spaceBtwSections * 2),

                /// Text Field
                Form(
                  key: controller.forgetPasswordFormKey,
                  child: TTextFormField(
                    prefixIcon: Iconsax.direct_right,
                    labelText: TTexts.email,
                    controller: controller.email,
                    validator: (val) => TValidator.validateEmail(val),
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwSections),

                /// Submit Button
                TElevatedButton(
                  text: TTexts.submit,
                  onPressed: () => controller.sendPasswordResetEmail(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
