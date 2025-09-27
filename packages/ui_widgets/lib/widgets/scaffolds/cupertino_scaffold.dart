import 'package:flutter/cupertino.dart';

class CupertinoScaffold extends StatelessWidget {
  const CupertinoScaffold({
    super.key,
    required this.title,
    required this.body,
  });

  final Widget title;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            largeTitle: title,
          ),
          SliverFillRemaining(
            child: body,
          ),
        ],
      ),
    );
  }
}
