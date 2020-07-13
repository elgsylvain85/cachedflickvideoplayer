import 'package:cached_video_player/cached_video_player.dart';
import 'package:cachedflickvideoplayer/cachedflickvideoplayer.dart';
import 'package:cachedflickvideoplayer/controls/flick_landscape_controls.dart';
import 'package:cachedflickvideoplayer/controls/flick_video_with_controls.dart';
import 'package:cachedflickvideoplayer/manager/flick_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class DefaultPlayer extends StatefulWidget {
  DefaultPlayer({Key key}) : super(key: key);

  @override
  _DefaultPlayerState createState() => _DefaultPlayerState();
}

class _DefaultPlayerState extends State<DefaultPlayer> {
  FlickManager flickManager;

  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      cachedVideoPlayerController:
        CachedVideoPlayerController.network('https://media.istockphoto.com/videos/blurred-motion-of-people-in-restaurant-blur-background-video-id1190840021'),
    );
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: FlickVideoPlayer(
        flickManager: flickManager,
        flickVideoWithControlsFullscreen: FlickVideoWithControls(
          videoFit: BoxFit.contain,
          controls: FlickLandscapeControls(),
        ),
      ),
    );
  }
}
