import 'package:flutter/material.dart';
import 'package:my_anime/core/constants/sizes.dart';
import 'package:my_anime/core/styles/text_styles.dart';

class DetailsIcon extends StatelessWidget {
  final IconData icon;
  final Color? color;
  final String label;
  const DetailsIcon({
    super.key,
    required this.icon,
    this.color = Colors.black,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: color,
          size: 35,
        ),
        const SizedBox(
          height: AppSizes.sm,
        ),
        Text(
          label,
          style: AppTextStyles.animeIconDetailsLabelTextStyle,
        ),
      ],
    );
  }
}
