import 'package:flutter/material.dart';

class RProductPriceText extends StatelessWidget {
  const RProductPriceText(
      {super.key,
        required this.price,
        this.currencySign = '\₹',
        this.isLarge = false,
        this.maxLines = 1,
        this.lineThrough = false,
      h});

  final String currencySign;
  final int price;
  final int maxLines;
  final bool isLarge;
  final bool lineThrough;

  @override
  Widget build(BuildContext context) {
    return Text(
      currencySign + price.toString(),
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: isLarge
          ? Theme.of(context).textTheme.headlineMedium!.apply(
              decoration: lineThrough ? TextDecoration.lineThrough : null)
          : Theme.of(context).textTheme.titleLarge!.apply(
              decoration: lineThrough ? TextDecoration.lineThrough : null),
    );
  }
}
