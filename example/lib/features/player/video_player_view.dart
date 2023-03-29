import 'dart:math';

import 'package:example/features/home/data/film_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';
import 'package:wakelock/wakelock.dart';

import '../../config/constants.dart';
import '../details/domain/film_details.dart';

class LandscapePlayerPage extends StatefulWidget {
  const LandscapePlayerPage(this.arguments, {super.key});

  final FilmDetails arguments;

  @override
  _LandscapePlayerPageState createState() => _LandscapePlayerPageState();
}

class _LandscapePlayerPageState extends State<LandscapePlayerPage> {
  late VideoPlayerController controller;
  final ValueNotifier<bool> overlayVisible = ValueNotifier(false);

  @override
  void initState() {
    super.initState();

    controller = VideoPlayerController.network(
      '${Consts.baseUrl}movies/${widget.arguments.id}/watch',
    )
      ..addListener(() => setState(() {}))
      ..initialize().then((_) => controller.play());

    setLandscape();
  }

  @override
  void dispose() {
    controller.dispose();
    setPortrait();
    super.dispose();
  }

  Future setLandscape() async {
    await SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [],
    );
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    await Wakelock.enable();
  }

  Future setPortrait() async {
    await SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [],
    );
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    await Wakelock.enable();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (overlayVisible.value) {
          overlayVisible.value = false;
          controller.play();
          return Future.value(false);
        }

        return Future.value(true);
      },
      child: FocusScope(
        autofocus: true,
        onKey: (node, event) {
          if (event.isKeyPressed(LogicalKeyboardKey.enter) &&
              !overlayVisible.value) {
            overlayVisible.value = true;
            controller.pause();
            return KeyEventResult.handled;
          }

          return KeyEventResult.ignored;
        },
        child: Material(
          child: Stack(
            children: [
              AspectRatio(
                aspectRatio: controller.value.aspectRatio,
                child: VideoPlayer(controller),
              ),
              ValueListenableBuilder(
                valueListenable: overlayVisible,
                builder: (context, visible, _) => visible
                    ? _PlayerOverlay(
                        film: widget.arguments,
                        controller: controller,
                      )
                    : const SizedBox.shrink(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _PlayerOverlay extends StatelessWidget {
  final FilmDetails film;
  final VideoPlayerController controller;

  const _PlayerOverlay({
    required this.film,
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DecoratedBox(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black,
                Colors.black87,
                Colors.black54,
                Colors.black38,
                Colors.black26,
                Colors.black12,
                Colors.transparent,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.0, 0.13, 0.34, 0.47, 0.56, 0.73, 1.0],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    film.filmTitle,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: ValueListenableBuilder(
              valueListenable: controller,
              builder: (context, state, _) {
                return _FocusIcon(
                  state.isPlaying ? CupertinoIcons.pause : CupertinoIcons.play,
                  size: 50,
                  autofocus: true,
                  onTap: () {
                    if (state.isPlaying) {
                      controller.pause();
                    } else {
                      controller.play();
                    }
                  },
                );
              },
            ),
          ),
        ),
        DecoratedBox(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black,
                Colors.black87,
                Colors.black54,
                Colors.black38,
                Colors.black26,
                Colors.black12,
                Colors.transparent,
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: [0.0, 0.13, 0.34, 0.47, 0.56, 0.93, 1.0],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Row(
              children: [
                _FocusIcon(
                  CupertinoIcons.arrow_turn_up_left,
                  onTap: () {
                    controller
                      ..play()
                      ..seekTo(
                        Duration(
                          seconds: max(
                            controller.value.position.inSeconds - 30,
                            0,
                          ),
                        ),
                      );
                  },
                ),
                const SizedBox(width: 20),
                _FocusIcon(
                  CupertinoIcons.arrow_turn_up_right,
                  onTap: () {
                    controller
                      ..play()
                      ..seekTo(
                        Duration(
                          seconds: min(
                            controller.value.position.inSeconds + 30,
                            controller.value.duration.inSeconds,
                          ),
                        ),
                      );
                  },
                ),
                const Spacer(),
                _QualityDrawer(
                  film.id,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _QualityDrawer extends ConsumerStatefulWidget {
  final int filmId;

  const _QualityDrawer(this.filmId);

  @override
  ConsumerState<_QualityDrawer> createState() => _QualityDrawerState();
}

class _QualityDrawerState extends ConsumerState<_QualityDrawer> {
  bool drawerVisible = false;
  String selectedQuality = 'auto';

  @override
  Widget build(BuildContext context) {
    final qualitiesFuture = ref.watch(filmQualitiesProvider(widget.filmId));

    return SizedOverflowBox(
      size: const Size(36, 36),
      child: Stack(
        fit: StackFit.expand,
        children: [
          _FocusIcon(
            CupertinoIcons.recordingtape,
            onTap: () {
              setState(() {
                drawerVisible = true;
              });
            },
          ),
          Positioned(
            bottom: 56,
            right: 0,
            child: SizedBox(
              width: 300,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: qualitiesFuture.when(
                    data: (qualities) {
                      return Row(
                        children: [
                          const Text('Video quality:'),
                          const SizedBox(
                            height: 20,
                          ),
                          for (var quality in qualities)
                            _FocusItem(
                              quality,
                              autofocus: qualities.indexOf(quality) == 0,
                              checked: quality == selectedQuality,
                              onTap: () {
                                setState(() {
                                  selectedQuality = quality;
                                });
                              },
                            )
                        ],
                      );
                    },
                    error: (err, trace) => const CircularProgressIndicator(
                      color: Colors.white,
                    ),
                    loading: () => const CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FocusItem extends StatefulWidget {
  final String text;
  final bool? checked;
  final bool? autofocus;
  final Function()? onTap;

  const _FocusItem(
    this.text, {
    this.checked,
    this.autofocus,
    this.onTap,
    super.key,
  });

  @override
  State<_FocusItem> createState() => _FocusItemState();
}

class _FocusItemState extends State<_FocusItem> {
  bool focused = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      autofocus: widget.autofocus ?? false,
      onTap: widget.onTap,
      onFocusChange: (newFocus) {
        setState(() {
          focused = newFocus;
        });
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
            border:
                Border.all(color: focused ? Colors.white : Colors.transparent),
            borderRadius: BorderRadius.circular(8.0)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              if (widget.checked ?? false)
                const Icon(
                  CupertinoIcons.check_mark,
                  size: 20,
                ),
              Expanded(
                child: Text(widget.text),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _FocusIcon extends StatefulWidget {
  final IconData icon;
  final bool? autofocus;
  final Function()? onTap;
  final double? size;

  const _FocusIcon(
    this.icon, {
    this.autofocus,
    this.onTap,
    this.size,
    super.key,
  });

  @override
  State<_FocusIcon> createState() => _FocusIconState();
}

class _FocusIconState extends State<_FocusIcon> {
  bool focused = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      autofocus: widget.autofocus ?? false,
      onTap: widget.onTap,
      onFocusChange: (newFocus) {
        setState(() {
          focused = newFocus;
        });
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border:
              Border.all(color: focused ? Colors.white : Colors.transparent),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            widget.icon,
            size: widget.size ?? 20,
          ),
        ),
      ),
    );
  }
}
