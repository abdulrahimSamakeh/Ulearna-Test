// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../function/language_functions.dart';
import '../../resource/size_manger.dart';
import '../loading/opacity_loader_widget.dart';

class PaginationListView extends StatefulWidget {
  const PaginationListView(
      {super.key,
      this.onReachMaxScroll,
      required this.itemBuilder,
      required this.itemCount,
      this.padding,
      this.physics,
      this.scrollDirection,
      this.controller,
      this.isLoading,
      required this.separatorBuilder});
  final Widget Function(BuildContext, int) separatorBuilder;
  final void Function()? onReachMaxScroll;
  final Widget Function(BuildContext, int) itemBuilder;
  final int itemCount;
  final bool? isLoading;

  final EdgeInsetsGeometry? padding;
  final Axis? scrollDirection;
  final ScrollController? controller;
  final ScrollPhysics? physics;

  @override
  State<PaginationListView> createState() => _PaginationListViewState();
}

class _PaginationListViewState extends State<PaginationListView> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(onMaxScroll);
  }

  @override
  void dispose() {
    scrollController
      ..removeListener(onMaxScroll)
      ..dispose();
    super.dispose();
  }

  //Functions
  void onMaxScroll() async {
    final maxScroll = scrollController.position.maxScrollExtent;
    final curenntScroll = scrollController.offset;
    if (curenntScroll >= maxScroll * 0.9 && widget.onReachMaxScroll != null) {
      widget.onReachMaxScroll!();
    }
  }

  @override
  Widget build(BuildContext context) {
    //Stack Widget Wraped To Make Specific Loader Above Liste When Pagination Happened
    return Stack(
      children: [
        //Listview Widget
        Align(
          alignment: checkIfLTR(context: context)
              ? Alignment.centerLeft
              : Alignment.centerRight,
          child: ListView.separated(
            physics: widget.physics,
            controller: widget.controller ?? scrollController,
            shrinkWrap: true,
            padding: widget.padding ??
                EdgeInsets.only(
                    top: AppHeightManger.h1,
                    left: checkIfLTR(context: context) ? AppWidthManger.w4 : 0,
                    right: checkIfLTR(context: context) ? 0 : AppWidthManger.w4,
                    bottom: AppHeightManger.h1),
            separatorBuilder: widget.separatorBuilder,
            itemCount: widget.itemCount,
            scrollDirection: widget.scrollDirection ?? Axis.horizontal,
            itemBuilder: widget.itemBuilder,
          ),
        ),
        //Loading Opacity
        if (widget.isLoading == true) const OpacityLoaderWidget()
      ],
    );
  }
}
