import 'package:eco/common/widgets/appbar/appbar.dart';
import 'package:eco/common/widgets/custom_shapes/containers/circular_image.dart';
import 'package:eco/common/widgets/texts/section_heading.dart';
import 'package:eco/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:eco/utils/constants/image_strings.dart';
import 'package:eco/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const TAppbar(
          title: Text('Profile'),
          showBackArrow: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      const TCircularImage(
                        image: TImages.user,
                        width: 80,
                        height: 80,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Change Profile Picture'),
                      ),
                    ],
                  ),
                ),
      
                /// Details
                const SizedBox(height: TSizes.spaceBtwItems / 2),
                const Divider(),
                const SizedBox(height: TSizes.spaceBtwItems),
      
                const TSectionHeader(
                    title: 'Profile information', showActionButton: false),
                const SizedBox(height: TSizes.spaceBtwItems),
      
                TProfileMenu(title: "Name", value: 'ISAM EL-ZOBI', onTap: () {}),
                TProfileMenu(title: "Username", value: 'isam_12', onTap: () {}),
      
                const SizedBox(height: TSizes.spaceBtwItems),
                const Divider(),
                const SizedBox(height: TSizes.spaceBtwItems),
      
                /// Heading Personal Info
                const TSectionHeader(
                    title: 'Personal information', showActionButton: false),
                const SizedBox(height: TSizes.spaceBtwItems),
      
                TProfileMenu(
                  title: "User ID",
                  value: '778258',
                  onTap: () {},
                  icon: Iconsax.copy,
                ),
                TProfileMenu(
                    title: "E-mail",
                    value: 'alzeabiesam@gmail.com',
                    onTap: () {}),
                TProfileMenu(
                    title: "Phone Number", value: '+905377021108', onTap: () {}),
                TProfileMenu(title: "Gender", value: 'Male', onTap: () {}),
                TProfileMenu(
                    title: "Date of Briht", value: '01 Jan, 1999', onTap: () {}),
      
                Divider(),
                SizedBox(height: TSizes.spaceBtwItems),
      
                Center(
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Close Account",
                      style: TextStyle(color: Colors.red),
                    ),
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
