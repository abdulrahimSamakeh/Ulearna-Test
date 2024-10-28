import 'package:flutter/widgets.dart';

import '../../resource/color_manger.dart';
import 'app_circular_progress_widget.dart';

class OpacityLoaderWidget extends StatelessWidget {
  const OpacityLoaderWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.7,
      child: Container(
        color: AppColorManger.backgroundAppColor,
        child: const Center(
          child: AppCircularProgressWidget(),
        ),
      ),
    );
  }
}
