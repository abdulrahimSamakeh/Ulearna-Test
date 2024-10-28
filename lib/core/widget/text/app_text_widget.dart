import 'package:flutter/material.dart';

import '../../resource/color_manger.dart';
import '../../resource/font_manger.dart';

class AppTextWidget extends StatefulWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final Color? color;
  final Color? decorationColor;
  final TextDecoration? textDecoration;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final TextStyle? style;
  final TextOverflow? overflow;
  final int? maxLines;
  final bool? softWrap;
  final EdgeInsetsGeometry? padding;
  final void Function()? onTap;
  const AppTextWidget({
    super.key,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
    this.color = AppColorManger.textAppColor,
    this.decorationColor,
    this.textDecoration,
    this.textAlign,
    this.textDirection,
    this.style,
    this.overflow,
    this.maxLines,
    this.softWrap,
    this.padding,
    this.onTap,
  });

  @override
  State<AppTextWidget> createState() => _AppTextWidgetState();
}

class _AppTextWidgetState extends State<AppTextWidget> {
  late double fontSize;
  @override
  void initState() {
    if (widget.fontSize != null) {
      fontSize = widget.fontSize!;
    } else {
      fontSize = FontSizeManger.fs14;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Padding(
        padding: widget.padding ?? EdgeInsets.zero,
        child: Text(
          widget.text,
          maxLines: widget.maxLines,
          overflow: widget.overflow ?? TextOverflow.ellipsis,
          softWrap: widget.softWrap,
          textAlign: widget.textAlign,
          textDirection: widget.textDirection,
          style: widget.style ??
              TextStyle(
                fontFamily: FontFamilyManager.cairo,
                fontSize: fontSize,
                fontWeight: widget.fontWeight,
                color: widget.color,
                decoration: widget.textDecoration,
                decorationColor: widget.decorationColor,
              ),
        ),
      ),
    );
  }
}
