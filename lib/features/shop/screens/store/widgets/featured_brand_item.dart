import 'package:eco/common/widgets/custom_shapes/containers/circular_image.dart';
import 'package:eco/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:eco/common/widgets/image_text_widgets/brand_title_icon.dart';
import 'package:eco/utils/constants/colors.dart';
import 'package:eco/utils/constants/enums.dart';
import 'package:eco/utils/constants/image_strings.dart';
import 'package:eco/utils/constants/sizes.dart';
import 'package:eco/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TFeaturedBrandItem extends StatelessWidget {
  const TFeaturedBrandItem({
    super.key, this.onTap,  required this.showBorder,
  });
  final void Function()? onTap;
  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: TRoundedContainer(
        
        padding: const EdgeInsets.symmetric(vertical: TSizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            /// Icon
            Flexible(
              child: TCircularImage(
                image: TImages.nikeLogo,
                backgroundColor: Colors.transparent,
                overlayColor: THelperFunctions.isDarkMode(context)
                    ? TColors.white
                    : TColors.black,
              ),
            ),
            const SizedBox(width: TSizes.spaceBtwItems / 2),

            /// Text
            // [Expanded] & Column [MainAxisSize.min] is important to keep the elements in the verical center and also
            // to keep text inside the boundaries.
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TBrandTitleWithVerifiedIcon(
                    title: "Nike",
                    brandTextSize: TextSizes.large,
                  ),
                  Text(
                    "256 products",
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
