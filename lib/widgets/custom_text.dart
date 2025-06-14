import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    this.color,
    this.fontFamily,
    this.fontSize,
    this.fontWeight,
    this.maxLines,
    this.textDecoration,
  });

  final String text;
  final int? maxLines;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final TextDecoration? textDecoration;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: fontFamily,
        decoration: textDecoration,
      ),
    );
  }
}
