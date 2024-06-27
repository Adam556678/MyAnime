import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:my_anime/core/constants/sizes.dart';
import 'package:my_anime/core/theme/colors.dart';

class UserCreationLoading extends StatelessWidget {
  const UserCreationLoading({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(
        "Creating The Account...",
        style: TextStyle(
            fontSize: size.width * 0.065, fontWeight: FontWeight.w500),
      ),
      const SizedBox(height: AppSizes.md),
      const SpinKitDoubleBounce(color: AppColors.purple),
    ]);
  }
}
