import 'package:eco/common/widgets/appbar/appbar.dart';
import 'package:eco/features/shop/screens/product_reviews/widgets/ovarall_product_ratings.dart';
import 'package:eco/common/widgets/products/ratings/rating_bar_indicator.dart';
import 'package:eco/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:eco/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        /// AppBar
        appBar: const TAppbar(
          title: Text('Reviews & Rating'),
        ),

        /// Body
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Ratings and reviews are verified and are from people who use the same type of device that you use.',
                ),

                /// Overall Product Ratings
                const TOverallProductRatings(),
                const TRatingBarIndicator(rating: 3.5),
                Text('12,611', style: Theme.of(context).textTheme.bodySmall),
                const SizedBox(height: TSizes.spaceBtwSections),

                /// User Reviews List
                const UserReviewCard(),
                const UserReviewCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
