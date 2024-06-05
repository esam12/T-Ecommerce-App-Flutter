import 'package:eco/common/widgets/appbar/appbar.dart';
import 'package:eco/common/widgets/t_button.dart';
import 'package:eco/common/widgets/t_text_form_field.dart';
import 'package:eco/features/personalization/controllers/update_name_controller.dart';
import 'package:eco/utils/constants/sizes.dart';
import 'package:eco/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      /// Custom AppBar
      appBar: TAppbar(
        showBackArrow: true,
        title: Text(
          'Change Name',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),

      /// Body
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                /// Headings
                Text(
                  'Use real name for easy verification. This name will appear on several pages.',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                const SizedBox(height: TSizes.spaceBtwSections),

                /// Text field and button
                Form(
                  key: controller.updateNameFormKey,
                  child: Column(
                    children: [
                      TTextFormField(
                        prefixIcon: Iconsax.user,
                        labelText: 'First name',
                        controller: controller.firstName,
                        validator: (val) =>
                            TValidator.validateEmptyText('First name', val),
                      ),
                      const SizedBox(height: TSizes.spaceBtwInputFields),
                      TTextFormField(
                        prefixIcon: Iconsax.user,
                        labelText: 'Last name',
                        controller: controller.lastName,
                        validator: (val) =>
                            TValidator.validateEmptyText('Last name', val),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: TSizes.spaceBtwSections),

                /// Save Button
                TElevatedButton(
                  text: 'Save',
                  onPressed: () => controller.updateUserName(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
