import 'package:cachedflickvideoplayer/widgets/helpers/progress_bar/progress_bar_settings.dart';
import 'package:flutter/material.dart';

import 'flick_portrait_controls.dart';

/// Default landscape controls.
class FlickLandscapeControls extends StatelessWidget {
  const FlickLandscapeControls({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlickPortraitControls(
      fontSize: 14,
      iconSize: 30,
      progressBarSettings: FlickProgressBarSettings(
        height: 5,
      ),
    );
  }
}
