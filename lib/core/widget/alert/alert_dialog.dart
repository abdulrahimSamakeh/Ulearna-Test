// ignore_for_file: unnecessary_null_comparison
 
import 'package:flutter/material.dart';
import '../../resource/color_manger.dart';
import '../../resource/size_manger.dart';
 
import '../../resource/font_manger.dart';
import '../button/main_app_button.dart';
import '../text/app_text_widget.dart';

showAlertDialog(
    {required BuildContext context,
    required void Function()? onTapConfirm,
    required String title,
    String? body,
    Color? titleColor,
    Color? bodyColor,
    Color? confirmTextColor,
    Color? cancelTextColor,
    Color? cancelButtonColor,
    Color? confirmButtonColor,
    Widget? confirmButton,
    required String confirmText,
    String? cancelText,
    double? bodyFontSize,
    Widget? content,
    bool? reversActions}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(AppRadiusManger.r3))),
        contentPadding: EdgeInsets.only(
            left: AppWidthManger.w4,
            right: AppWidthManger.w4,
            top: AppHeightManger.h05,
            bottom: AppHeightManger.h3),
        insetPadding: EdgeInsets.symmetric(
          horizontal: AppWidthManger.w4,
        ),
        elevation: 0,
        backgroundColor: AppColorManger.white,
        title: AppTextWidget(
          text: title,
          fontWeight: FontWeightManger.boldWeight,
          fontSize: FontSizeManger.fs20,
          overflow: TextOverflow.visible,
          color: titleColor,
          textAlign: TextAlign.center,
        ),
        content: content ??
            AppTextWidget(
              color: bodyColor ?? AppColorManger.greyAppColor,
              text: body ?? '',
              fontWeight: FontWeightManger.semiBoldWeight,
              fontSize: bodyFontSize ?? FontSizeManger.fs16,
              overflow: TextOverflow.visible,
              textAlign: TextAlign.center,
            ),
        actionsAlignment: MainAxisAlignment.spaceBetween,
        actions: [
          Visibility(
            visible: reversActions == null || reversActions == false,
            replacement: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Confirm Button
                confirmButton ??
                    MainAppButton(
                      width: AppWidthManger.w38,
                      height: AppHeightManger.h5,
                      onTap: onTapConfirm,
                      alignment: Alignment.center,
                      color: confirmButtonColor,
                      child: AppTextWidget(
                        text: confirmText,
                        color: confirmTextColor,
                        fontSize: FontSizeManger.fs16,
                      ),
                    ),

                //Cancel Button
                MainAppButton(
                  width: AppWidthManger.w38,
                  height: AppHeightManger.h5,
                  onTap: () {
                    Navigator.pop(context);
                  },
                  color: cancelButtonColor,
                  alignment: Alignment.center,
                  child: AppTextWidget(
                    fontWeight: FontWeightManger.semiBoldWeight,
                    color: cancelTextColor,
                    text: cancelText ??'Cancel',
                    fontSize: FontSizeManger.fs16,
                  ),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MainAppButton(
                  padding: EdgeInsets.symmetric(horizontal: AppWidthManger.w10),
                  height: AppHeightManger.h5,
                  onTap: () {
                    Navigator.pop(context);
                  },
                  color: cancelButtonColor,
                  alignment: Alignment.center,
                  child: AppTextWidget(
                    text: 'Cancel',
                    fontSize: FontSizeManger.fs16,
                  ),
                ),
                //Confirm Button
                //Confirm Button
                confirmButton ??
                    MainAppButton(
                      width: AppWidthManger.w38,
                      height: AppHeightManger.h5,
                      onTap: onTapConfirm,
                      alignment: Alignment.center,
                      color: confirmButtonColor,
                      child: AppTextWidget(
                        text: confirmText,
                        color: confirmTextColor,
                        fontSize: FontSizeManger.fs16,
                      ),
                    ),
              ],
            ),
          ),
        ],
      );
    },
  );
}
