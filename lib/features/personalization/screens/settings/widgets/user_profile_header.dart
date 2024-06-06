import 'package:eco/common/widgets/custom_shapes/containers/circular_image.dart';
import 'package:eco/common/widgets/loaders/shimmer_effect.dart';
import 'package:eco/features/personalization/controllers/user_controller.dart';
import 'package:eco/features/personalization/screens/profile/profile.dart';
import 'package:eco/utils/constants/colors.dart';
import 'package:eco/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TUserPofiileHeader extends StatelessWidget {
  const TUserPofiileHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return ListTile(
      leading: Obx(() {
        final networkImage = controller.user.value.profilePicture;
        final image = networkImage.isNotEmpty ? networkImage : TImages.user;
        return controller.imageUploading.value
            ? const TShimmerEffect(
                width: 50,
                height: 50,
              )
            : TCircularImage(
                image: image,
                width: 50,
                height: 50,
                isNetworkImage: networkImage.isNotEmpty,
              );
      }),
      title: Text(
        controller.user.value.fullName,
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .apply(color: TColors.white),
      ),
      subtitle: Text(
        controller.user.value.email,
        style:
            Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white),
      ),
      trailing: IconButton(
        onPressed: () => Get.to(
          () => const ProfileScreen(),
        ),
        icon: const Icon(Iconsax.edit),
        color: TColors.white,
      ),
    );
  }
}
