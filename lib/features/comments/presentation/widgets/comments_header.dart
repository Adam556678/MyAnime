import 'package:flutter/material.dart';
import 'package:my_anime/core/constants/sizes.dart';
import 'package:my_anime/features/anime/presentation/widgets/anime_details_widgets/anime_details_body.dart';

class CommentsHeader extends StatelessWidget {
  final int count;
  const CommentsHeader({
    super.key,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SectionsHeader(text: 'Comments'),
        const SizedBox(
          width: AppSizes.sm,
        ),
        Text('$count')
      ],
    );
  }
}
