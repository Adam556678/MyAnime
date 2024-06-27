import 'package:flutter/material.dart';
import 'package:my_anime/core/styles/text_styles.dart';
import 'package:my_anime/features/anime/presentation/widgets/home_widgets/home_dropdown_menu.dart';

class HomePageUpperPartWidget extends StatefulWidget {
  const HomePageUpperPartWidget({
    super.key,
  });

  @override
  State<HomePageUpperPartWidget> createState() =>
      _HomePageUpperPartWidgetState();
}

class _HomePageUpperPartWidgetState extends State<HomePageUpperPartWidget> {
  double turns = 0.0;
  double dropDownHeight = 50;

  void _rotateIcon() {
    setState(() {
      if (turns == 0.0) {
        turns = -0.25;
      } else {
        turns = 0.0;
      }
      changeDropDownHeight();
    });
  }

  void changeDropDownHeight() {
    setState(() {
      if (dropDownHeight == 50) {
        dropDownHeight = 150;
      } else {
        dropDownHeight = 50;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("MyAnime", style: AppTextStyles.homePageTitleTextStyle),
        const Spacer(),
        Stack(children: [
          HomePageDropDownMenu(dropDownHeight: dropDownHeight),
          IconButton(
            onPressed: _rotateIcon,
            icon: AnimatedRotation(
              duration: const Duration(milliseconds: 150),
              turns: turns,
              child: const Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Colors.black,
                size: 25,
              ),
            ),
          ),
        ])
      ],
    );
  }
}
