import 'package:eco/common/widgets/custom_shapes/containers/circular_image.dart';
import 'package:eco/utils/constants/colors.dart';
import 'package:eco/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TUserPofiileHeader extends StatelessWidget {
  const TUserPofiileHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const TCircularImage(
        image: TImages.user,
        height: 50,
        width: 50,
        padding: 0,
      ),
      title: Text(
        "ISAM EL-ZOBI ",
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .apply(color: TColors.white),
      ),
      subtitle: Text(
        "alzeabiesam@gmail.com",
        style:
            Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white),
      ),
      trailing: IconButton(
        onPressed: () {},
        icon: const Icon(Iconsax.edit),
        color: TColors.white,
      ),
    );
  }
}
