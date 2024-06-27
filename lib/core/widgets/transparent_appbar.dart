import 'package:flutter/material.dart';
import 'package:my_anime/utils/helpers/navigation_helper.dart';

class TransparentAppBar extends StatelessWidget {
  final String title;
  final Color color;
  const TransparentAppBar(
      {super.key, required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () {
              NavigationHelper.navigateBack(context);
            },
            icon: Icon(
              Icons.arrow_back,
              size: 30,
              color: color,
            )),
        Text(
          title,
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.w600, color: color),
        )
      ],
    );
  }
}
