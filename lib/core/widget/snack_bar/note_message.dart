import 'package:flutter/material.dart';

import '../../resource/color_manger.dart';
import '../../resource/font_manger.dart';
import '../../resource/size_manger.dart';
import '../text/app_text_widget.dart';

//Customized Snack Bar
class NoteMessage {
  static showSnackBar(
      {required BuildContext context,
      required String text,
      void Function()? onTap,
      int? duration,
      TextOverflow? overflow,
      int? maxLines,
      required bool warning}) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: GestureDetector(
        onTap: onTap,
        child: SizedBox(
          width: AppWidthManger.w100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: AppTextWidget(
                  text: text,
                  fontSize: FontSizeManger.fs14,
                  color: warning
                      ? AppColorManger.redAppColor
                      : AppColorManger.mainAppColor,
                  fontWeight: FontWeight.bold,
                  overflow: overflow ?? TextOverflow.visible,
                  maxLines: maxLines ?? 2,
                  softWrap: true,
                ),
              ),
              SizedBox(
                width: AppWidthManger.w2,
              ),
              GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                },
                child: Icon(
                  Icons.cancel_rounded,
                  color: warning
                      ? AppColorManger.redAppColor
                      : AppColorManger.mainAppColor,
                  size: AppIconSizeManger.s4,
                ),
              )
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      duration: Duration(seconds: duration ?? 2),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadiusManger.r3),
        side: BorderSide(
          width: 2,
          color: warning
              ? AppColorManger.redAppColor
              : AppColorManger.mainAppColor,
        ),
      ),
    ));
  }
}
