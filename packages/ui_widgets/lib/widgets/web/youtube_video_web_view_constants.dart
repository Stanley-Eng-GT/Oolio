class YoutubeVideoWebViewConstants {
  static const String javaScriptMuteOffSource = """
            var video = document.querySelector('video');
            if (video) {
              video.muted = false;
              video.play();
            }
          """;
}
