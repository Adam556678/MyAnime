import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_anime/features/auth/presentation/screens/login_screen.dart';
import 'package:my_anime/utils/helpers/navigation_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    //counting down
    // Future.delayed(const Duration(seconds: 3), () {
    //   NavigationHelper.navigateAndRemoveUntill(context, const LoginScreen());
    // });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            width: size.width * 0.3,
            child: Image.asset('assets/logo/naruto-gara.png'))
      ],
    ));
  }
}
