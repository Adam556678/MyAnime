import 'package:flutter/material.dart';

class HomePageDropDownMenu extends StatelessWidget {
  const HomePageDropDownMenu({
    super.key,
    required this.dropDownHeight,
  });

  final double dropDownHeight;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      height: dropDownHeight,
      width: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 35,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                size: 25,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                size: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
