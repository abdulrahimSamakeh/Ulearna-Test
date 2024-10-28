import 'package:flutter/widgets.dart';

import '../../resource/size_manger.dart';
import '../loading/opacity_loader_widget.dart';

class PaginationGridView extends StatefulWidget {
  const PaginationGridView(
      {super.key,
      this.onReachMaxScroll,
      required this.itemBuilder,
      required this.itemCount,
      this.controller,
      this.padding,
      this.physics,
      this.reverse,
      this.gridDelegate,
      this.isLoading,
      this.scrollDirection});

//Variables
  final void Function()? onReachMaxScroll;
  final Widget Function(BuildContext, int) itemBuilder;
  final int itemCount;
  final EdgeInsetsGeometry? padding;
  final Axis? scrollDirection;
  final ScrollController? controller;
  final ScrollPhysics? physics;
  final bool? reverse;
  final SliverGridDelegate? gridDelegate;
  final bool? isLoading;
  @override
  State<PaginationGridView> createState() => _PaginationGridViewState();
}

class _PaginationGridViewState extends State<PaginationGridView> {
  final ScrollController scrollController = ScrollController();
  //Widget Cycle Functions
  //Initilize Scorll Controller
  @override
  void initState() {
    super.initState();
    scrollController.addListener(onMaxScroll);
  }

  //Dispose Scorll Controller
  @override
  void dispose() {
    scrollController
      ..removeListener(onMaxScroll)
      ..dispose();
    super.dispose();
  }

  //Functions
  //On Scolling Finished
  void onMaxScroll() {
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
        //Gridview Widget
        GridView.builder(
          reverse: widget.reverse ?? false,
          physics: widget.physics,
          controller: widget.controller ?? scrollController,
          gridDelegate: widget.gridDelegate ??
              SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: AppWidthManger.w38 / AppHeightManger.h28,
                  crossAxisSpacing: AppWidthManger.w4,
                  mainAxisSpacing: AppHeightManger.h2),
          shrinkWrap: true,
          padding: widget.padding ??
              EdgeInsets.symmetric(
                horizontal: AppWidthManger.w4,
                vertical: AppHeightManger.h2,
              ),
          itemCount: widget.itemCount,
          scrollDirection: widget.scrollDirection ?? Axis.vertical,
          itemBuilder: widget.itemBuilder,
        ),
        //Loading Opacity
        if (widget.isLoading == true) const OpacityLoaderWidget()
      ],
    );
  }
}
