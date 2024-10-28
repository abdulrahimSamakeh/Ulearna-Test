// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../resource/color_manger.dart';
import '../../resource/size_manger.dart';

class MainAppButton extends StatelessWidget {
  const MainAppButton({
    super.key,
    this.width,
    this.height,
    this.color,
    this.borderColor,
    this.haveShadow,
    this.outLinedBorde,
    this.child,
    this.padding,
    this.margin,
    this.alignment,
    this.onTap,
    this.borderRadius,
  });
  final double? width;
  final double? height;
  final Color? color;
  final Color? borderColor;
  final bool? haveShadow;
  final bool? outLinedBorde;
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final AlignmentGeometry? alignment;
  final void Function()? onTap;
  final BorderRadiusGeometry? borderRadius;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: margin,
        padding: padding,
        alignment: alignment,
        width: width,
        height: height,
        decoration: BoxDecoration(
          border: outLinedBorde == true
              ? Border.all(
                  color: borderColor ?? AppColorManger.mainAppColor,
                )
              : null,
          boxShadow: haveShadow == true
              ? [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.45),
                    spreadRadius: 0,
                    blurRadius: 8,
                    offset:
                        // changes position of shadow
                        const Offset(0, 0),
                  ),
                ]
              : null,
          color: outLinedBorde == true ? AppColorManger.white : color,
          borderRadius:
              borderRadius ?? BorderRadius.circular(AppRadiusManger.r2),
        ),
        child: child,
      ),
    );
  }
}