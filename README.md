# cachedflickvideoplayer
Cachedflickvideoplayer is a video player for flutter. It combines the codes of the plugins 'flick_video_player' and 'cached_video_player' to have a control panel and a caching of the played videos.

# Getting Started
- First, add 'cachedflickvideoplayer' as a dependency in your pubspec.yaml file.
- Follow the Android and iOS configuration steps of the official video_player package.

# Features
- Supports caching
- Double tap to seek video.
- On video tap play/pause, mute/unmute, or perform any action on video.
- Auto hide controls.
- Custom animations.
- Custom controls for normal and fullscreen.
- Auto-play list of videos.

# Installation
- Add the following dependencies in your pubspec.yaml file of your flutter project :
cachedflickvideoplayer:
    git:
      url: https://github.com/elgsylvain85/cachedflickvideoplayer.git

# How to use
import 'package:cachedflickvideoplayer/cached_video_player.dart';
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
  FlickManager flickManager;

  ViewPage() {
    flickManager = initVideo();
  }

  @override
  _ViewPageState createState() => _ViewPageState();

  FlickManager initVideo() {
    return FlickManager(
      cachedVideoPlayerController: CachedVideoPlayerController.network(
          'https://media.istockphoto.com/videos/blurred-motion-of-people-in-restaurant-blur-background-video-id1190840021'),
    );
  }
}

class _ViewPageState extends State<ViewPage> {
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
                      flickManager: widget.flickManager,
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
    widget.flickManager.dispose();
  }
}

# Example
Please run the app in the example/ folder to start playing!