import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/images_strings.dart';
import '../icons/circular_image.dart';

class RUserProfileTile extends StatelessWidget {
  const RUserProfileTile({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const RCircularImage(
        image: RImages.userGif1,
        width: 50,
        height: 58,
        padding: 8,
      ),
      title: Text(
        'Mr. XYZ',
        style: Theme.of(context).textTheme.headlineSmall!.apply(color: RColors.white),
      ),
      subtitle: Text(
        'support@khetibridge.com',
        style: Theme.of(context).textTheme.bodyMedium!.apply(color: RColors.white),
      ),
      trailing: IconButton(
        onPressed: onPressed,
        icon: const Icon(Iconsax.edit, color: RColors.white),
      ),
    ); // ListTile
  }
}
