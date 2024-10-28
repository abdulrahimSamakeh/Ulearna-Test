// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../resource/color_manger.dart';
import '../../resource/font_manger.dart';
import '../../resource/size_manger.dart';
import '../text/app_text_widget.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({
    super.key,
    this.title,
    this.leading,
    this.leadingWidth,
    this.automaticallyImplyLeading,
    this.roundedShape,
    this.centerTitle,
    this.elevation,
    this.titleSpacing,
    this.backgroundColor,
    this.actions,
    this.contentColor,
  });
  final String? title;
  final Widget? leading;
  final double? leadingWidth;
  final bool? automaticallyImplyLeading;
  final bool? roundedShape;
  final bool? centerTitle;
  final double? elevation;
  final double? titleSpacing;
  final Color? backgroundColor;
  final List<Widget>? actions;
  final Color? contentColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      titleSpacing: titleSpacing,
      iconTheme: IconThemeData(
        color:
            contentColor ?? AppColorManger.white, // set the color of the icon
      ),
      leading: leading,
      actions: actions,
      leadingWidth: leadingWidth,
      title: title != null
          ? AppTextWidget(
              text: title!,
              fontWeight: FontWeightManger.normalWeight,
              color: contentColor ?? AppColorManger.white,
              fontSize: FontSizeManger.fs20,
            )
          : null,
      centerTitle: centerTitle ?? false,
      elevation: elevation ?? 0,
      automaticallyImplyLeading: automaticallyImplyLeading ?? true,
      shape: roundedShape == true
          ? RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(AppRadiusManger.r3),
              ),
            )
          : null,
    );
  }

  //Hight Of App Bar
  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + AppHeightManger.h1);
}
