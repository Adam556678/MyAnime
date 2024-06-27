import 'package:flutter/material.dart';

class AnimeRatingWidget extends StatelessWidget {
  final double? rate;
  final Color color;
  const AnimeRatingWidget({super.key, this.rate, this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '${rate ?? ''}',
          style: TextStyle(color: color, fontSize: 15),
        ),
        const SizedBox(
          width: 2,
        ),
        rate == null
            ? Container()
            : const Icon(
                Icons.star,
                color: Colors.amber,
              ),
      ],
    );
  }
}
