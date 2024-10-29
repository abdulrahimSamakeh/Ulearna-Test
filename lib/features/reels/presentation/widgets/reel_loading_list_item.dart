import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/resource/color_manger.dart';
import '../../../../core/resource/size_manger.dart';
import '../../../../core/widget/container/decorated_container.dart';

class ReelLoadingListItem extends StatelessWidget {
  const ReelLoadingListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColorManger.shimmerBaseColor,
      highlightColor: AppColorManger.shimmerHighlightColor,
      child: DecoratedContainer(
        margin: EdgeInsets.symmetric(vertical: AppHeightManger.h1),
        width: double.infinity,
        height: AppHeightManger.h24,
      ),
    );
  }
}
