import 'package:flutter/material.dart';
import 'package:foundation/mime/src/mime_type.dart';

import '../../theme/gaps.dart';

class _FileDisplayRowConstants {
  static const double iconSize = 28.0;
}

class FileDisplayRow extends StatelessWidget {
  const FileDisplayRow({
    super.key,
    required this.fileName,
    required this.fileType,
    this.onFileNameTap,
    this.onDeleteIconTap,
  });
  final String fileName;
  final FileType fileType;
  final VoidCallback? onFileNameTap;
  final VoidCallback? onDeleteIconTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          Gaps.spacing16,
          Gaps.spacing6,
          Gaps.spacing0,
          Gaps.spacing6,
        ),
        child: Row(
          children: [
            Icon(
              fileType.iconData,
              color: Theme.of(context).colorScheme.secondary,
              size: _FileDisplayRowConstants.iconSize,
            ),
            const SizedBox(width: Gaps.spacing4),
            TextButton(
                onPressed: () => onFileNameTap?.call(),
                child: Text(
                  fileName,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                        decoration: TextDecoration.underline,
                      ),
                )),
            const Spacer(),
            IconButton(
              onPressed: () => onDeleteIconTap?.call(),
              icon: Padding(
                padding: const EdgeInsets.all(Gaps.spacing16),
                child: Icon(
                  Icons.close,
                  color: Theme.of(context).colorScheme.secondary,
                  size: _FileDisplayRowConstants.iconSize,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
