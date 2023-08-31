// import 'package:flutter/material.dart';
//
// import '../../../../constants/colors.dart';
// import '../../../../constants/dimens.dart';
//
// class SelectImageWidget extends StatelessWidget {
//   final Widget child;
//   final VoidCallback onTap;
//   const SelectImageWidget({Key? key,required this.onTap,required this.child}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () async {
//       },
//       child: file == null
//           ? SizedBox(
//         height: 100,
//         child: Image.asset(
//           MyImgs.pictureSelect,
//         ),
//       )
//           : Container(
//         decoration: BoxDecoration(
//             image: DecorationImage(image: FileImage(File(file!.path)), fit: BoxFit.contain),
//             shape: BoxShape.circle,
//             border: Border.all(color: MyColors.primary)),
//         height: 100,
//       ),
//     ),;
//     //   GestureDetector(
//     //   onTap: onTap,
//     //   child: CircleAvatar(
//     //     backgroundColor: AppColors.textFieldColor,
//     //     radius: Dimens.size60,
//     //     child: child,
//     //   ),
//     // );
//   }
// }
