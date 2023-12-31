import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:video_box/video_box.dart';

import '../globals.dart';

class ListVideo extends StatefulWidget {
  const ListVideo({Key? key}) : super(key: key);

  @override
  createState() => _ListVideoState();
}

class _ListVideoState extends State<ListVideo> {
  ScrollController controller = ScrollController();
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
      appBar: AppBar(title: const Text('list video')),
      body: ListView(
        controller: controller,
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
