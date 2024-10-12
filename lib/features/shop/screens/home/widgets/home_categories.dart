import 'package:flutter/material.dart';

import '../../../../../common/widgets/image_text_widgets/vertical_text_image.dart';
import '../../../../../utils/constants/images_strings.dart';

class RHomeCategories extends StatelessWidget {
  const RHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return RVerticalImageText(image: RImages.tempImage, title: 'Add Title',onTap: (){});
        },
      ),
    );
  }
}