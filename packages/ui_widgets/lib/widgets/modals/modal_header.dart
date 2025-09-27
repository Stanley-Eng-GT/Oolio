import 'package:flutter/material.dart';

class ModalHeader extends StatelessWidget {
  const ModalHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                Navigator.of(context).pop(); // Close the modal
              },
            ),
          ],
        ),
        const Divider(),
      ],
    );
  }
}
