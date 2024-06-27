import 'package:flutter/material.dart';
import 'package:my_anime/core/constants/sizes.dart';
import 'package:my_anime/core/theme/colors.dart';

class PageIndicator extends StatelessWidget {
  final bool selected;
  final int? pageNumber;
  final IconData? icon;
  final void Function()? onpressed;
  final bool disabled;
  const PageIndicator({
    super.key,
    this.pageNumber,
    this.icon,
    this.selected = false,
    this.onpressed,
    this.disabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: !disabled ? onpressed : null,
      child: Container(
        width: 35,
        decoration: BoxDecoration(
            color: selected ? AppColors.purple : AppColors.grey,
            borderRadius: BorderRadius.circular(12),
            boxShadow: !disabled
                ? [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 0.5,
                        offset: const Offset(0, 1))
                  ]
                : []),
        child: Center(
          child: pageNumber != null
              ? Text(
                  "$pageNumber",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: selected
                          ? AppColors.lightGrey
                          : (disabled ? AppColors.darkGrey : Colors.black)),
                )
              : Icon(icon, color: disabled ? AppColors.darkGrey : null),
        ),
      ),
    );
  }
}
