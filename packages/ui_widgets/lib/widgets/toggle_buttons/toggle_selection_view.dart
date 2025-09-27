import 'package:flutter/material.dart';
import 'package:ui_widgets/theme/gaps.dart';
import 'package:ui_widgets/widgets/toggle_buttons/toggle_selection_model.dart';

class ToggleSelectionView<T> extends StatefulWidget {
  const ToggleSelectionView({
    super.key,
    required this.selections,
    this.onPressed,
  });

  final ValueChanged<T>? onPressed;
  final List<ToggleSelectionModel<T>> selections;

  @override
  State<StatefulWidget> createState() => _ToggleSelectionViewState<T>();
}

class _ToggleSelectionViewState<T> extends State<ToggleSelectionView<T>> {
  late List<ToggleSelectionModel<T>> selections;

  @override
  void initState() {
    super.initState();
    assert(widget.selections.isNotEmpty);
    selections = widget.selections
        .asMap()
        .entries
        .map((entry) => entry.value.copyWith(isSelected: entry.key == 0))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: ToggleButtons(
          isSelected: selections.map((e) => e.isSelected).toList(),
          onPressed: onPressed,
          children: selections
              .map((e) => Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: Gaps.spacing8, vertical: Gaps.spacing4),
                    child: Text(e.label),
                  ))
              .toList()),
    );
  }

  void onPressed(int index) {
    final selectedType = selections[index].type;
    widget.onPressed?.call(selectedType);
    setState(() {
      selections = selections
          .map((e) => e.copyWith(isSelected: e.type == selectedType))
          .toList();
    });
  }
}
