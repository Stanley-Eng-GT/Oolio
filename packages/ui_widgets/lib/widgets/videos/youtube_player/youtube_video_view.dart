import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui_widgets/theme/my_plus_colors.dart';
import 'package:ui_widgets/widgets/progress/loading_indicator/loading_indicator.dart';
import 'package:ui_widgets/widgets/videos/youtube_player/src/player/youtube_player.dart';
import 'package:ui_widgets/widgets/videos/youtube_player/src/utils/youtube_player_controller.dart';
import 'package:ui_widgets/widgets/videos/youtube_player/src/utils/youtube_player_flags.dart';
import 'package:ui_widgets/widgets/videos/youtube_player/src/widgets/widgets.dart';

class YoutubeVideoView extends StatefulWidget {
  const YoutubeVideoView({
    super.key,
    required this.videoId,
    this.onEnded,
  });
  final String videoId;
  final VoidCallback? onEnded;

  @override
  State<YoutubeVideoView> createState() => _YoutubeVideoViewState();
}

class _YoutubeVideoViewState extends State<YoutubeVideoView> {
  late final YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: const YoutubePlayerFlags(autoPlay: true),
    );
  }

  @override
  void didUpdateWidget(covariant YoutubeVideoView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.videoId != widget.videoId) {
      _controller.load(widget.videoId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
        onExitFullScreen: () {
          SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
        },
        player: YoutubePlayer(
          controller: _controller,
          bufferIndicator: const LoadingIndicator(),
          progressColors: ProgressBarColors(
            backgroundColor: Theme.of(context).colorScheme.onSecondary,
            playedColor: MyPLUSColor.youtube,
            bufferedColor: MyPLUSColor.secondary5,
            handleColor: MyPLUSColor.youtube,
          ),
          onEnded: (_) => widget.onEnded?.call(),
        ),
        builder: (context, player) {
          return player;
        });
  }
}
