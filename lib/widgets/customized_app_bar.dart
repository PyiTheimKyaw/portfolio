import 'package:flutter/material.dart';
import 'package:portfolio/utils/colors.dart';
import 'package:portfolio/utils/dimensions.dart';
import 'package:portfolio/utils/responsive.dart';
import 'package:portfolio/utils/strings.dart';
import 'package:portfolio/widgets/customized_text_view.dart';
import 'package:portfolio/widgets/hover_text_button.dart';
import 'package:portfolio/widgets/text_button_view.dart';

class CustomizedAppBar extends StatelessWidget {
  const CustomizedAppBar({super.key, required this.currentIndexName});

  final String currentIndexName;

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: Container(),
      tablet: Container(),
      desktop: _DesktopAppBarView(currentIndexName: currentIndexName),
    );
  }
}

class _DesktopAppBarView extends StatelessWidget {
  const _DesktopAppBarView({
    super.key,
    required this.currentIndexName,
  });

  final String currentIndexName;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.25, vertical: kMargin24),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CustomizedTextView(
              textData: kTextHomePageAppBarLeading,
              textFontSize: kFont24,
              textFontWeight: FontWeight.bold,
            ),
            const Spacer(),
            // const Spacer(),
            HoverTextButton(
              builder: (isHovered) {
                return TextButtonView(
                  isSelected: currentIndexName == kTextHome,
                  textData: kTextHome,
                  onTapTextButton: () {},
                  isHovered: isHovered,
                  textColor: currentIndexName == kTextHome ? kHoveredTextColor : kWhiteColor,
                  textFontSize: kFont16,
                );
              },
            ),
            const SizedBox(
              width: kMargin20,
            ),
            HoverTextButton(
              builder: (isHovered) {
                return TextButtonView(
                  isSelected: currentIndexName == kTextServices,
                  textData: kTextServices,
                  onTapTextButton: () {},
                  isHovered: isHovered,
                  textColor: currentIndexName == kTextServices ? kHoveredTextColor : kWhiteColor,
                  textFontSize: kFont16,
                );
              },
            ),
            const SizedBox(
              width: kMargin20,
            ),
            HoverTextButton(
              builder: (isHovered) {
                return TextButtonView(
                  isSelected: currentIndexName == kTextResume,
                  textData: kTextResume,
                  onTapTextButton: () {},
                  isHovered: isHovered,
                  textColor: currentIndexName == kTextResume ? kHoveredTextColor : kWhiteColor,
                  textFontSize: kFont16,
                );
              },
            ),
            const SizedBox(
              width: kMargin20,
            ),
            HoverTextButton(
              builder: (isHovered) {
                return TextButtonView(
                  isSelected: currentIndexName == kTextProjects,
                  textData: kTextProjects,
                  onTapTextButton: () {},
                  isHovered: isHovered,
                  textColor: currentIndexName == kTextProjects ? kHoveredTextColor : kWhiteColor,
                  textFontSize: kFont16,
                );
              },
            ),
            const SizedBox(
              width: kMargin20,
            ),
            HoverTextButton(
              builder: (isHovered) {
                return TextButtonView(
                  isSelected: currentIndexName == kTextHome,
                  textData: kTextHome,
                  onTapTextButton: () {},
                  isHovered: isHovered,
                  textColor: currentIndexName == kTextHome ? kHoveredTextColor : kWhiteColor,
                  textFontSize: kFont16,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
