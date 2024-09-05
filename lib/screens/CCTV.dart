import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class CCTV extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final name = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_new),
              ),
              Flexible(
                flex: 1,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    name,
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.transparent,
                  )),
            ],
          ),
          Expanded(
            child: Container(
              color: Colors.black,
              child: Center(child: VideoPlayerScreen()),
            ),
          )
        ],
      ),
    ));
  }
}

class VideoPlayerScreen extends StatefulWidget {
  VideoPlayerScreen() : super();

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    _controller = VideoPlayerController.asset("assets/cctvVideo.mp4");
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          _controller.play();
          return AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
