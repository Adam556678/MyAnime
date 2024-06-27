import 'package:flutter/material.dart';
import 'package:my_anime/features/anime/presentation/widgets/onboarding_widgets/indicator_widget.dart';
import 'package:my_anime/features/anime/presentation/widgets/onboarding_widgets/on_boarding_button.dart';
import 'package:my_anime/features/anime/presentation/widgets/onboarding_widgets/onboarding_background_widget.dart';
import 'package:my_anime/features/anime/presentation/widgets/onboarding_widgets/onboarding_text.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int activePage = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Widget> textWidgets = [
      FirstPageText(size: size),
      SecondPageText(size: size),
      ThirdPageText(size: size)
    ];

    List<ImageProvider> onboardingImages = [
      const AssetImage('assets/images/onboard_screen/onboard_image1.jpg'),
      const AssetImage('assets/images/onboard_screen/onboard_image2.jpg'),
      const AssetImage('assets/images/onboard_screen/onboard_image3.jpg')
    ];

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                activePage = page;
              });
            },
            itemCount: 3,
            itemBuilder: (context, index) {
              return OnBoardingBackground(image: onboardingImages[index % 3]);
            },
          ),
          Column(
            children: [
              textWidgets[activePage],
              const Spacer(),
              IndicatorsWidget(index: activePage),
              const SizedBox(
                height: 25,
              ),
              OnBoardingButton(
                  pageIndex: activePage, pageController: _pageController),
              SizedBox(
                height: size.height * 0.15,
              )
            ],
          )
        ],
      ),
    );
  }
}
