// import 'package:daily/core/function/language_functions.dart';
// import 'package:daily/core/resource/enum_manger.dart';
// import 'package:daily/core/resource/icon_manger.dart';
// import 'package:daily/core/resource/size_manger.dart';
// import 'package:daily/core/storage/shared/shared_pref.dart';
// import 'package:daily/core/widget/app_bar/main_app_bar.dart';
// import 'package:daily/core/widget/button/refresh_button.dart';
// import 'package:daily/core/widget/button/svg_button.dart';
// import 'package:daily/core/widget/loading/opacity_loader_widget.dart';
// import 'package:daily/core/widget/snack_bar/note_message.dart';
// import 'package:daily/features/article/domain/entities/request/article_request_entity.dart';
// import 'package:daily/features/article/presentation/cubit/articles_cubit/articles_cubit.dart';
// import 'package:daily/features/article/presentation/cubit/categories_cubit/categories_cubit.dart';
// import 'package:daily/features/article/presentation/widgets/article_list_item.dart';
// import 'package:daily/features/article/presentation/widgets/article_loading_list_item.dart';
// import 'package:daily/generated/locale_keys.g.dart';
// import 'package:daily/router/app_router.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../../core/resource/color_manger.dart';
// import '../widgets/filter_button_widget.dart';
// import '../widgets/filter_loading_list_item.dart';

// class ArticlePage extends StatelessWidget {
//   const ArticlePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     ArticleRequestEntity articleRequestEntity = ArticleRequestEntity.initial();
//     return Scaffold(
//       appBar: MainAppBar(
//         centerTitle: true,
//         actions: [
//           IconButton(
//             onPressed: () {
//               if (AppSharedPreferences.getCashedGuestMode()) {
//                 NoteMessage.showSnackBar(
//                   context: context,
//                   text: LocaleKeys.pleaseLoginFirst.tr(),
//                   warning: false,
//                   onTap: () {
//                     Navigator.pushNamedAndRemoveUntil(context,
//                         RouteNamedScreens.loginNameRoutePage, (route) => false);
//                   },
//                 );
//               } else {
//                 Navigator.pushNamed(
//                     context, RouteNamedScreens.notificationNameRoutePage);
//               }
//             },
//             icon:
//                 const SvgButton(iconAssetPath: AppIconManger.notificationIcon),
//           ),
//         ],
//         title: LocaleKeys.daily.tr(),
//         leading: IconButton(
//           onPressed: () {
//             if (AppSharedPreferences.getCashedGuestMode()) {
//               NoteMessage.showSnackBar(
//                 context: context,
//                 text: LocaleKeys.pleaseLoginFirst.tr(),
//                 warning: false,
//                 onTap: () {
//                   Navigator.pushNamedAndRemoveUntil(context,
//                       RouteNamedScreens.loginNameRoutePage, (route) => false);
//                 },
//               );
//             } else {
//               Navigator.pushNamed(
//                   context, RouteNamedScreens.profileNameRoutePage);
//             }
//           },
//           icon: const SvgButton(
//             iconAssetPath: AppIconManger.userIcon,
//           ),
//         ),
//       ),
//       body: BlocConsumer<ArticlesCubit, ArticlesState>(
//         listener: (context, state) {
//           switch (state.status) {
//             case CubitStatus.error:
//               NoteMessage.showSnackBar(
//                   context: context, text: state.error, warning: true);
//               break;
//             default:
//           }
//         },
//         builder: (context, state) {
//           switch (state.status) {
//             case CubitStatus.succses:
//               {
//                 final articlesList = state.articleResponseEntity.result;
//                 return Stack(
//                   children: [
//                     RefreshIndicator(
//                       onRefresh: () async {
//                         context.read<ArticlesCubit>().getArticles(
//                             articleRequestEntity:
//                                 ArticleRequestEntity.initial(),
//                             reset: true);
//                         context.read<CategoriesCubit>().getCategories();
//                       },
//                       child: CustomScrollView(
//                         slivers: [
//                           // Sliver App Bar Filter
//                           SliverAppBar(
//                             scrolledUnderElevation: 0.5,
//                             floating: true,
//                             toolbarHeight: AppHeightManger.h9,
//                             backgroundColor: AppColorManger.white,
//                             actions: [
//                               // List Of Filters
//                               BlocConsumer<CategoriesCubit, CategoriesState>(
//                                 listener: (context, state) {},
//                                 builder: (context, state) {
//                                   return Visibility(
//                                     replacement: Expanded(
//                                       child: ListView.builder(
//                                         physics:
//                                             const NeverScrollableScrollPhysics(),
//                                         itemCount: 10,
//                                         itemBuilder: (context, index) {
//                                           return const FilterLoadingListItem();
//                                         },
//                                       ),
//                                     ),
//                                     visible:
//                                         state.status == CubitStatus.succses &&
//                                             state.categoriesResponseEntity
//                                                 .result.isNotEmpty,
//                                     child: Expanded(
//                                       child: ListView.separated(
//                                         padding: EdgeInsets.symmetric(
//                                             vertical: AppHeightManger.h2,
//                                             horizontal: AppWidthManger.w4),
//                                         scrollDirection: Axis.horizontal,
//                                         itemBuilder: (context, index) {
//                                           final categoryItem = state
//                                               .categoriesResponseEntity
//                                               .result[index];
//                                           return FilterButtonWidget(
//                                             onTap: () {
//                                               if (!categoryItem.isSelected) {
//                                                 if (categoryItem
//                                                     .objectId.isEmpty) {
//                                                   articleRequestEntity
//                                                       .categoryIdList = null;
//                                                 } else {
//                                                   articleRequestEntity
//                                                       .categoryIdList = [];
//                                                   articleRequestEntity
//                                                       .categoryIdList!
//                                                       .add(categoryItem
//                                                           .objectId);
//                                                 }
//                                                 context
//                                                     .read<ArticlesCubit>()
//                                                     .getArticles(
//                                                         articleRequestEntity:
//                                                             articleRequestEntity,
//                                                         reset: true);
//                                                 context
//                                                     .read<CategoriesCubit>()
//                                                     .selecteCategorie(
//                                                         categoryId: categoryItem
//                                                             .objectId);
//                                               }
//                                             },
//                                             filterTitle: isEnglish()
//                                                 ? categoryItem.name.en
//                                                 : categoryItem.name.ar,
//                                             isSelected: categoryItem.isSelected,
//                                           );
//                                         },
//                                         separatorBuilder: (context, index) =>
//                                             SizedBox(
//                                           width: AppWidthManger.w2,
//                                         ),
//                                         itemCount: state
//                                             .categoriesResponseEntity
//                                             .result
//                                             .length,
//                                       ),
//                                     ),
//                                   );
//                                 },
//                               )
//                             ],
//                           ),
//                           //List Of Articles
//                           SliverPadding(
//                             padding: EdgeInsets.symmetric(
//                                 horizontal: AppWidthManger.w2,
//                                 vertical: AppHeightManger.h1),
//                             sliver: SliverList.separated(
//                               itemBuilder: (context, index) {
//                                 final article = articlesList[index];
//                                 return ArticleListItem(
//                                   onTap: () => Navigator.pushNamed(
//                                       context,
//                                       RouteNamedScreens
//                                           .articleDetailsNameRoutePage,
//                                       arguments: article),
//                                   article: article,
//                                 );
//                               },
//                               itemCount: articlesList.length,
//                               separatorBuilder: (context, index) {
//                                 return SizedBox(
//                                   height: AppHeightManger.h2,
//                                 );
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Visibility(
//                         visible: state.loadPagination,
//                         child: const OpacityLoaderWidget()),
//                   ],
//                 );
//               }
//             case CubitStatus.loading:
//               {
//                 return ListView.builder(
//                   physics: const NeverScrollableScrollPhysics(),
//                   itemCount: 20,
//                   padding: EdgeInsets.symmetric(
//                       horizontal: AppWidthManger.w2,
//                       vertical: AppHeightManger.h1),
//                   itemBuilder: (context, index) {
//                     return const ArticleLoadingListItem();
//                   },
//                 );
//               }
//             default:
//               {
//                 return RefreshButton(
//                   refreshTitle: state.error,
//                   haveRefreshButton: true,
//                   onTap: () {
//                     context.read<ArticlesCubit>().getArticles(
//                         articleRequestEntity: ArticleRequestEntity.initial(),
//                         reset: true);
//                     context.read<CategoriesCubit>().getCategories();
//                   },
//                 );
//               }
//           }
//         },
//       ),
//     );
//   }
// }
