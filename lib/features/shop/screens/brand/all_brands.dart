import 'package:eco/common/layouts/grid_layout.dart';
import 'package:eco/common/widgets/appbar/appbar.dart';
import 'package:eco/common/widgets/texts/section_heading.dart';
import 'package:eco/features/shop/screens/brand/brand_products.dart';
import 'package:eco/features/shop/screens/store/widgets/featured_brand_item.dart';
import 'package:eco/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const TAppbar(
          title: Text('Brands'),
          showBackArrow: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.spaceBtwItems),
            child: Column(
              children: [
                /// Heading
                const TSectionHeader(title: "Brands"),
                const SizedBox(height: TSizes.spaceBtwItems),

                /// Brands
                TGridLayout(
                  itemCount: 10,
                  mainAxisExtent: 80,
                  itemBuilder: (context, index) => TFeaturedBrandItem(
                    showBorder: true,
                    onTap: () => Get.to(
                      () => const BrandProductsScreen(),
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
