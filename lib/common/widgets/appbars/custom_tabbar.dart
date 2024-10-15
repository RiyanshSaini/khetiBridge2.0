import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/device/device_utils.dart';
import '../../../utils/helpers/helper_function.dart';


class RTabBar extends StatelessWidget implements PreferredSizeWidget {
  const RTabBar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = RHelperFunctions.isDarkMode(context);

    return Material(
      color: isDarkMode ? RColors.black : RColors.white,
      child: TabBar(
        tabs: tabs,
        isScrollable: true,
        indicatorColor: RColors.primary,
        labelColor: isDarkMode ? RColors.white : RColors.primary,
        unselectedLabelColor: RColors.darkGrey,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(RDeviceUtils.getAppBarHeight());
}
