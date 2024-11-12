// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:ulearna_test/core/function/extention_functions.dart';
import 'package:ulearna_test/features/reels/domain/entities/response/reels_response_entite.dart';
import 'package:ulearna_test/features/reels/presentation/widgets/list_tile_widget.dart';
import 'package:ulearna_test/features/reels/presentation/widgets/reel_video_widget.dart';

import '../../../../core/function/language_functions.dart';
import '../../../../core/resource/color_manger.dart';
import '../../../../core/resource/font_manger.dart';
import '../../../../core/resource/icon_manger.dart';
import '../../../../core/resource/size_manger.dart';
import '../../../../core/widget/button/svg_button.dart';
import '../../../../core/widget/container/decorated_container.dart';
import '../../../../core/widget/text/app_text_widget.dart';

class ReelsListItem extends StatelessWidget {
  const ReelsListItem({
    super.key,
    required this.reel,
    this.onTap,
  });

  final Datum reel;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          //Reel Video
          DecoratedContainer(
            borderRadius: BorderRadius.circular(AppRadiusManger.r2),
            width: double.infinity,
            height: AppHeightManger.h30,
            child: ReelVideoWidget(
              videoPath: reel.videoPath,
            ),
          ),
          //Reel Destails
          DecoratedContainer(
            padding: EdgeInsets.symmetric(
                horizontal: AppWidthManger.w4, vertical: AppHeightManger.h1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Image , Title And Sub Title
                ListTileWidget(
                  imageLoaderUrl:
                      reel.thumbCdnUrl.isEmpty ? '' : reel.thumbCdnUrl,
                  imageUrl: reel.user.profilePictureCdn,
                  title: reel.user.fullname,
                  subTitle: reel.user.designation,
                ),
                //Content Text
                AppTextWidget(
                  text: reel.title,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  fontSize: FontSizeManger.fs15,
                ),
                SizedBox(
                  height: AppHeightManger.h1,
                ),
                Align(
                  alignment: checkIfLTR(context: context)
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: AppTextWidget(
                    text: reel.byteAddedOn.formatDate(),
                    color: AppColorManger.greyAppColor,
                  ),
                ),
                SizedBox(
                  height: AppHeightManger.h1,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgButton(
                          iconAssetPath: AppIconManger.likeCircleIcon,
                          width: AppWidthManger.w4,
                          height: AppWidthManger.w4,
                        ),
                        SizedBox(
                          width: AppWidthManger.w1,
                        ),
                        AppTextWidget(
                          text: '${reel.totalLikes} Likes',
                          color: AppColorManger.greyAppColor,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.comment_outlined,
                          size: 12,
                        ),
                        SizedBox(
                          width: AppWidthManger.w1,
                        ),
                        AppTextWidget(
                          text: '${reel.totalComments} Coments',
                          color: AppColorManger.greyAppColor,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SvgButton(
                          iconAssetPath: AppIconManger.shareIcon,
                          width: AppWidthManger.w4,
                          height: AppWidthManger.w4,
                        ),
                        SizedBox(
                          width: AppWidthManger.w1,
                        ),
                        AppTextWidget(
                          text: '${reel.totalShare} Shares',
                          color: AppColorManger.greyAppColor,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: AppHeightManger.h1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
