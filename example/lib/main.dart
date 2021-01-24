import 'package:cached_video_player/cached_video_player.dart';
import 'package:cachedflickvideoplayer/controls/flick_landscape_controls.dart';
import 'package:cachedflickvideoplayer/controls/flick_video_with_controls.dart';
import 'package:cachedflickvideoplayer/flick_video_player.dart';
import 'package:cachedflickvideoplayer/manager/flick_manager.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: 'Cachedflickvideoplayer demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ViewPage(),
    ));

class ViewPage extends StatefulWidget {
  @override
  _ViewPageState createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  CachedVideoPlayerController cachedVideoPlayerController;

  _ViewPageState() {
    this.cachedVideoPlayerController = initVideo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: <Widget>[
        Card(
          margin: const EdgeInsets.fromLTRB(20, 20, 20, 100),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    padding: const EdgeInsets.all(8),
                    height: 300,
                    child: FlickVideoPlayer(
                      flickManager: FlickManager(
                        cachedVideoPlayerController:
                            this.cachedVideoPlayerController,
                      ),
                      flickVideoWithControlsFullscreen: FlickVideoWithControls(
                        videoFit: BoxFit.contain,
                        controls: FlickLandscapeControls(),
                      ),
                    )),
              ]),
        ),
      ],
    ));
  }

  @override
  void dispose() {
    super.dispose();
    this.cachedVideoPlayerController?.dispose();
  }

  CachedVideoPlayerController initVideo() {
    return CachedVideoPlayerController.network(
        'https://media.istockphoto.com/videos/blurred-motion-of-people-in-restaurant-blur-background-video-id1190840021');
  }
}
