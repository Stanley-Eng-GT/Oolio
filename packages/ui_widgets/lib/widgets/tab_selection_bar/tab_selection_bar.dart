import 'package:flutter/material.dart';

class TabSelectionBar extends StatefulWidget {
  const TabSelectionBar({
    super.key,
    required this.tabs,
    required this.onItemSelected,
    this.tabAlignment = TabAlignment.center,
    this.isScrollable = false,
    this.indicator,
    this.indicatorSize,
  });

  final List<Tab> tabs;
  final ValueChanged<int> onItemSelected;
  final TabAlignment tabAlignment;
  final bool isScrollable;
  final Decoration? indicator;
  final TabBarIndicatorSize? indicatorSize;

  @override
  State<StatefulWidget> createState() => _TabSelectionBarState();
}

class _TabSelectionBarState extends State<TabSelectionBar>
    with TickerProviderStateMixin {
  late final TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: widget.tabs.length, vsync: this);
    _controller.addListener(() {
      widget.onItemSelected(_controller.index);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: _controller,
      isScrollable: widget.isScrollable,
      tabAlignment: widget.tabAlignment,
      tabs: widget.tabs,
      indicator: widget.indicator,
      indicatorSize: widget.indicatorSize ?? TabBarIndicatorSize.label,
    );
  }
}
