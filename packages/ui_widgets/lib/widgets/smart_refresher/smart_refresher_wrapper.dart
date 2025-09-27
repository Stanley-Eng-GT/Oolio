import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui_widgets/widgets/smart_refresher/pull_to_refresh.dart';

class _SmartRefresherWrapperConstants {
  static const int refreshDelayInMilliseconds = 500;
}

class SmartRefresherWrapper extends StatefulWidget {
  const SmartRefresherWrapper({
    super.key,
    required this.child,
    required this.onRefresh,
  });

  final Widget child;
  final Future<void> Function() onRefresh;

  @override
  State<SmartRefresherWrapper> createState() => _SmartRefresherWrapperState();
}

class _SmartRefresherWrapperState extends State<SmartRefresherWrapper>
    with TickerProviderStateMixin {
  late final RefreshController _refreshController;

  @override
  void initState() {
    super.initState();
    _refreshController = RefreshController();
  }

  @override
  void dispose() {
    _refreshController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: _refreshController,
      header: const WaterDropHeader(),
      onRefresh: _onRefresh,
      child: widget.child,
    );
  }

  void _onRefresh() async {
    HapticFeedback.mediumImpact();
    await widget.onRefresh();
    await Future.delayed(const Duration(
        milliseconds:
            _SmartRefresherWrapperConstants.refreshDelayInMilliseconds));
    _refreshController.refreshCompleted();
  }
}
