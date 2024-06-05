import 'package:eco/common/widgets/appbar/appbar.dart';
import 'package:eco/common/widgets/t_button.dart';
import 'package:eco/common/widgets/t_text_form_field.dart';
import 'package:eco/features/personalization/controllers/user_controller.dart';
import 'package:eco/utils/constants/sizes.dart';
import 'package:eco/utils/constants/text_strings.dart';
import 'package:eco/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: TAppbar(
        showBackArrow: true,
        title: Text(
          'Re-Authenticate User',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                Form(
                  child: Column(
                    children: [
                      /// Text Field
                      TTextFormField(
                        prefixIcon: Iconsax.direct_right,
                        labelText: TTexts.email,
                        controller: controller.verifyEmail,
                        validator: (val) => TValidator.validateEmail(val),
                      ),
                      Obx(
                        () => TextFormField(
                          controller: controller.verifyPassword,
                          validator: (val) => TValidator.validatePassword(val),
                          obscureText: controller.hidePassword.value,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Iconsax.password_check),
                            labelText: TTexts.password,
                            suffixIcon: IconButton(
                              onPressed: () => controller.hidePassword.value =
                                  !controller.hidePassword.value,
                              icon: controller.hidePassword.value
                                  ? const Icon(Iconsax.eye)
                                  : const Icon(Iconsax.eye_slash),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwSections),

                /// Button
                TElevatedButton(
                  text: 'Verify',
                  onPressed: () => controller.reAuthenticateEmailAndPasswordUser(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
