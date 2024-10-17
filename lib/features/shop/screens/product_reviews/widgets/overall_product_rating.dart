import 'package:flutter/material.dart';
import 'package:kheti_project2/features/shop/screens/product_reviews/widgets/progress_indicator.dart';

class RoverallProductRating extends StatelessWidget {
  const RoverallProductRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            '4.7',
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        const Expanded(
          flex: 7,
          child: Column(
            children: [
              RRatingProgressIndicator(text: '5', value: 0.9),
              RRatingProgressIndicator(text: '4', value: 0.8),
              RRatingProgressIndicator(text: '3', value: 0.6),
              RRatingProgressIndicator(text: '2', value: 0.4),
              RRatingProgressIndicator(text: '1', value: 0.2),
            ],
          ),
        ),
      ],
    );
  }
}