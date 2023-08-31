import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import '../../../../constants/app_strings.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/dimens.dart';
import '../../../utils/app_dialogs/dialogs.dart';
import '../../../utils/constants.dart';
import '../../../widgets/icon_widget.dart';
import 'image_pick_option_widget.dart';

class ImagePickerWidget extends StatefulWidget {
  const ImagePickerWidget({Key? key}) : super(key: key);

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  var imgPicker;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => imagePickModelBottomSheet(),
      child: imgPicker == null
          ? Container(
        decoration: const BoxDecoration(
          color: AppColors.textFieldColor,
          shape: BoxShape.circle,
        ),
        height: screenSize.height * 0.17,
        width: screenSize.width * 0.4,
        child: const IconWidget(
          icon: Icons.image_outlined,
          color: AppColors.whiteColor,
          size: Dimens.size40,
        ),
      )
          : Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: FileImage(File(imgPicker.path)),
              fit: BoxFit.cover),
          shape: BoxShape.circle,
          // border: Border.all(color: MyColors.primary)
        ),
        height: screenSize.height * 0.17,
        width: screenSize.width * 0.4,
      ),
    );
  }
  void imagePickModelBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ImagePickOptionWidget(
          onCameraTap: () => pickImg(ImageSource.camera),
          onGalleryTap: () => pickImg(ImageSource.gallery),
        );
      },);
  }
  void pickImg(ImageSource source)async{
    //NavigatorState navigatorState=Navigator.of(context);
    imgPicker= await AppConstants.picker.pickImage(source: source);
    if (imgPicker != null) {
      _cropImage();
      imgPicker = File(imgPicker.path);
      setState(() {
        Navigator.pop(context);
      });

    } else {
      AppDialogs.showAuthDialog(
       // context: context,
        title: AppStrings.noImagePickedText,
        body: AppStrings.galleryCheckText,
        okBtnTitle: AppStrings.okText,
        okBtnPressed: () => Navigator.pop(context),
      );
    }
  }
  Future _cropImage() async{
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: imgPicker.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: AppStrings.cropperText,
            toolbarColor: AppColors.appBlueColor,
            toolbarWidgetColor: AppColors.textFieldColor,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: AppStrings.cropperText,
        ),
      ],
    );
    if (croppedFile != null) {
      imgPicker = croppedFile;
       setState(() {
       });
    }
  }
}
