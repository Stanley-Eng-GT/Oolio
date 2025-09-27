class CountDownTimerHelper {
  const CountDownTimerHelper();

  String _formatHHMMSS(int seconds) {
    final hours = (seconds / 3600).truncate();
    seconds = (seconds % 3600).truncate();
    final minutes = (seconds / 60).truncate();

    final hoursStr = (hours).toString().padLeft(2, '0');
    final minutesStr = (minutes).toString().padLeft(2, '0');
    final secondsStr = (seconds % 60).toString().padLeft(2, '0');

    if (hours == 0) {
      return '$minutesStr:$secondsStr';
    }

    return '$hoursStr:$minutesStr:$secondsStr';
  }

  String getTimerText(Duration? controllerDuration, double controllerValue) {
    if (controllerDuration != null) {
      final duration = controllerDuration * controllerValue;
      return _formatHHMMSS(duration.inSeconds);
    } else {
      return '';
    }
  }
}
