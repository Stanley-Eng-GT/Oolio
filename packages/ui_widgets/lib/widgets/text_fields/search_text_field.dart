import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../expaned_section.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({
    super.key,
    required this.onChange,
  });

  final ValueChanged<String> onChange;

  @override
  State<StatefulWidget> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;
  bool _showCancel = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {
        _showCancel = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            focusNode: _focusNode,
            controller: _controller,
            onChanged: widget.onChange,
            decoration: InputDecoration(
              hintText: S.of(context).search,
              prefixIcon: const Icon(
                Icons.search,
              ),
              fillColor: Colors.grey.shade400,
              filled: true,
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(16.0)),
                borderSide: BorderSide(width: 1.0, color: Colors.grey),
              ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(16.0)),
                borderSide: BorderSide(width: 1.0, color: Colors.grey),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 4.0,
        ),
        ExpandedSection(
          expand: _showCancel,
          child: TextButton(
            onPressed: () => _focusNode.unfocus(),
            child: Text(
              S.of(context).cancel,
            ),
          ),
        ),
      ],
    );
  }
}
