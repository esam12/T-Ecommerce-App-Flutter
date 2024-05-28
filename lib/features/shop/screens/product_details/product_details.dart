import 'package:eco/common/widgets/t_button.dart';
import 'package:eco/common/widgets/texts/section_heading.dart';
import 'package:eco/features/shop/screens/product_details/widgets/bottom_add_to_cart_wedgit.dart';
import 'package:eco/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:eco/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:eco/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:eco/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:eco/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: const TBottomAddToCart(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              /// Product Image Slider
              const TProductImageSlider(),

              /// Product Details
              Padding(
                padding: const EdgeInsets.only(
                    right: TSizes.defaultSpace,
                    left: TSizes.defaultSpace,
                    bottom: TSizes.defaultSpace),
                child: Column(
                  children: [
                    /// Rating & Share Button
                    const TRatingAndShare(),

                    /// Price, Title, Stack & Brand
                    const TProductMetaData(),

                    /// Attributes
                    const ProductAttributes(),
                    const SizedBox(height: TSizes.spaceBtwSections),

                    /// Checkout Button
                    TElevatedButton(
                      text: 'CheckOut',
                      onPressed: () {},
                    ),
                    const SizedBox(height: TSizes.spaceBtwSections),

                    /// Description
                    const TSectionHeader(
                        title: 'Description', showActionButton: false),
                    const SizedBox(height: TSizes.spaceBtwItems),

                    const ReadMoreText(
                      'This is a product description for blue nike sleeve less vest. There are more things that can be added but i am just practicing and nothing else .',
                      trimLines: 2,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'Show more',
                      trimExpandedText: 'Show less',
                      moreStyle:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                      lessStyle:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),

                    /// Reviews
                    const Divider(),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const TSectionHeader(
                          title: "Reviews(199)",
                          showActionButton: false,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Iconsax.arrow_right_3, size: 18),
                        )
                      ],
                    ),

                    const SizedBox(height: TSizes.spaceBtwSections),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
