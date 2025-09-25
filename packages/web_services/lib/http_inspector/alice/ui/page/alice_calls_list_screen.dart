import 'package:flutter/material.dart';

import '../../core/alice_core.dart';
import '../../helper/alice_alert_helper.dart';
import '../../model/alice_http_call.dart';
import '../../model/alice_menu_item.dart';
import '../../model/alice_sort_option.dart';
import '../../utils/alice_constants.dart';
import '../../utils/alice_scroll_behavior.dart';
import '../../utils/alice_theme.dart';
import '../widget/alice_call_list_item_widget.dart';
import 'alice_call_details_screen.dart';
import 'alice_stats_screen.dart';

class AliceCallsListScreen extends StatefulWidget {
  final AliceCore _aliceCore;

  const AliceCallsListScreen(this._aliceCore, {super.key});

  @override
  State<StatefulWidget> createState() {
    return _AliceCallsListScreenState();
  }
}

class _AliceCallsListScreenState extends State<AliceCallsListScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _queryTextEditingController =
      TextEditingController();
  final List<AliceMenuItem> _menuItems = [];
  final ScrollController _scrollController = ScrollController();

  AliceSortOption? _sortOption = AliceSortOption.time;
  bool _sortAscending = false;
  bool _searchEnabled = false;
  bool isAndroidRawLogsEnabled = false;

  AliceCore get aliceCore => widget._aliceCore;

  _AliceCallsListScreenState() {
    _menuItems.addAll([
      AliceMenuItem('Sort', Icons.sort),
      AliceMenuItem('Delete', Icons.delete),
      AliceMenuItem('Stats', Icons.insert_chart),
      AliceMenuItem('Save', Icons.save),
    ]);
  }

  @override
  void dispose() {
    super.dispose();
    _queryTextEditingController.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection:
          widget._aliceCore.directionality ?? Directionality.of(context),
      child: Theme(
        data: ThemeData(
          colorScheme: AliceTheme.getColorScheme(),
        ),
        child: Scaffold(
          appBar: AppBar(
            title: _searchEnabled ? _buildSearchField() : _buildTitleWidget(),
            actions: _buildActionWidgets,
          ),
          body: _buildCallsListWrapper(),
        ),
      ),
    );
  }

  List<Widget> get _buildActionWidgets => [
        _buildSearchButton(),
        _buildMenuButton(),
      ];

  Widget _buildSearchButton() {
    return IconButton(
      icon: const Icon(Icons.search),
      onPressed: _onSearchClicked,
    );
  }

  void _onSearchClicked() {
    setState(() {
      _searchEnabled = !_searchEnabled;
      if (!_searchEnabled) {
        _queryTextEditingController.text = '';
      }
    });
  }

  Widget _buildMenuButton() {
    return PopupMenuButton<AliceMenuItem>(
      onSelected: _onMenuItemSelected,
      itemBuilder: (BuildContext context) {
        return _menuItems.map((AliceMenuItem item) {
          return PopupMenuItem<AliceMenuItem>(
            value: item,
            child: Row(
              children: [
                Icon(
                  item.iconData,
                  color: AliceConstants.lightRed,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                ),
                Text(item.title),
              ],
            ),
          );
        }).toList();
      },
    );
  }

  Widget _buildTitleWidget() {
    return const Text('Alice');
  }

  Widget _buildSearchField() {
    return TextField(
      controller: _queryTextEditingController,
      autofocus: true,
      decoration: InputDecoration(
        hintText: 'Search http request...',
        hintStyle: TextStyle(fontSize: 16, color: AliceConstants.grey),
        border: InputBorder.none,
      ),
      style: const TextStyle(fontSize: 16),
      onChanged: _updateSearchQuery,
    );
  }

  void _onMenuItemSelected(AliceMenuItem menuItem) {
    if (menuItem.title == 'Sort') {
      _showSortDialog();
    }
    if (menuItem.title == 'Delete') {
      _showRemoveDialog();
    }
    if (menuItem.title == 'Stats') {
      _showStatsScreen();
    }
    if (menuItem.title == 'Save') {}
  }

  Widget _buildCallsListWrapper() {
    return StreamBuilder<List<AliceHttpCall>>(
      stream: aliceCore.callsSubject,
      builder: (context, snapshot) {
        var calls = snapshot.data ?? [];
        final query = _queryTextEditingController.text.trim();
        if (query.isNotEmpty) {
          calls = calls
              .where(
                (call) =>
                    call.endpoint.toLowerCase().contains(query.toLowerCase()),
              )
              .toList();
        }
        if (calls.isNotEmpty) {
          return _buildCallsListWidget(calls);
        } else {
          return _buildEmptyWidget();
        }
      },
    );
  }

  Widget _buildEmptyWidget() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 32),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              color: AliceConstants.orange,
            ),
            const SizedBox(height: 6),
            const Text(
              'There are no calls to show',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 12),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '• Check if you send any http request',
                  style: TextStyle(fontSize: 12),
                  textAlign: TextAlign.center,
                ),
                Text(
                  '• Check your Alice configuration',
                  style: TextStyle(fontSize: 12),
                  textAlign: TextAlign.center,
                ),
                Text(
                  '• Check search filters',
                  style: TextStyle(fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCallsListWidget(List<AliceHttpCall> calls) {
    final callsSorted = List<AliceHttpCall>.of(calls);
    switch (_sortOption) {
      case AliceSortOption.time:
        if (_sortAscending) {
          callsSorted.sort(
            (call1, call2) => call1.createdTime.compareTo(call2.createdTime),
          );
        } else {
          callsSorted.sort(
            (call1, call2) => call2.createdTime.compareTo(call1.createdTime),
          );
        }
      case AliceSortOption.responseTime:
        if (_sortAscending) {
          callsSorted
            ..sort()
            ..sort(
              (call1, call2) =>
                  call1.response?.time.compareTo(call2.response!.time) ?? -1,
            );
        } else {
          callsSorted.sort(
            (call1, call2) =>
                call2.response?.time.compareTo(call1.response!.time) ?? -1,
          );
        }
      case AliceSortOption.responseCode:
        if (_sortAscending) {
          callsSorted.sort(
            (call1, call2) =>
                call1.response?.status?.compareTo(call2.response!.status!) ??
                -1,
          );
        } else {
          callsSorted.sort(
            (call1, call2) =>
                call2.response?.status?.compareTo(call1.response!.status!) ??
                -1,
          );
        }
      case AliceSortOption.responseSize:
        if (_sortAscending) {
          callsSorted.sort(
            (call1, call2) =>
                call1.response?.size.compareTo(call2.response!.size) ?? -1,
          );
        } else {
          callsSorted.sort(
            (call1, call2) =>
                call2.response?.size.compareTo(call1.response!.size) ?? -1,
          );
        }
      case AliceSortOption.endpoint:
        if (_sortAscending) {
          callsSorted
              .sort((call1, call2) => call1.endpoint.compareTo(call2.endpoint));
        } else {
          callsSorted
              .sort((call1, call2) => call2.endpoint.compareTo(call1.endpoint));
        }

      case null:
    }

    return ScrollConfiguration(
      behavior: AliceScrollBehavior(),
      child: ListView.builder(
        itemCount: callsSorted.length,
        itemBuilder: (context, index) {
          return AliceCallListItemWidget(
            callsSorted[index],
            _onListItemClicked,
          );
        },
      ),
    );
  }

  void _onListItemClicked(AliceHttpCall call) {
    Navigator.push<void>(
      widget._aliceCore.getContext()!,
      MaterialPageRoute(
        builder: (context) => AliceCallDetailsScreen(call, widget._aliceCore),
      ),
    );
  }

  void _showRemoveDialog() {
    AliceAlertHelper.showAlert(
      context,
      'Delete calls',
      'Do you want to delete http calls?',
      firstButtonTitle: 'No',
      firstButtonAction: () => <String, dynamic>{},
      secondButtonTitle: 'Yes',
      secondButtonAction: _removeCalls,
    );
  }

  void _removeCalls() {
    aliceCore.removeCalls();
  }

  void _showStatsScreen() {
    Navigator.push<void>(
      aliceCore.getContext()!,
      MaterialPageRoute(
        builder: (context) => AliceStatsScreen(widget._aliceCore),
      ),
    );
  }

  void _updateSearchQuery(String query) {
    setState(() {});
  }

  void _showSortDialog() {
    showDialog<void>(
      context: context,
      builder: (BuildContext buildContext) {
        return Theme(
          data: ThemeData(
            brightness: Brightness.light,
          ),
          child: AlertDialog(
            title: const Text('Select filter'),
            content: StatefulBuilder(
              builder: (context, setState) {
                return Wrap(
                  children: [
                    ...AliceSortOption.values.map(
                      (AliceSortOption sortOption) =>
                          RadioListTile<AliceSortOption>(
                        title: Text(sortOption.name),
                        value: sortOption,
                        groupValue: _sortOption,
                        onChanged: (AliceSortOption? value) {
                          setState(() {
                            _sortOption = value;
                          });
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Descending'),
                        Switch(
                          value: _sortAscending,
                          onChanged: (value) {
                            setState(() {
                              _sortAscending = value;
                            });
                          },
                          activeTrackColor: Colors.grey,
                          activeColor: Colors.white,
                        ),
                        const Text('Ascending'),
                      ],
                    ),
                  ],
                );
              },
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  sortCalls();
                },
                child: const Text('Use filter'),
              ),
            ],
          ),
        );
      },
    );
  }

  void sortCalls() {
    setState(() {});
  }
}
