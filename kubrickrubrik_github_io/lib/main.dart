import 'dart:ui';

// import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:kubrickrubrik_github_io/gen/assets.gen.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Material(
        child: App(),
      ),
    );
  }
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final scrollController = ScrollController();
  var isCollapse = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.addListener(() {
        if (scrollController.offset > 50 && !isCollapse) {
          isCollapse = true;
          setState(() {});
        } else if (scrollController.offset < 10 && isCollapse) {
          isCollapse = false;
          setState(() {});
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF29363C),
            Color(0xFF131A1D),
          ],
        ),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 1,
              child: Assets.images.mainBanner.image(
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
              child: const DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.black12,
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: ListView(
              controller: scrollController,
              shrinkWrap: true,
              padding: const EdgeInsets.only(bottom: 100),
              children: [
                SizedBox(
                  height: MediaQuery.sizeOf(context).height / 2,
                  child: const Flex(
                    direction: Axis.horizontal,
                    children: [
                      Spacer(),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Mithri',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 50,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              'App Development',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeOut,
                  height: !isCollapse ? MediaQuery.sizeOf(context).height / 2 : 100,
                ),
                // Video
                const Divider(
                  color: Colors.black,
                ),

                SizedBox(
                  height: 600,
                  child: Flex(
                    direction: Axis.horizontal,
                    children: [
                      const Spacer(),
                      MediaPlayer(
                        source: Assets.media.ft,
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.black,
                ),
                // Video
                SizedBox(
                  height: 600,
                  child: Flex(
                    direction: Axis.horizontal,
                    children: [
                      const Spacer(),
                      MediaPlayer(
                        source: Assets.media.fl,
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                const Divider(
                  color: Colors.black,
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MediaPlayer extends StatefulWidget {
  final String source;
  final bool isAsset;
  const MediaPlayer({super.key, required this.source, this.isAsset = true});

  @override
  State<MediaPlayer> createState() => _MediaPlayerState();
}

class _MediaPlayerState extends State<MediaPlayer> {
  late VideoPlayerController _controller;
  bool onHover = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
      widget.source,
    )..initialize().then((_) {
        setState(() {});
      });
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      onHover: (value) {
        if (onHover != value) {
          onHover = value;
          setState(() {});
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
        height: _controller.value.isPlaying ? 600 : 400,
        child: AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: _controller.value.isInitialized
              ? Stack(
                  children: [
                    AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    ),
                    AnimatedOpacity(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease,
                      opacity: onHover || !_controller.value.isPlaying ? 1 : 0,
                      child: Center(
                        child: FloatingActionButton(
                          onPressed: () {},
                          child: Icon(
                            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        if (_controller.value.isPlaying) {
                          _controller.pause();
                        } else {
                          _controller.play();
                        }
                        setState(() {});
                      },
                      child: Container(),
                    ),
                  ],
                )
              : Container(),
        ),
      ),
    );
  }
}
