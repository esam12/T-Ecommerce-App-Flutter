import 'package:eco/common/widgets/appbar/appbar.dart';
import 'package:eco/common/widgets/t_button.dart';
import 'package:eco/common/widgets/t_text_form_field.dart';
import 'package:eco/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// AppBar
      appBar: const TAppbar(
        showBackArrow: true,
        title: Text('Add New Address'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Form(
            child: Column(
              children: [
                const TTextFormField(
                    prefixIcon: Iconsax.user, labelText: 'Name'),
                const SizedBox(height: TSizes.spaceBtwInputFields),
                const TTextFormField(
                    prefixIcon: Iconsax.mobile, labelText: 'Phone Number'),
                const SizedBox(height: TSizes.spaceBtwInputFields),
                const Row(
                  children: [
                    Expanded(
                        child: TTextFormField(
                            prefixIcon: Iconsax.building_31,
                            labelText: 'Street')),
                    SizedBox(width: TSizes.spaceBtwInputFields),
                    Expanded(
                        child: TTextFormField(
                            prefixIcon: Iconsax.code,
                            labelText: 'Postal Code')),
                  ],
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields),
                const Row(
                  children: [
                    Expanded(
                        child: TTextFormField(
                            prefixIcon: Iconsax.building, labelText: 'City')),
                    SizedBox(width: TSizes.spaceBtwInputFields),
                    Expanded(
                        child: TTextFormField(
                            prefixIcon: Iconsax.activity, labelText: 'State')),
                  ],
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields),
                const TTextFormField(
                    prefixIcon: Iconsax.global, labelText: 'Country'),
                const SizedBox(height: TSizes.spaceBtwSections),
                TElevatedButton(
                  text: "Save",
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
