import 'package:cached_video_player/cached_video_player.dart';
import 'package:flutter/material.dart';

/// Renders [VideoPlayer] with [BoxFit] configurations.
class FlickNativeVideoPlayer extends StatelessWidget {
  const FlickNativeVideoPlayer({
    Key key,
    this.fit,
    this.aspectRatioWhenLoading,
    @required this.cachedVideoPlayerController,
  }) : super(key: key);

  final BoxFit fit;
  final double aspectRatioWhenLoading;
  final CachedVideoPlayerController cachedVideoPlayerController;

  @override
  Widget build(BuildContext context) {
    CachedVideoPlayer cachedVideoPlayer = CachedVideoPlayer(cachedVideoPlayerController);

    double videoHeight = cachedVideoPlayerController?.value?.size?.height;
    double videoWidth = cachedVideoPlayerController?.value?.size?.width;

    return LayoutBuilder(
      builder: (context, size) {
        double aspectRatio = (size.maxHeight == double.infinity ||
                size.maxWidth == double.infinity)
            ? cachedVideoPlayerController?.value?.initialized == true
                ? cachedVideoPlayerController?.value?.aspectRatio
                : aspectRatioWhenLoading
            : size.maxWidth / size.maxHeight;

        return AspectRatio(
          aspectRatio: aspectRatio,
          child: FittedBox(
            fit: fit,
            child: cachedVideoPlayerController?.value?.initialized == true
                ? Container(
                    height: videoHeight,
                    width: videoWidth,
                    child: cachedVideoPlayer,
                  )
                : Container(),
          ),
        );
      },
    );
  }
}
