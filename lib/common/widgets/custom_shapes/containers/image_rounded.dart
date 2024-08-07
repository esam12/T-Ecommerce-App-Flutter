import 'package:eco/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TRoundedImage extends StatelessWidget {
  const TRoundedImage({
    super.key,
    this.width,
    this.height,
    required this.imageUrl,
    this.applyImageRadius = false,
    this.fit,
    this.padding,
    this.isNetworkImage = false,
    this.onTab,
    this.borderRaduis = TSizes.md,
    this.backgroundColor,
    this.border,
  });

  final double? width, height;
  final String imageUrl;
  final bool applyImageRadius;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final bool isNetworkImage;
  final VoidCallback? onTab;
  final double borderRaduis;
  final BoxBorder? border;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
            border: border,
            color: backgroundColor,
            borderRadius: BorderRadius.circular(borderRaduis)),
        child: ClipRRect(
          borderRadius: applyImageRadius
              ? BorderRadius.circular(borderRaduis)
              : BorderRadius.zero,
          child: Image(
            fit: fit,
            image:
                isNetworkImage ? NetworkImage(imageUrl) : AssetImage(imageUrl),
          ),
        ),
      ),
    );
  }
}
