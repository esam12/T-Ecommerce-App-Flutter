
import 'package:eco/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:eco/common/widgets/texts/section_heading.dart';
import 'package:eco/utils/constants/colors.dart';
import 'package:eco/utils/constants/image_strings.dart';
import 'package:eco/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: TSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TSectionHeader(
            title: "Popular Categories",
            showActionButton: false,
            textColor: TColors.white,
            onPressed: () {},
          ),
          const SizedBox(height: TSizes.spaceBtwItems),
          SizedBox(
            height: 100,
            child: ListView.builder(
                itemCount: 6,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  return TVerticalImageText(
                    image: TImages.shoeIcon,
                    title: "Shoes",
                    onTap: () {},
                  );
                }),
          )
        ],
      ),
    );
  }
}
