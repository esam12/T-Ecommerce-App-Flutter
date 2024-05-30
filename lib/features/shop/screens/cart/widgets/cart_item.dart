import 'package:eco/common/widgets/custom_shapes/containers/image_rounded.dart';
import 'package:eco/common/widgets/image_text_widgets/brand_title_icon.dart';
import 'package:eco/common/widgets/texts/product_title_text.dart';
import 'package:eco/utils/constants/colors.dart';
import 'package:eco/utils/constants/image_strings.dart';
import 'package:eco/utils/constants/sizes.dart';
import 'package:eco/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Row(
      children: [
        /// Image
        TRoundedImage(
          padding: const EdgeInsets.all(TSizes.sm),
          imageUrl: TImages.productImage1,
          width: 60,
          height: 60,
          backgroundColor: dark ? TColors.darkerGrey : TColors.light,
        ),
        const SizedBox(
          width: TSizes.spaceBtwItems,
        ),

        /// Title, Price, Size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TBrandTitleWithVerifiedIcon(
                title: 'Nike',
              ),
              const Flexible(
                child: TProductTitleText(
                  title: 'Green Nike sports shoe',
                  maxLines: 1,
                ),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: 'Color ',
                        style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(
                        text: 'Green',
                        style: Theme.of(context).textTheme.bodyLarge),
                    TextSpan(
                        text: ' Size ',
                        style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(
                        text: 'EK 08',
                        style: Theme.of(context).textTheme.bodyLarge),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
