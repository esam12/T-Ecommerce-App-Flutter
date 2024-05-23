import 'package:eco/common/widgets/t_button.dart';
import 'package:eco/common/widgets/t_text_form_field.dart';
import 'package:eco/utils/constants/sizes.dart';
import 'package:eco/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
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
              const TTextFormField(
                  prefixIcon: Iconsax.direct_right, labelText: TTexts.email),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Submit Button
              TElevatedButton(
                text: TTexts.submit,
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
