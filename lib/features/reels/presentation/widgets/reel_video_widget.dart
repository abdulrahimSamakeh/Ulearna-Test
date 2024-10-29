import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ReelVideoWidget extends StatefulWidget {
  const ReelVideoWidget({
    super.key,
    required this.videoUrl,
  });
  final String videoUrl;
  @override
  State<ReelVideoWidget> createState() => _ReelVideoWidgetState();
}

class _ReelVideoWidgetState extends State<ReelVideoWidget> {
  late VideoPlayerController controller;
  @override
  void initState() {
    controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
    controller.initialize().then((value) {
      controller.play();
      setState(() {});
    });
    super.initState();
  }

  //TODO: Not Completed
  @override
  Widget build(BuildContext context) {
    return controller.value.isInitialized
        ? AspectRatio(
            aspectRatio: controller.value.aspectRatio,
            child: VideoPlayer(controller))
        : const CircularProgressIndicator();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
