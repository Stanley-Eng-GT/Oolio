import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:ui_widgets/widgets/progress/loading_indicator/loading_indicator.dart';
import 'package:ui_widgets/widgets/web/youtube_video_web_view_constants.dart';

class YoutubeVideoWebView extends StatefulWidget {
  const YoutubeVideoWebView({
    super.key,
    required this.url,
  });

  final String url;

  @override
  State<YoutubeVideoWebView> createState() => _YoutubeVideoWebViewState();
}

class _YoutubeVideoWebViewState extends State<YoutubeVideoWebView> {
  bool _showLoadingIndicator = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InAppWebView(
            initialUrlRequest: URLRequest(
              url: WebUri(widget.url),
            ),
            initialSettings: InAppWebViewSettings(
                isInspectable: kDebugMode,
                mediaPlaybackRequiresUserGesture: false,
                iframeAllowFullscreen: true),
            onWebViewCreated: (controller) {},
            onLoadStart: (controller, url) => _toggleLoadingIndicator(true),
            onLoadStop: (controller, url) async {
              _toggleLoadingIndicator(false);
              await controller.evaluateJavascript(
                  source: YoutubeVideoWebViewConstants.javaScriptMuteOffSource);
            }),
        if (_showLoadingIndicator)
          const Align(alignment: Alignment.center, child: LoadingIndicator()),
      ],
    );
  }

  void _toggleLoadingIndicator(bool newVal) {
    setState(() {
      _showLoadingIndicator = newVal;
    });
  }
}
