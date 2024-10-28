// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:flutter/material.dart';

// import 'package:daily/core/resource/font_manger.dart';

// import '../../../../core/resource/color_manger.dart';
// import '../../../../core/resource/size_manger.dart';
// import '../../../../core/widget/container/decorated_container.dart';
// import '../../../../core/widget/text/app_text_widget.dart';

// class FilterButtonWidget extends StatelessWidget {
//   const FilterButtonWidget({
//     Key? key,
//     required this.filterTitle,
//     required this.isSelected,
//     this.onTap,
//   }) : super(key: key);
//   final String filterTitle;
//   final bool isSelected;
//   final void Function()? onTap;

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       child: DecoratedContainer(
//         borderRadius: BorderRadius.circular(AppRadiusManger.r2),
//         boxShadow: const [
//           BoxShadow(
//               offset: Offset(0, 0),
//               blurRadius: 0,
//               spreadRadius: 0,
//               color: AppColorManger.greyAppColor)
//         ],
//         color: isSelected
//             ? AppColorManger.mainAppColor
//             : AppColorManger.lightGreyAppColor,
//         padding: EdgeInsets.symmetric(
//             horizontal: AppWidthManger.w4, vertical: AppHeightManger.h1),
//         alignment: Alignment.center,
//         child: AppTextWidget(
//           text: filterTitle,
//           fontSize: FontSizeManger.fs14,
//           color:
//               isSelected ? AppColorManger.white : AppColorManger.greyAppColor,
//         ),
//       ),
//     );
//   }
// }
