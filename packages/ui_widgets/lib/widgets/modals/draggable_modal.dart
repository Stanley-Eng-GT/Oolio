import 'package:flutter/material.dart';

import '../../theme/gaps.dart';
import '../../theme/radius_values.dart';
import 'modal_header.dart';

class DraggableModal extends StatelessWidget {
  const DraggableModal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.5,
      minChildSize: 0.2,
      maxChildSize: 0.9,
      expand: false,
      builder: (_, controller) => Container(
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(RadiusValues.circular10),
            topRight: Radius.circular(RadiusValues.circular10),
          ),
        ),
        child: Column(
          children: [
            const ModalHeader(),
            Expanded(
              child: ListView.builder(
                controller: controller,
                itemCount: 100,
                itemBuilder: (_, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(Gaps.spacing8),
                      child: Text("Element at index($index)"),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
