import 'package:flutter/material.dart';

class MyTable extends StatelessWidget {
  const MyTable({
    super.key,
    required this.header,
    required this.rows,
    this.footer,
    this.separator,
    this.physics,
    this.padding,
  });
  final Widget header;
  final List<Widget> rows;
  final Widget? footer;
  final Widget? separator;
  final ScrollPhysics? physics;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: SingleChildScrollView(
        physics: physics,
        child: Padding(
          padding: padding ?? EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header,
              ListView.separated(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => rows[index],
                  separatorBuilder: (context, index) {
                    return separator ?? const SizedBox.shrink();
                  },
                  itemCount: rows.length),
              if (footer != null) footer!,
            ],
          ),
        ),
      ),
    );
  }
}
