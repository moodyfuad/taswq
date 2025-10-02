import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/instance_manager.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:omni_video_player/omni_video_player.dart';
import 'package:taswq/utils/constants/colors.dart';

class VeedzPage extends StatefulWidget {
  const VeedzPage({super.key});

  @override
  State<VeedzPage> createState() => _VeedzPageState();
}

class _VeedzPageState extends State<VeedzPage> {
  static const List<String> links = [
    'https://www.youtube.com/shorts/RX-JpH54AiU',
    'https://www.youtube.com/shorts/rwL3jbeu9vY',
    'https://www.youtube.com/shorts/LR9ywuliWRU',
    'https://www.youtube.com/shorts/RgGOqoO18RI?feature=share',
    'https://www.youtube.com/shorts/2UFSUJNVxGY?feature=share',
    'https://www.youtube.com/shorts/uY-370cKsSQ?feature=share',
    'https://www.youtube.com/shorts/LsiCIoTcKyw?feature=share',
    'https://www.youtube.com/shorts/M6gFp9wOsPY?feature=share',
    'https://www.youtube.com/shorts/HVFTkE5_SHA',
  ];

  OmniPlaybackController? _controller;
  final _pageController = PageController(initialPage: 0);

  double _getTimeLineValue() {
    if (_controller == null) {
      return 0;
    }
    return _controller!.currentPosition.inMilliseconds /
        _controller!.duration.inMilliseconds;
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller?.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Get.size.aspectRatio;
    _controller?.addListener(() {
      setState(() {});
    });
    return Scaffold(
      body: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: Get.height, maxWidth: Get.width),
        child: Column(
          // mainAxisSize: ,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              flex: 1,
              child: Stack(
                alignment: AlignmentGeometry.center,
                children: [
                  Transform.scale(
                    scaleY: 1.2,
                    alignment: Alignment(0, 0),

                    // scale: 1.1,
                    filterQuality: FilterQuality.high,

                    child: OmniVideoPlayer(
                      callbacks: VideoPlayerCallbacks(
                        onControllerCreated: (controller) {
                          _controller = controller;
                          _controller!.play(useGlobalController: false);
                          setState(() {});
                        },
                        onFinished: () => _controller?.replay(),
                      ),

                      options: VideoPlayerConfiguration(
                        globalPlaybackControlSettings:
                            GlobalPlaybackControlSettings(
                              synchronizeMuteAcrossPlayers: false,
                              useGlobalPlaybackController: false,
                            ),
                        playerUIVisibilityOptions: PlayerUIVisibilityOptions(
                          showThumbnailAtStart: false,
                          customAspectRatioFullScreen: Get.size.aspectRatio,
                          controlsPersistenceDuration: const Duration(
                            milliseconds: 1,
                          ),
                          showCurrentTime: false,
                          showDurationTime: false,
                          enableExitFullscreenOnVerticalSwipe: false,
                          showFullScreenButton: false,
                          showLiveIndicator: false,
                          showMuteUnMuteButton: false,
                          showPlaybackSpeedButton: false,
                          showRemainingTime: true,
                          showSeekBar: true,
                          showSwitchVideoQuality: false,
                          showSwitchWhenOnlyAuto: false,

                          showVideoBottomControlsBar: false,
                          showGradientBottomControl: false,
                          fullscreenOrientation: Orientation.portrait,
                        ),
                        videoSourceConfiguration:
                            VideoSourceConfiguration.youtube(
                              videoUrl: Uri.parse(links[2]),
                            ).copyWith(autoPlay: true),
                        playerTheme: OmniVideoPlayerThemeData(
                          icons: VideoPlayerIconTheme(
                            // playPause: AnimatedIcons.,
                          ),
                          overlays: VideoPlayerOverlayTheme(
                            alpha: 0,
                            backgroundColor: Colors.transparent,
                          ),

                          labels: VideoPlayerLabelTheme(),
                          colors: VideoPlayerColorScheme(
                            menuTextSelected: Colors.transparent,
                            playPauseBackground: Colors.white.withValues(
                              alpha: 0,
                            ),
                            playPauseIcon: Colors.transparent,
                            active: Colors.transparent,
                            liveIndicator: Colors.transparent,
                            backgroundError: Colors.transparent,
                            icon: Colors.transparent,
                            inactive: Colors.transparent,
                            menuBackground: Colors.transparent,
                            menuIconSelected: Colors.transparent,
                            menuText: Colors.transparent,
                            backgroundThumbnail: Colors.transparent,
                            textDefault: Colors.transparent,
                            textError: Colors.white.withValues(
                              alpha: 0,
                              colorSpace: ColorSpace.displayP3,
                            ),
                            thumb: Colors.transparent,
                          ),
                        ),
                      ),
                    ),
                  ),

                  _controller != null && !_controller!.isPlaying
                      ? IconButton(
                          onPressed: () async => await _controller!.play(),
                          icon: Icon(
                            IconsaxPlusLinear.play,
                            color: Colors.white,
                            size: 40,
                          ),
                        )
                      : SizedBox(),
                  GestureDetector(
                    onTap: () async {
                      _controller != null && _controller!.isPlaying
                          ? await _controller?.pause(useGlobalController: false)
                          : await _controller?.play(useGlobalController: false);

                      setState(() {});
                    },
                    onDoubleTap: () async {
                      _controller != null && _controller!.isMuted
                          ? _controller?.unMute()
                          : _controller?.mute();

                      setState(() {});
                    },
                    child: Container(
                      height: Get.height,
                      width: Get.width,
                      color: Colors.transparent,
                    ),
                  ),
                  GestureDetector(
                    onHorizontalDragUpdate: (details) {
                      setState(() {
                        _controller!.seekTo(
                          Duration(
                            milliseconds:
                                (details.globalPosition.dx /
                                        Get.width *
                                        _controller!.duration.inMilliseconds)
                                    .ceil(),
                          ),
                        );
                        _controller!.play();
                      });
                    },
                    child: Align(
                      alignment: AlignmentGeometry.bottomCenter,

                      child: Directionality(
                        textDirection: TextDirection.ltr,
                        child: Container(
                          color: Colors.transparent,
                          // height: 20,
                          padding: EdgeInsets.symmetric(vertical: 15),
                          constraints: BoxConstraints(minHeight: 20),
                          child: LinearProgressIndicator(
                            minHeight: 5,
                            valueColor:
                                ColorTween(
                                  begin: XColors.electricMagenta,
                                  end: XColors.lumenIndigo,
                                ).animate(
                                  AlwaysStoppedAnimation(_getTimeLineValue()),
                                ),
                            stopIndicatorRadius: 10,
                            borderRadius: BorderRadius.circular(10),

                            backgroundColor: Colors.blueGrey,
                            stopIndicatorColor: const Color.fromARGB(
                              255,
                              255,
                              17,
                              0,
                            ),
                            value: _getTimeLineValue(),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentGeometry.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          ...List.generate(
                            4,
                            (i) => Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  (i == 0)
                                      ? IconsaxPlusLinear.like_1
                                      : (i == 1)
                                      ? IconsaxPlusLinear.dislike
                                      : (i == 2)
                                      ? IconsaxPlusLinear.message
                                      : Icons.share_rounded,
                                  size: 30,
                                  color: Colors.white,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  textDirection: TextDirection.ltr,
                                  (Random.secure().nextInt(100) + 50)
                                          .toString() +
                                      ' K',
                                  style: Get.textTheme.titleSmall!.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 20),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Container(
                color: Colors.black,
                child: Row(
                  // mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ...List.generate(
                      3,
                      (i) => CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.black,
                        child: Icon(
                          IconsaxPlusBold.add_square,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
