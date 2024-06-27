import 'package:flutter/material.dart';

import 'package:my_anime/core/theme/colors.dart';
import 'package:my_anime/core/styles/text_field_style.dart';

class AppTextFormField extends StatefulWidget {
  final String text;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final int maxLines;
  final double borderRadius;
  final TextEditingController? controller;
  final Color? borderColor;
  final bool secured;
  final String? Function(String? value)? validator;
  const AppTextFormField({
    Key? key,
    required this.text,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLines = 1,
    this.borderRadius = 15,
    this.controller,
    this.borderColor,
    this.secured = false,
    this.validator,
  }) : super(key: key);

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  bool visible = false;

  @override
  void initState() {
    visible = widget.secured;
    super.initState();
  }

  void changeVisibility() {
    setState(() {
      visible = !visible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      controller: widget.controller,
      cursorColor: AppColors.purple,
      maxLines: widget.maxLines,
      obscureText: visible,
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: widget.text,
          contentPadding: const EdgeInsets.all(15),
          prefixIcon: Icon(widget.prefixIcon),
          suffixIcon: widget.secured
              ? IconButton(
                  onPressed: changeVisibility,
                  icon: const Icon(Icons.visibility))
              : Icon(widget.suffixIcon),
          enabledBorder: TextFieldStyle.appOutlineInputBorder(
            color: widget.borderColor,
            radius: widget.borderRadius,
          ),
          focusedBorder: TextFieldStyle.appOutlineInputBorder(
              color: AppColors.purple.withOpacity(0.4),
              radius: widget.borderRadius),
          errorBorder: TextFieldStyle.appOutlineInputBorder(
              color: Colors.red, radius: widget.borderRadius),
          border: TextFieldStyle.appOutlineInputBorder(
              radius: widget.borderRadius)),
    );
  }
}
