import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'gradient.dart';

class MovieTrailer extends StatefulWidget {
  const MovieTrailer({
    Key? key,
    required this.trailerLink,
  }) : super(key: key);

  final String trailerLink;

  @override
  State<MovieTrailer> createState() => _MovieTrailerState();
}

class _MovieTrailerState extends State<MovieTrailer> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
      widget.trailerLink,
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
    )
      ..setLooping(true)
      ..setVolume(0)
      ..addListener(() {
        setState(() {});
      })
      ..initialize()
      ..play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: _controller.value.aspectRatio,
      child: GradientWidget(child: VideoPlayer(_controller)),
    );
  }
}
