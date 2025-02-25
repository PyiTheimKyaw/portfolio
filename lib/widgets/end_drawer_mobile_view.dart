import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/utils/colors.dart';
import 'package:portfolio/utils/dimensions.dart';
import 'package:portfolio/utils/route_constants.dart';
import 'package:portfolio/utils/strings.dart';
import 'package:portfolio/widgets/customized_text_view.dart';
import 'package:portfolio/widgets/hover_text_button.dart';
import 'package:portfolio/widgets/text_button_view.dart';

class EndDrawerMobileView extends StatelessWidget {
  const EndDrawerMobileView({
    super.key,
    required this.currentPageName,
     this.onTapSkill,
  });

  final Function? onTapSkill;
  final String currentPageName;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: kPrimaryColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(
                kMargin16,
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.close,
                  color: kHoveredColor,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: kMargin60,
          ),
          const CustomizedTextView(
            textData: kTextHomePageAppBarLeading,
            textFontSize: kFont32,
            textFontWeight: FontWeight.bold,
          ),
          const SizedBox(
            height: kMargin48,
          ),
          HoverWidget(
            builder: (isHovered) {
              return TextButtonView(
                isSelected: currentPageName == kTextHome,
                textData: kTextHome,
                onTapTextButton: () {
                  if (currentPageName != kTextHome) {
                    context.go(RouteConstants.kRouteHome);
                  }
                },
                isHovered: isHovered,
                textColor: currentPageName == kTextHome ? kHoveredColor : kWhiteColor,
                textFontSize: kFont20,
              );
            },
          ),
          const SizedBox(
            height: kMargin20,
          ),
          HoverWidget(
            builder: (isHovered) {
              return TextButtonView(
                isSelected: currentPageName == kTextServices,
                textData: kTextServices,
                onTapTextButton: () {
                  if (currentPageName != kTextServices) {
                    onTapSkill?.call();
                  }
                },
                isHovered: isHovered,
                textColor: currentPageName == kTextServices ? kHoveredColor : kWhiteColor,
                textFontSize: kFont20,
              );
            },
          ),
          const SizedBox(
            height: kMargin20,
          ),
          HoverWidget(
            builder: (isHovered) {
              return TextButtonView(
                isSelected: currentPageName == kTextResume,
                textData: kTextResume,
                onTapTextButton: () {
                  if (currentPageName != kTextResume) {
                    context.go(RouteConstants.kRouteResume);
                  }
                },
                isHovered: isHovered,
                textColor: currentPageName == kTextResume ? kHoveredColor : kWhiteColor,
                textFontSize: kFont20,
              );
            },
          ),
          const SizedBox(
            height: kMargin20,
          ),
          HoverWidget(
            builder: (isHovered) {
              return TextButtonView(
                isSelected: currentPageName == kTextProjects,
                textData: kTextProjects,
                onTapTextButton: () {
                  if (currentPageName != kTextProjects) {
                    context.go(RouteConstants.kRouteProjects);
                  }
                },
                isHovered: isHovered,
                textColor: currentPageName == kTextProjects ? kHoveredColor : kWhiteColor,
                textFontSize: kFont20,
              );
            },
          ),
          // const SizedBox(
          //   height: kMargin20,
          // ),
          // HoverTextButton(
          //   builder: (isHovered) {
          //     return TextButtonView(
          //       isSelected: currentPageName == kTextContact,
          //       textData: kTextContact,
          //       onTapTextButton: () {},
          //       isHovered: isHovered,
          //       textColor: currentPageName == kTextContact ? kHoveredColor : kWhiteColor,
          //       textFontSize: kFont20,
          //     );
          //   },
          // ),
        ],
      ),
    );
  }
}
