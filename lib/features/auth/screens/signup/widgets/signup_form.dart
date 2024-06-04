import 'package:eco/common/widgets/t_text_form_field.dart';
import 'package:eco/features/auth/controllers/signup/signup_controller.dart';
import 'package:eco/utils/constants/sizes.dart';
import 'package:eco/utils/constants/text_strings.dart';
import 'package:eco/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TSignUpForm extends StatelessWidget {
  const TSignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          /// First & Last Name
          Row(
            children: [
              Expanded(
                child: TTextFormField(
                  prefixIcon: Iconsax.user,
                  labelText: TTexts.firstName,
                  controller: controller.firstName,
                  validator: (value) =>
                      TValidator.validateEmptyText('First Name', value),
                ),
              ),
              const SizedBox(width: TSizes.spaceBtwInputFields),
              Expanded(
                child: TTextFormField(
                  prefixIcon: Iconsax.user,
                  labelText: TTexts.lastName,
                  controller: controller.lastName,
                  validator: (value) =>
                      TValidator.validateEmptyText('Last Name', value),
                ),
              ),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          /// Username
          TTextFormField(
            prefixIcon: Iconsax.user_edit,
            labelText: TTexts.username,
            controller: controller.username,
            validator: (value) =>
                TValidator.validateEmptyText('Username', value),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          /// Email
          TTextFormField(
            prefixIcon: Iconsax.direct,
            labelText: TTexts.email,
            controller: controller.email,
            validator: (value) => TValidator.validateEmail(value),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          /// Phone Number
          TTextFormField(
            prefixIcon: Iconsax.call,
            labelText: TTexts.phoneNo,
            controller: controller.phoneNumber,
            validator: (value) => TValidator.validatePhoneNumber(value),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          /// Password
          Obx(
            () => TTextFormField(
              obscureText: controller.hidePassword.value,
              prefixIcon: Iconsax.password_check,
              suffixIcon: controller.hidePassword.value
                  ? Iconsax.eye_slash
                  : Iconsax.eye,
              onPressedOnSuffixIcon: () => controller.hidePassword.value =
                  !controller.hidePassword.value,
              labelText: TTexts.password,
              controller: controller.password,
              validator: (value) => TValidator.validatePassword(value),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),
        ],
      ),
    );
  }
}
