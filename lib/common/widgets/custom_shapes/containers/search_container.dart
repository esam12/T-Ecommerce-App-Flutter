import 'package:eco/utils/constants/colors.dart';
import 'package:eco/utils/constants/sizes.dart';
import 'package:eco/utils/device/device_utility.dart';
import 'package:eco/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TSearchContainer extends StatelessWidget {
  const TSearchContainer({
    super.key,
    required this.text,
    this.icon,
    this.showBackground = true,
    this.showBorder = true,
    this.padding = const EdgeInsets.all(TSizes.defaultSpace),
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Padding(
      padding: padding,
      child: Container(
        width: TDeviceUtils.getScreenWidth(context),
        padding: const EdgeInsets.all(TSizes.md),
        decoration: BoxDecoration(
          color: showBackground
              ? dark
                  ? TColors.dark
                  : TColors.light
              : Colors.transparent,
          borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
          border: showBorder ? Border.all(color: TColors.grey) : null,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: TColors.darkerGrey,
            ),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text(text, style: Theme.of(context).textTheme.bodySmall)
          ],
        ),
      ),
    );
  }
}
