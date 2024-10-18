import 'package:flutter/material.dart';
import 'package:kheti_project2/features/shop/screens/order/widgets/orders_list.dart';

import '../../../../common/widgets/appbars/custom_appbar.dart';
import '../../../../utils/constants/size.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// AppBar
      appBar: RAppBar(
        showBackArrow: true,
        title: Text(
          'My Orders',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),

      /// Body with Orders List
      body: const Padding(
        padding: EdgeInsets.all(RSizes.defaultSpace),
        child: ROrderListItems(), // Updated to use ROrderListItems
      ),
    );
  }
}
