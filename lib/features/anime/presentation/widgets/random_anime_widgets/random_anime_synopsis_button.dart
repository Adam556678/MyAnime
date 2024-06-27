import 'package:flutter/material.dart';
import 'package:my_anime/core/constants/sizes.dart';
import 'package:my_anime/core/theme/colors.dart';

class SynopsisButton extends StatelessWidget {
  final String synopsis;
  const SynopsisButton({
    super.key,
    required this.synopsis,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showSynopDialog(context),
      child: Container(
        width: 100,
        height: 30,
        decoration: BoxDecoration(
          color: AppColors.lightPurple,
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Synopsis",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              width: AppSizes.sm / 2,
            ),
            Icon(Icons.menu_book_rounded)
          ],
        ),
      ),
    );
  }

  Future<void> showSynopDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Anime Synopsis'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(synopsis),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Got it'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
