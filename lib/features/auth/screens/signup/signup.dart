import 'package:eco/common/widgets/login_signup/form_divider.dart';
import 'package:eco/common/widgets/login_signup/social_buttons.dart';
import 'package:eco/common/widgets/t_button.dart';
import 'package:eco/features/auth/screens/signup/widgets/signup_form.dart';
import 'package:eco/features/auth/screens/signup/widgets/terms_conditions.dart';
import 'package:eco/utils/constants/sizes.dart';
import 'package:eco/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(TTexts.signupTitle,
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: TSizes.spaceBtwSections),

              const TSignUpForm(),
              const SizedBox(height: TSizes.spaceBtwInputFields),

              /// Terms & Conditions, Checkbox
              const TTermsAndConditionsAndCheckbox(),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Sign Up Button
              TElevatedButton(text: TTexts.createAccount, onPressed: () {}),
              const SizedBox(height: TSizes.spaceBtwSections),

              const TFormDivider(dividerText: TTexts.orSignUpWith),
              const SizedBox(height: TSizes.spaceBtwSections),
              const TSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
