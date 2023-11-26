# video_box

Play video in Flutter

note:
* Only tested on android

android: `<project root>/android/app/src/main/AndroidManifest.xml`:
```
<uses-permission android:name="android.permission.INTERNET" />
```

ios: `<project root>/ios/Runner/Info.plist`:
```
<key>NSAppTransportSecurity</key>
<dict>
  <key>NSAllowsArbitraryLoads</key>
  <true/>
</dict>
```

## Usage
```dart
import 'package:flutter/material.dart';
import 'package:video_box/video.controller.dart';
import 'package:video_box/video_box.dart';
import 'package:video_player/video_player.dart';

class ListVideo extends StatefulWidget {
  @override
  _ListVideoState createState() => _ListVideoState();
}

class _ListVideoState extends State<ListVideo> {
  List<VideoController> vcs = [];

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < 4; i++) {
      vcs.add(VideoController(source: VideoPlayerController.network(src1))
        ..initialize());
    }
  }

  @override
  void dispose() {
    for (var vc in vcs) {
      vc.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('list video'),
      ),
      body: ListView(
        children: <Widget>[
          for (var vc in vcs)
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: VideoBox(controller: vc),
              ),
            ),
        ],
      ),
    );
  }
}
```

Catch the error during initialize
```dart
  vc = VideoController(
    source: VideoPlayerController.network('https://examole.com/a.mp4'),
  )
    ..addInitializeErrorListenner((e) {
      print('[video box init] error: ' + e.message);
    })
    ..initialize().then((e) {
      if (e != null) {
        print('[video box init] error: ' + e.message);
      } else {
        print('[video box init] success');
      }
    });
```

For details, see /example or source code.

show:
![](https://i.loli.net/2019/07/07/5d22104b8690b94290.jpg)# enhanced_video_box
