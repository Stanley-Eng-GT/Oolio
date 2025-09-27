import 'package:flutter/material.dart';

import '../../theme/gaps.dart';

class _FileUploadRowConstants {
  static const double iconSize = 28.0;
}

class FileUploadRow extends StatelessWidget {
  const FileUploadRow({
    super.key,
    required this.label,
    this.onTap,
  });
  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: Gaps.spacing8, horizontal: Gaps.spacing16),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(
            label,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                ),
          ),
          trailing: Icon(
            Icons.add_circle,
            color: Theme.of(context).colorScheme.primary,
            size: _FileUploadRowConstants.iconSize,
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
