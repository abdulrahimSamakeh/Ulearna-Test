// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../resource/image_manger.dart';

class MainImageWidget extends StatelessWidget {
  const MainImageWidget({
    super.key,
    required this.imageUrl,
    this.placeholderUrl,
    this.fit,
    this.width,
    this.height,
    this.shape,
    this.borderRadius,
  });
  final String imageUrl;
  final String? placeholderUrl;
  final BoxFit? fit;
  final double? width;
  final double? height;
  final BoxShape? shape;

  final BorderRadiusGeometry? borderRadius;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: fit ?? BoxFit.fill,
      width: width,
      height: height,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.fill,
          ),
        ),
      ), 
      errorWidget: (context, url, error) => Image.asset(
        AppImageManger.errorHolderImage,
        fit: fit ?? BoxFit.fill,
      ),
      fadeInCurve: Curves.easeIn,
      fadeOutCurve: Curves.easeOut,
      progressIndicatorBuilder: (context, url, progress) {
        return placeholderUrl == null || placeholderUrl!.isEmpty
            ? Image.asset(
                AppImageManger.placeHolderImage,
                fit: fit ?? BoxFit.fill,
              )
            :
            //TODO:
             Image.asset(
                AppImageManger.placeHolderImage,
                fit: fit ?? BoxFit.fill,
              );
      },
      placeholderFadeInDuration: const Duration(seconds: 1),
    );
  }
}
