import 'package:eco/common/widgets/t_text_form_field.dart';
import 'package:eco/utils/constants/sizes.dart';
import 'package:eco/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TSignUpForm extends StatelessWidget {
  const TSignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Form(
      child: Column(
        children: [
          /// First & Last Name

          Row(
            children: [
              Expanded(
                child: TTextFormField(
                    prefixIcon: Iconsax.user, labelText: TTexts.firstName),
              ),
              SizedBox(width: TSizes.spaceBtwInputFields),
              Expanded(
                child: TTextFormField(
                    prefixIcon: Iconsax.user, labelText: TTexts.lastName),
              ),
            ],
          ),
          SizedBox(height: TSizes.spaceBtwInputFields),

          /// Username
          TTextFormField(
              prefixIcon: Iconsax.user_edit, labelText: TTexts.username),
          SizedBox(height: TSizes.spaceBtwInputFields),

          /// Email
          TTextFormField(prefixIcon: Iconsax.direct, labelText: TTexts.email),
          SizedBox(height: TSizes.spaceBtwInputFields),

          /// Phone Number
          TTextFormField(prefixIcon: Iconsax.call, labelText: TTexts.phoneNo),
          SizedBox(height: TSizes.spaceBtwInputFields),

          /// Password
          TTextFormField(
              obscureText: true,
              prefixIcon: Iconsax.password_check,
              suffixIcon: Iconsax.eye_slash,
              labelText: TTexts.password),
          SizedBox(height: TSizes.spaceBtwInputFields),
        ],
      ),
    );
  }
}
