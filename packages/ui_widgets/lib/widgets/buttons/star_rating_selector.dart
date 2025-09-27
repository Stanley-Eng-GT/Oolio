import 'package:flutter/material.dart';
import 'package:ui_widgets/theme/gaps.dart';

import '../../generated/l10n.dart';

class StarRatingSelectorConstants {
  static int totalStar = 5;
}

class StarRatingSelector extends StatefulWidget {
  const StarRatingSelector({
    super.key,
    this.score,
    this.onChanged,
  });

  final int? score;
  final ValueChanged<int>? onChanged;

  @override
  State<StarRatingSelector> createState() => _StarRatingSelectorState();
}

class _StarRatingSelectorState extends State<StarRatingSelector> {
  late int _currentRating;

  @override
  void initState() {
    super.initState();
    _currentRating = widget.score ?? StarRatingSelectorConstants.totalStar;
  }

  void _rate(int rating) {
    setState(() {
      _currentRating = rating;
    });
    widget.onChanged?.call(rating);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children:
              List.generate(StarRatingSelectorConstants.totalStar, (index) {
            return Padding(
              padding: const EdgeInsets.all(Gaps.spacing4),
              child: IconButton(
                icon: Icon(
                  index < _currentRating ? Icons.star : Icons.star_border,
                  color: Theme.of(context).colorScheme.primary,
                ),
                onPressed: () => _rate(index + 1),
              ),
            );
          }),
        ),
        const SizedBox(height: Gaps.spacing4),
        Text(
          S.of(context).tapAStarToRate,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: Theme.of(context).colorScheme.secondary,
              ),
        ),
      ],
    );
  }
}
