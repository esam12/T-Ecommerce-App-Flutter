import 'package:eco/common/styles/shadows.dart';
import 'package:eco/common/widgets/custom_shapes/containers/circular_icon.dart';
import 'package:eco/common/widgets/custom_shapes/containers/image_rounded.dart';
import 'package:eco/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:eco/common/widgets/texts/product_price_text.dart';
import 'package:eco/common/widgets/texts/product_title_text.dart';
import 'package:eco/utils/constants/colors.dart';
import 'package:eco/utils/constants/image_strings.dart';
import 'package:eco/utils/constants/sizes.dart';
import 'package:eco/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      width: 180,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        boxShadow: [TShadowStyle.verticalProductShadow],
        borderRadius: BorderRadius.circular(TSizes.productImageRadius),
        color: dark ? TColors.darkerGrey : TColors.white,
      ),
      child: Column(
        children: [
          /// Thumbnail, WishList Button, Discount Tag
          TRoundedContainer(
            height: 180,
            backgroundColor: dark ? TColors.dark : TColors.light,
            padding: const EdgeInsets.all(TSizes.sm),
            child: Stack(
              children: [
                /// Thumbanil Image
                const TRoundedImage(
                  imageUrl: TImages.productImage1,
                  applyImageRadius: true,
                ),

                /// Sale Tag
                Positioned(
                  top: 10,
                  child: TRoundedContainer(
                    backgroundColor: TColors.secondary.withOpacity(0.8),
                    radius: TSizes.sm,
                    padding: const EdgeInsets.symmetric(
                        horizontal: TSizes.sm, vertical: TSizes.xs),
                    child: Text(
                      "25%",
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .apply(color: TColors.black),
                    ),
                  ),
                ),

                /// Wishlist Button
                const Positioned(
                  right: 0,
                  top: 0,
                  child: TCircularIcon(
                    icon: Iconsax.heart5,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),

          /// Details
          Padding(
            padding: const EdgeInsets.only(left: TSizes.sm),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TProductTitleText(
                  title: "Green Nike sports shoe",
                  smallSize: true,
                ),
                const SizedBox(height: TSizes.spaceBtwItems / 2),

                /// Brand Name
                Row(
                  children: [
                    Text(
                      "Nike",
                      style: Theme.of(context).textTheme.labelMedium,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(width: TSizes.xs),
                    const Icon(Iconsax.verify5,
                        color: TColors.primary, size: TSizes.iconXs)
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const TProductPriceText(
                      price: '35.0',
                      isLarge: true,
                    ),

                    /// Add To Cart Button
                    Container(
                      decoration: const BoxDecoration(
                        color: TColors.black,
                        borderRadius: BorderRadiusDirectional.only(
                          topStart: Radius.circular(TSizes.cardRadiusMd),
                          bottomEnd: Radius.circular(TSizes.productImageRadius),
                        ),
                      ),
                      child: const SizedBox(
                        width: TSizes.iconLg * 1.2,
                        height: TSizes.iconLg * 1.2,
                        child: Center(
                          child: Icon(
                            Iconsax.add,
                            color: TColors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
