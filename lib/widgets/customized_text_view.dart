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
    this.textHeight,
    this.letterSpacing,
    this.isSelectable=false,
  });

  final String textData;
  final double textFontSize;
  final Color? textColor;
  final FontWeight? textFontWeight;
  final TextAlign? textAlign;
  final bool? isUnderlined;
  final double? textHeight;
  final double? letterSpacing;
  final bool? isSelectable;

  @override
  Widget build(BuildContext context) {
    return (isSelectable ?? false) ? SelectableText(
      textData,
      style: TextStyle(
          fontSize: Responsive.isDesktop(context)
              ? textFontSize
              : Responsive.isTablet(context)
              ? (textFontSize / 1.2)
              : (textFontSize / 1.5),
          color: textColor,
          fontWeight: textFontWeight,
          height: textHeight,
          letterSpacing: letterSpacing,
          fontFamily: kFontDMS,
          decoration: (isUnderlined ?? false) ? TextDecoration.underline : null,
          decorationColor: textColor,
          decorationStyle: TextDecorationStyle.solid),
      textAlign: textAlign,
    ):Text(
      textData,
      style: TextStyle(
          fontSize: Responsive.isDesktop(context)
              ? textFontSize
              : Responsive.isTablet(context)
                  ? (textFontSize / 1.2)
                  : (textFontSize / 1.5),
          color: textColor,
          fontWeight: textFontWeight,
          height: textHeight,
          letterSpacing: letterSpacing,
          fontFamily: kFontDMS,
          decoration: (isUnderlined ?? false) ? TextDecoration.underline : null,
          decorationColor: textColor,
          decorationStyle: TextDecorationStyle.solid),
      textAlign: textAlign,
    );
  }
}
