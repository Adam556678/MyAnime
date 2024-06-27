import 'package:flutter/material.dart';
import 'package:my_anime/core/theme/colors.dart';

class IndicatorsWidget extends StatelessWidget {
  final int index;
  const IndicatorsWidget({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: index == 0 ? 27 : 15,
          height: 15,
          decoration: BoxDecoration(
              color: index == 0 ? AppColors.purple : Colors.white,
              borderRadius: BorderRadius.circular(15)),
        ),
        const SizedBox(
          width: 25,
        ),
        Container(
          width: index == 1 ? 27 : 15,
          height: 15,
          decoration: BoxDecoration(
              color: index == 1 ? AppColors.purple : Colors.white,
              borderRadius: BorderRadius.circular(15)),
        ),
        const SizedBox(
          width: 25,
        ),
        Container(
          width: index == 2 ? 27 : 15,
          height: 15,
          decoration: BoxDecoration(
              color: index == 2 ? AppColors.purple : Colors.white,
              borderRadius: BorderRadius.circular(15)),
        ),
      ],
    );
  }
}
