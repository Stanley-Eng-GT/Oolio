import 'package:collection/collection.dart' show IterableExtension;
import 'package:flutter/material.dart';

import '../../core/alice_core.dart';
import '../../model/alice_http_call.dart';
import '../../utils/alice_constants.dart';
import '../../utils/alice_theme.dart';
import '../widget/alice_call_error_widget.dart';
import '../widget/alice_call_overview_widget.dart';
import '../widget/alice_call_request_widget.dart';
import '../widget/alice_call_response_widget.dart';

class AliceCallDetailsScreen extends StatefulWidget {
  final AliceHttpCall call;
  final AliceCore core;

  const AliceCallDetailsScreen(this.call, this.core, {super.key});

  @override
  State<StatefulWidget> createState() {
    return _AliceCallDetailsScreenState();
  }
}

class _AliceCallDetailsScreenState extends State<AliceCallDetailsScreen>
    with SingleTickerProviderStateMixin {
  AliceHttpCall get call => widget.call;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: widget.core.directionality ?? Directionality.of(context),
      child: Theme(
        data: ThemeData(
          colorScheme: AliceTheme.getColorScheme(),
        ),
        child: StreamBuilder<List<AliceHttpCall>>(
          stream: widget.core.callsSubject,
          initialData: [widget.call],
          builder: (context, callsSnapshot) {
            if (callsSnapshot.hasData) {
              final call = callsSnapshot.data!.firstWhereOrNull(
                (snapshotCall) => snapshotCall.id == widget.call.id,
              );
              if (call != null) {
                return _buildMainWidget();
              } else {
                return _buildErrorWidget();
              }
            } else {
              return _buildErrorWidget();
            }
          },
        ),
      ),
    );
  }

  Widget _buildMainWidget() {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            indicatorColor: AliceConstants.lightRed,
            tabs: _getTabBars(),
            isScrollable: true,
            tabAlignment: TabAlignment.start,
          ),
          title: const Text('Alice - HTTP Call Details'),
        ),
        body: TabBarView(
          children: _getTabBarViewList(),
        ),
      ),
    );
  }

  Widget _buildErrorWidget() {
    return const Center(child: Text('Failed to load data'));
  }

  List<Widget> _getTabBars() {
    return <Widget>[
      const Tab(icon: Icon(Icons.info_outline), text: 'Overview'),
      const Tab(icon: Icon(Icons.arrow_upward), text: 'Request'),
      const Tab(icon: Icon(Icons.arrow_downward), text: 'Response'),
      const Tab(
        icon: Icon(Icons.warning),
        text: 'Error',
      ),
    ];
  }

  List<Widget> _getTabBarViewList() {
    return [
      AliceCallOverviewWidget(widget.call),
      AliceCallRequestWidget(widget.call),
      AliceCallResponseWidget(widget.call),
      AliceCallErrorWidget(widget.call),
    ];
  }
}
