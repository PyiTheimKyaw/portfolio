import 'package:flutter/material.dart';
import 'package:portfolio/utils/colors.dart';
import 'package:portfolio/utils/dimensions.dart';
import 'package:portfolio/utils/fonts.dart';
import 'package:portfolio/utils/responsive.dart';

class CustomizedTextView extends StatelessWidget {
  const CustomizedTextView({
    super.key,
    required this.textData,
    this.textFontSize = kFont16,
    this.textColor = kWhiteColor,
    this.textFontWeight = FontWeight.w500,
    this.textAlign = TextAlign.start,
    this.isUnderlined = false,
  });

  final String textData;
  final double textFontSize;
  final Color? textColor;
  final FontWeight? textFontWeight;
  final TextAlign? textAlign;
  final bool? isUnderlined;

  @override
  Widget build(BuildContext context) {
    return Text(
      textData,
      style: TextStyle(
        fontSize: Responsive.isDesktop(context)
            ? textFontSize
            : Responsive.isTablet(context)
                ? (textFontSize / 1.2)
                : (textFontSize / 1.5),
        color: textColor,
        fontWeight: textFontWeight,
        fontFamily: kFontTWK,
        decoration: (isUnderlined ?? false) ? TextDecoration.underline : null,
        decorationColor: textColor,
        decorationStyle: TextDecorationStyle.solid
      ),
      textAlign: textAlign,
    );
  }
}
