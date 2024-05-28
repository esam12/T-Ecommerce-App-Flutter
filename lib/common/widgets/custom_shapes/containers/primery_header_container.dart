import 'package:eco/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:eco/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:eco/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class TPrimeryHeaderContainer extends StatelessWidget {
  const TPrimeryHeaderContainer({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TCurvedEdgesWidget(
      child: Container(
        color: TColors.primary,
        padding: const EdgeInsets.all(0),
        child: Stack(
          children: [
            /// Background Custom Shapes
            Positioned(
              top: -150,
              right: -250,
              child: TCircularContainer(
                radius: 400,
                padding: 0,
                backgroundColor: TColors.textWhite.withOpacity(0.1),
              ),
            ),
            Positioned(
              top: 100,
              right: -300,
              child: TCircularContainer(
                radius: 400,
                padding: 0,
                backgroundColor: TColors.textWhite.withOpacity(0.1),
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
