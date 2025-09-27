import 'package:flutter/material.dart';
import 'package:ui_widgets/theme/gaps.dart';

class LandingScaffold extends StatelessWidget {
  const LandingScaffold({
    super.key,
    required this.titleLabel,
    required this.body,
    this.actions,
  });

  final String titleLabel;
  final List<Widget>? actions;
  final Widget? body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titleLabel),
        leading: IconButton(
            padding: const EdgeInsets.all(Gaps.spacing16),
            icon: Icon(
              Icons.menu,
              color: Theme.of(context).colorScheme.primary,
            ),
            onPressed: () => Scaffold.of(context).openDrawer()),
        actions: actions,
      ),
      body: SafeArea(
        top: false,
        bottom: false,
        child: body ?? const SizedBox.shrink(),
      ),
      // drawers: const SppDrawer(),
    );
  }
}
