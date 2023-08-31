import 'package:flutter/material.dart';

import '../../../../constants/app_strings.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/dimens.dart';
import '../../../utils/ui_helper/ui_helper.dart';
import '../../../widgets/text_widget.dart';

class ImagePickOptionWidget extends StatelessWidget {
  final VoidCallback onCameraTap;
  final VoidCallback onGalleryTap;
  const ImagePickOptionWidget({Key? key,required this.onCameraTap,required this.onGalleryTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      color: AppColors.textFieldColor,
      height: 140,
      width: double.infinity,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const TextWidget(
            title: AppStrings.selectText,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColors.whiteColor,
          ),
          UIHelper.verticalSpace(Dimens.size20),
          GestureDetector(
              onTap: onCameraTap,
              child: const TextWidget(
                title: AppStrings.cameraText,
                color: AppColors.appBlueColor,
                fontSize: 16,
              )),
          UIHelper.verticalSpace(Dimens.size10),
          GestureDetector(onTap: onGalleryTap, child: const TextWidget(title: AppStrings.galleryText,
            color: AppColors.appBlueColor,
            fontSize: 16,))
        ],
      ),
    );
  }
}
