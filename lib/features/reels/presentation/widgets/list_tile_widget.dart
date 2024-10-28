// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:flutter/material.dart';

// import '../../../../core/resource/color_manger.dart';
// import '../../../../core/resource/constant_manager.dart';
// import '../../../../core/resource/font_manger.dart';
// import '../../../../core/resource/size_manger.dart';
// import '../../../../core/widget/image/main_image_widget.dart';
// import '../../../../core/widget/text/app_text_widget.dart';

// class ListTileWidget extends StatelessWidget {
//   const ListTileWidget({
//     Key? key,
//     required this.title,
//     required this.subTitle,
//     required this.imageUrl,
//     required this.imageLoaderUrl,
//   }) : super(key: key);
//   final String title;
//   final String subTitle;
//   final String imageUrl;
//   final String imageLoaderUrl;

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       contentPadding: EdgeInsets.zero,
//       dense: true,
//       leading: ClipRRect(
//         borderRadius: BorderRadius.circular(AppRadiusManger.r100),
//         child: MainImageWidget(
//           placeholderUrl: '${AppConstantManager.imageLoader}$imageLoaderUrl',
//           imageUrl: imageUrl,
//           width: AppWidthManger.w12,
//         ),
//       ),
//       title: AppTextWidget(
//         text: title,
//         color: AppColorManger.mainAppColor,
//         fontSize: FontSizeManger.fs16,
//         fontWeight: FontWeightManger.boldWeight,
//       ),
//       subtitle: AppTextWidget(
//         text: subTitle,
//         color: AppColorManger.mainAppColor,
//         fontSize: FontSizeManger.fs15,
//       ),
//     );
//   }
// }
