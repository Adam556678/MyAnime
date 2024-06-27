import 'package:flutter/material.dart';
import 'package:my_anime/features/auth/presentation/screens/login_screen.dart';
import 'package:my_anime/utils/helpers/navigation_helper.dart';
import 'package:my_anime/core/styles/text_styles.dart';
import 'package:my_anime/core/theme/colors.dart';
import 'package:my_anime/features/anime/presentation/screens/home_page_screen.dart';

class OnBoardingButton extends StatelessWidget {
  final PageController pageController;
  final int pageIndex;
  const OnBoardingButton({
    super.key,
    required this.pageIndex,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 60,
      child: ElevatedButton(
        onPressed: () {
          if (pageIndex != 2) {
            _navigateToNextPage(pageController, pageIndex);
          } else {
            NavigationHelper.navigateAndRemoveUntill(
                context, const LoginScreen());
          }
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(AppColors.purple)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              pageIndex != 2 ? "Next" : "Get Started",
              style: AppTextStyles.buttonTextStyle,
            ),
            pageIndex != 2
                ? const Icon(
                    Icons.navigate_next,
                    color: Colors.white,
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  _navigateToNextPage(PageController pageController, int pageIndex) {
    pageController.animateToPage(pageIndex + 1,
        duration: const Duration(milliseconds: 400), curve: Curves.easeOut);
  }
}
