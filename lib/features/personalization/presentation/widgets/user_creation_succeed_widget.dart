import 'package:flutter/material.dart';
import 'package:flutter_animated_icons/icons8.dart';
import 'package:lottie/lottie.dart';
import 'package:my_anime/core/constants/sizes.dart';
import 'package:my_anime/features/anime/presentation/screens/home_page_screen.dart';
import 'package:my_anime/utils/helpers/navigation_helper.dart';

class UserCreationSucceedWidget extends StatefulWidget {
  const UserCreationSucceedWidget({super.key});

  @override
  State<UserCreationSucceedWidget> createState() =>
      _UserCreationSucceedWidgetState();
}

class _UserCreationSucceedWidgetState extends State<UserCreationSucceedWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2500));
    _animationController.forward();
    _animationController.repeat();
    _navigateToHomePage();
    super.initState();
  }

  @override
  dispose() {
    _animationController.dispose(); // you need this
    super.dispose();
  }

  Future<void> _navigateToHomePage() async {
    Future.delayed(const Duration(seconds: 3), () {
      NavigationHelper.navigateAndRemoveUntill(context, const HomeScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 120,
            child: Lottie.asset(Icons8.check_circle_color,
                controller: _animationController),
          ),
          const SizedBox(height: AppSizes.md),
          Text(
            'User Created Successfully',
            style: TextStyle(
              fontSize: size.width * 0.055,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
