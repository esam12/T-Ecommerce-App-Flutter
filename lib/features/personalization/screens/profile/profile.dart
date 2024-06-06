import 'package:eco/common/widgets/appbar/appbar.dart';
import 'package:eco/common/widgets/custom_shapes/containers/circular_image.dart';
import 'package:eco/common/widgets/loaders/shimmer_effect.dart';
import 'package:eco/common/widgets/texts/section_heading.dart';
import 'package:eco/features/personalization/controllers/user_controller.dart';
import 'package:eco/features/personalization/screens/profile/widgets/change_name.dart';
import 'package:eco/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:eco/utils/constants/image_strings.dart';
import 'package:eco/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const TAppbar(
        title: Text('Profile'),
        showBackArrow: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      Obx(() {
                        final networkImage =
                            controller.user.value.profilePicture;
                        final image = networkImage.isNotEmpty
                            ? networkImage
                            : TImages.user;
                        return controller.imageUploading.value
                            ? const TShimmerEffect(
                                width: 80, height: 80, raduis: 80)
                            : TCircularImage(
                                image: image,
                                width: 80,
                                height: 80,
                                isNetworkImage: networkImage.isNotEmpty,
                              );
                      }),
                      TextButton(
                        onPressed: () => controller.uploadUserProfilePicture(),
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
            
                TProfileMenu(
                    title: "Name",
                    value: controller.user.value.fullName,
                    onTap: () => Get.to(() => const ChangeName())),
                TProfileMenu(
                    title: "Username",
                    value: controller.user.value.userName,
                    onTap: () {}),
            
                const SizedBox(height: TSizes.spaceBtwItems),
                const Divider(),
                const SizedBox(height: TSizes.spaceBtwItems),
            
                /// Heading Personal Info
                const TSectionHeader(
                    title: 'Personal information', showActionButton: false),
                const SizedBox(height: TSizes.spaceBtwItems),
            
                TProfileMenu(
                  title: "User ID",
                  value: controller.user.value.id,
                  onTap: () {},
                  icon: Iconsax.copy,
                ),
                TProfileMenu(
                    title: "E-mail",
                    value: controller.user.value.email,
                    onTap: () {}),
                TProfileMenu(
                    title: "Phone Number",
                    value: controller.user.value.phoneNumber,
                    onTap: () {}),
                TProfileMenu(title: "Gender", value: 'Male', onTap: () {}),
                TProfileMenu(
                    title: "Date of Briht",
                    value: '01 Jan, 1999',
                    onTap: () {}),
            
                const Divider(),
                const SizedBox(height: TSizes.spaceBtwItems),
            
                Center(
                  child: TextButton(
                    onPressed: () => controller.deleteAccountWarningPopup(),
                    child: const Text(
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
