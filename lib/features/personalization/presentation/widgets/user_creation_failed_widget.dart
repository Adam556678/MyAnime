import 'package:flutter/material.dart';
import 'package:flutter_animated_icons/icons8.dart';
import 'package:lottie/lottie.dart';
import 'package:my_anime/core/constants/sizes.dart';
import 'package:my_anime/core/styles/text_styles.dart';

class UserCreationFailedWidget extends StatefulWidget {
  const UserCreationFailedWidget({super.key});

  @override
  State<UserCreationFailedWidget> createState() =>
      _UserCreationFailedWidgetState();
}

class _UserCreationFailedWidgetState extends State<UserCreationFailedWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2500));
    _animationController.forward();
    _animationController.repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 120,
              child: Lottie.asset(Icons8.icons8_close_2_,
                  controller: _animationController),
            ),
            const SizedBox(height: AppSizes.md),
            Text('Error occured while Creating User',
                style: AppTextStyles.errorMessageTextStyle.copyWith(
                  fontSize: size.width * 0.055,
                )),
          ],
        ),
      ),
    );
  }
}
