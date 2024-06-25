import 'package:flutter/material.dart';
import 'package:portfolio/utils/colors.dart';
import 'package:portfolio/utils/dimensions.dart';
import 'package:portfolio/widgets/customized_text_view.dart';

class TextButtonView extends StatelessWidget {
  const TextButtonView({
    super.key,
    required this.textData,
    required this.onTapTextButton,
    this.isHovered = false,
    this.textColor,
    this.hoveredColor = kHoveredColor,
    this.textFontSize = kFont20,
    this.isSelected = false,
  });

  final String textData;
  final Function onTapTextButton;
  final bool isHovered;
  final Color? textColor;
  final Color? hoveredColor;
  final double? textFontSize;
  final bool? isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          onTapTextButton();
        },
        child: CustomizedTextView(
          isUnderlined: (isSelected ?? false) ? true : false,
          textData: textData,
          textColor: isHovered ? hoveredColor : textColor,
          textFontSize: textFontSize ?? kFont16,
        ));
  }
}
