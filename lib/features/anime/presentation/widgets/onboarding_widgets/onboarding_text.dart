import 'package:flutter/material.dart';

import 'package:my_anime/core/strings/onboarding_strings.dart';

class FirstPageText extends StatelessWidget {
  final Size size;
  const FirstPageText({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.07, right: 15, left: 15),
      child: const Text(
        OnBoardingText.firstPageText,
        style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(color: Colors.black, blurRadius: 1, offset: Offset(0, 2))
            ]),
      ),
    );
  }
}

class SecondPageText extends StatelessWidget {
  final Size size;
  const SecondPageText({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.07, right: 15, left: 15),
      child: const Text(
        OnBoardingText.secondPageText,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          shadows: [
            Shadow(color: Colors.black, blurRadius: 1, offset: Offset(0, 2))
          ],
        ),
      ),
    );
  }
}

class ThirdPageText extends StatelessWidget {
  final Size size;
  const ThirdPageText({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.07, right: 15, left: 15),
      child: const Text(
        OnBoardingText.thirdPageText,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          shadows: [
            Shadow(color: Colors.black, blurRadius: 1, offset: Offset(0, 2))
          ],
        ),
      ),
    );
  }
}
