// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:daily/core/function/extention_functions.dart';
// import 'package:daily/core/resource/constant_manager.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';

// import 'package:daily/features/article/presentation/widgets/list_tile_widget.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../../core/function/language_functions.dart';
// import '../../../../core/resource/color_manger.dart';
// import '../../../../core/resource/font_manger.dart';
// import '../../../../core/resource/icon_manger.dart';
// import '../../../../core/resource/size_manger.dart';
// import '../../../../core/widget/button/svg_button.dart';
// import '../../../../core/widget/container/decorated_container.dart';
// import '../../../../core/widget/image/main_image_widget.dart';
// import '../../../../core/widget/text/app_text_widget.dart';
// import '../../../../generated/locale_keys.g.dart';
// import '../../domain/entities/request/set_like_request_entity.dart';
// import '../../domain/entities/response/article_response_entity.dart';
// import '../cubit/set_article_like_cubit/set_article_like_cubit.dart';

// class ArticleListItem extends StatelessWidget {
//   const ArticleListItem({
//     Key? key,
//     required this.article,
//     this.onTap,
//   }) : super(key: key);

//   final Article article;
//   final void Function()? onTap;

//   @override
//   Widget build(BuildContext context) {
//     String categories = '';
//     for (var i = 0; i < article.post.categories.length; i++) {
//       categories += isEnglish()
//           ? article.post.categories[i].name.en
//           : article.post.categories[i].name.ar;
//       if (i < article.post.categories.length - 1) {
//         categories += ', ';
//       }
//     }
//     return InkWell(
//       onTap: onTap,
//       child: Visibility(
//         visible: article.post.image.image.url.isNotEmpty,
//         replacement: DecoratedContainer(
//           padding: EdgeInsets.symmetric(
//               horizontal: AppWidthManger.w4, vertical: AppHeightManger.h1),
//           child: Column(
//             children: [
//               Align(
//                 alignment: checkIfLTR(context: context)
//                     ? Alignment.centerRight
//                     : Alignment.centerLeft,
//                 child: AppTextWidget(
//                   text: categories,
//                   fontWeight: FontWeightManger.semiBoldWeight,
//                   overflow: TextOverflow.ellipsis,
//                   fontSize: FontSizeManger.fs15,
//                 ),
//               ),
//               //Image , Title And Sub Title
//               ListTileWidget(
//                 imageLoaderUrl:
//                     '${AppConstantManager.imageLoader}${article.publisher.profilePic.loaderData}',
//                 imageUrl: article.publisher.profilePic.image.url,
//                 title: article.publisher.fullName,
//                 subTitle: article.post.type.name,
//               ),

//               //Content Text
//               AppTextWidget(
//                 text: article.post.description,
//                 maxLines: 3,
//                 overflow: TextOverflow.ellipsis,
//                 fontSize: FontSizeManger.fs15,
//               ),
//               SizedBox(
//                 height: AppHeightManger.h1,
//               ),
//               Align(
//                 alignment: checkIfLTR(context: context)
//                     ? Alignment.centerRight
//                     : Alignment.centerLeft,
//                 child: AppTextWidget(
//                   text: article.post.createdAt.formatDate(),
//                   color: AppColorManger.greyAppColor,
//                 ),
//               ),
//               SizedBox(
//                 height: AppHeightManger.h1,
//               ),

//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: [
//                       SvgButton(
//                         iconAssetPath: AppIconManger.likeCircleIcon,
//                         width: AppWidthManger.w4,
//                         height: AppWidthManger.w4,
//                       ),
//                       SizedBox(
//                         width: AppWidthManger.w1,
//                       ),
//                       AppTextWidget(
//                         text: '${article.totalLikes} ${LocaleKeys.likes.tr()}',
//                         color: AppColorManger.greyAppColor,
//                       ),
//                     ],
//                   ),
//                   AppTextWidget(
//                     text: '${article.totalShares} ${LocaleKeys.shareC.tr()} ',
//                     color: AppColorManger.greyAppColor,
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: AppHeightManger.h05,
//               ),
//               const Divider(
//                 color: AppColorManger.lightGreyAppColor,
//               ),
//               SizedBox(
//                 height: AppHeightManger.h05,
//               ),
//               StatefulBuilder(builder: (context, set) {
//                 return Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     InkWell(
//                       onTap: () {
//                         context.read<SetArticleLikeCubit>().toggleLike(
//                               setLikeRequestEntity: SetLikeRequestEntity(
//                                   isFavorite: article.isLike,
//                                   postId: article.post.objectId),
//                             );
//                         set(
//                           () {
//                             article.isLike = !article.isLike;
//                           },
//                         );
//                       },
//                       child: Row(
//                         children: [
//                           SvgButton(
//                             color: article.isLike
//                                 ? AppColorManger.secondaryAppColor
//                                 : null,
//                             iconAssetPath: article.isLike
//                                 ? AppIconManger.likedIcon
//                                 : AppIconManger.likeIcon,
//                             width: AppWidthManger.w5,
//                             height: AppWidthManger.w5,
//                           ),
//                           SizedBox(
//                             width: AppWidthManger.w1,
//                           ),
//                           AppTextWidget(
//                             text: article.isLike
//                                 ? LocaleKeys.likedC.tr()
//                                 : LocaleKeys.likeC.tr(),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       height: AppHeightManger.h4,
//                       width: 0.8,
//                       color: AppColorManger.lightGreyAppColor,
//                     ),
//                     Row(
//                       children: [
//                         SvgButton(
//                           iconAssetPath: AppIconManger.shareIcon,
//                           width: AppWidthManger.w5,
//                           height: AppWidthManger.w5,
//                         ),
//                         SizedBox(
//                           width: AppWidthManger.w1,
//                         ),
//                         AppTextWidget(
//                           text: LocaleKeys.shareC.tr(),
//                         ),
//                       ],
//                     ),
//                   ],
//                 );
//               })
//             ],
//           ),
//         ),
//         child: Stack(
//           fit: StackFit.loose,
//           children: [
//             MainImageWidget(
//               borderRadius: BorderRadius.circular(AppRadiusManger.r2),
//               placeholderUrl:
//                   '${AppConstantManager.imageLoader}${article.post.image.loaderData}',
//               imageUrl: article.post.image.image.url,
//               width: double.infinity,
//               height: AppHeightManger.h30,
//             ),
//             SizedBox(
//               height: AppHeightManger.h60,
//             ),
//             Positioned(
//               bottom: 0,
//               width: AppWidthManger.w96,
//               child: DecoratedContainer(
//                 padding: EdgeInsets.symmetric(
//                     horizontal: AppWidthManger.w4,
//                     vertical: AppHeightManger.h1),
//                 child: Column(
//                   children: [
//                     Align(
//                       alignment: checkIfLTR(context: context)
//                           ? Alignment.centerRight
//                           : Alignment.centerLeft,
//                       child: AppTextWidget(
//                         text: categories,
//                         fontWeight: FontWeightManger.semiBoldWeight,
//                         overflow: TextOverflow.ellipsis,
//                         fontSize: FontSizeManger.fs15,
//                       ),
//                     ),
//                     //Image , Title And Sub Title
//                     ListTileWidget(
//                       imageLoaderUrl: article
//                               .publisher.profilePic.loaderData.isEmpty
//                           ? ''
//                           : '${AppConstantManager.imageLoader}${article.publisher.profilePic.loaderData}',
//                       imageUrl: article.publisher.profilePic.image.url,
//                       title: article.publisher.fullName,
//                       subTitle: article.post.type.name,
//                     ),
//                     //Content Text
//                     AppTextWidget(
//                       text: article.post.description,
//                       maxLines: 3,
//                       overflow: TextOverflow.ellipsis,
//                       fontSize: FontSizeManger.fs15,
//                     ),
//                     SizedBox(
//                       height: AppHeightManger.h1,
//                     ),
//                     Align(
//                       alignment: checkIfLTR(context: context)
//                           ? Alignment.centerRight
//                           : Alignment.centerLeft,
//                       child: AppTextWidget(
//                         text: article.post.createdAt.formatDate(),
//                         color: AppColorManger.greyAppColor,
//                       ),
//                     ),
//                     SizedBox(
//                       height: AppHeightManger.h1,
//                     ),

//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Row(
//                           children: [
//                             SvgButton(
//                               iconAssetPath: AppIconManger.likeCircleIcon,
//                               width: AppWidthManger.w4,
//                               height: AppWidthManger.w4,
//                             ),
//                             SizedBox(
//                               width: AppWidthManger.w1,
//                             ),
//                             AppTextWidget(
//                               text:
//                                   '${article.totalLikes} ${LocaleKeys.likes.tr()}',
//                               color: AppColorManger.greyAppColor,
//                             ),
//                           ],
//                         ),
//                         AppTextWidget(
//                           text:
//                               '${article.totalShares} ${LocaleKeys.shareC.tr()} ',
//                           color: AppColorManger.greyAppColor,
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: AppHeightManger.h05,
//                     ),
//                     const Divider(
//                       color: AppColorManger.lightGreyAppColor,
//                     ),
//                     SizedBox(
//                       height: AppHeightManger.h05,
//                     ),
//                     StatefulBuilder(builder: (context, set) {
//                       return Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           InkWell(
//                             onTap: () {
//                               context.read<SetArticleLikeCubit>().toggleLike(
//                                     setLikeRequestEntity: SetLikeRequestEntity(
//                                         isFavorite: article.isLike,
//                                         postId: article.post.objectId),
//                                   );
//                               set(
//                                 () {
//                                   article.isLike = !article.isLike;
//                                 },
//                               );
//                             },
//                             child: Row(
//                               children: [
//                                 SvgButton(
//                                   color: article.isLike
//                                       ? AppColorManger.secondaryAppColor
//                                       : null,
//                                   iconAssetPath: article.isLike
//                                       ? AppIconManger.likedIcon
//                                       : AppIconManger.likeIcon,
//                                   width: AppWidthManger.w5,
//                                   height: AppWidthManger.w5,
//                                 ),
//                                 SizedBox(
//                                   width: AppWidthManger.w1,
//                                 ),
//                                 AppTextWidget(
//                                   text: article.isLike
//                                       ? LocaleKeys.likedC.tr()
//                                       : LocaleKeys.likeC.tr(),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Container(
//                             height: AppHeightManger.h4,
//                             width: 0.8,
//                             color: AppColorManger.lightGreyAppColor,
//                           ),
//                           InkWell(
//                             onTap: () {},
//                             child: Row(
//                               children: [
//                                 SvgButton(
//                                   iconAssetPath: AppIconManger.shareIcon,
//                                   width: AppWidthManger.w5,
//                                   height: AppWidthManger.w5,
//                                 ),
//                                 SizedBox(
//                                   width: AppWidthManger.w1,
//                                 ),
//                                 AppTextWidget(
//                                   text: LocaleKeys.shareC.tr(),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       );
//                     })
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
