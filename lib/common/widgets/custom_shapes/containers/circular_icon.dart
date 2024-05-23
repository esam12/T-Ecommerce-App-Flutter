import 'package:eco/utils/constants/colors.dart';
import 'package:eco/utils/constants/sizes.dart';
import 'package:eco/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TCircularIcon extends StatelessWidget {
  const TCircularIcon({
    super.key,
    this.width,
    this.height,
    this.size = TSizes.lg,
    required this.icon,
    this.color,
    this.backgroundcolor,
    this.onPressed,
  });

  final double? width, height, size;
  final IconData icon;
  final Color? color;
  final Color? backgroundcolor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundcolor ??
            (dark
                ? TColors.black.withOpacity(0.9)
                : TColors.white.withOpacity(0.9)),
        borderRadius: BorderRadius.circular(100),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          size: size,
          color: color,
        ),
      ),
    );
  }
}
