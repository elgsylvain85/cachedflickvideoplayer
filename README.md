# cachedflickvideoplayer
    Cached Flick Video Player is a video player for flutter. It combines both: The flick_video_player plugin for the base architecture, own set of UI and The cached_video_player plugin for cache supporting.

# Getting Started
    Install the last version of plugin. Follow example to use correctly. Refer to flick_video_player plugin for deep use because they have the same logic except cached_video_player instead video_player.

# Features
    Same features than flick_video_player 0.1.1 plugin in addition to caching whose:
        Custom controls for normal and fullscreen...

# Example
    Please run the app in the example/ folder to start playing!

# Installation
    Add the following dependencies in your pubspec.yaml file of your flutter project.

        cachedflickvideoplayer: <latest_version>

# How to use
    Create a FlickManager and pass the manager to FlickVideoPlayer, make sure to dispose FlickManager after use.

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
