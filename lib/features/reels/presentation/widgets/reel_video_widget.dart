import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:ulearna_test/core/widget/text/app_text_widget.dart';
import 'package:ulearna_test/features/reels/presentation/widgets/reel_loading_list_item.dart';
// ignore: depend_on_referenced_packages
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ReelVideoWidget extends StatefulWidget {
  const ReelVideoWidget({
    super.key,
    required this.videoPath,
  });

  final String videoPath;

  @override
  State<ReelVideoWidget> createState() => _ReelVideoWidgetState();
}

class _ReelVideoWidgetState extends State<ReelVideoWidget> {
  VideoPlayerController? videoController;
  ChewieController? chewieController;
  bool _showControls = true;
  Timer? _hideControlsTimer;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeController();
  }

  @override
  void dispose() {
    videoController?.dispose();
    chewieController?.dispose();
    _hideControlsTimer?.cancel();
    super.dispose();
  }

  void _initializeController() {
    // ignore: deprecated_member_use
    videoController ??= VideoPlayerController.file (File( widget.videoPath))
        ..initialize().then((_) {
          setState(() => _isInitialized = true);
          _setUpChewieController();
        });
  }

  void _setUpChewieController() {
    chewieController = ChewieController(
      videoPlayerController: videoController!,
      autoPlay: false,
      looping: true,
      showControls: false,
      autoInitialize: true,
    );
    videoController!.addListener(() {
      if (!videoController!.value.isPlaying) {
        setState(() => _showControls = true); // Show controls when paused
      }
    });
  }

  void _togglePlayPause() {
    setState(() {
      if (videoController!.value.isPlaying) {
        videoController!.pause();
      } else {
        videoController!.play();
        _startHideControlsTimer();
      }
      _showControls = true;
    });
  }

  void _startHideControlsTimer() {
    _hideControlsTimer?.cancel(); // Cancel previous timer if any
    _hideControlsTimer = Timer(const Duration(seconds: 3), () {
      setState(() => _showControls = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key(widget.videoPath),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.1 && !_isInitialized) {
          _initializeController();
        } else if (info.visibleFraction == 0) {
          videoController?.pause();
        }
      },
      child: _isInitialized
          ? AspectRatio(
              aspectRatio: videoController!.value.aspectRatio,
              child: Stack(
                fit: StackFit.expand,
                alignment: Alignment.center,
                children: [
                  InkWell(
                    onTap: _togglePlayPause,
                    child: Chewie(controller: chewieController!),
                  ),
                  // Play/Pause button with fade effect
                  AnimatedOpacity(
                    opacity: _showControls ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 300),
                    child: IconButton(
                      icon: Icon(
                        videoController!.value.isPlaying
                            ? Icons.pause
                            : Icons.play_arrow,
                        color: Colors.white,
                        size: 50,
                      ),
                      onPressed: _togglePlayPause,
                    ),
                  ),
                  // Display the current video time at the bottom center
                  Positioned(
                    bottom: 10.0,
                    child: ValueListenableBuilder(
                      valueListenable: videoController!,
                      builder: (context, VideoPlayerValue value, child) {
                        final position = value.position;
                        final duration = value.duration;
                        return Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.black26,
                              borderRadius: BorderRadius.circular(25)),
                          child: AppTextWidget(
                            text:
                                "${position.inMinutes}:${(position.inSeconds % 60).toString().padLeft(2, '0')} / ${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          : const ReelLoadingListItem(),
    );
  }
}
