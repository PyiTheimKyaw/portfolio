import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/utils/colors.dart';
import 'package:portfolio/utils/dimensions.dart';
import 'package:portfolio/utils/responsive.dart';
import 'package:portfolio/utils/route_constants.dart';
import 'package:portfolio/utils/strings.dart';
import 'package:portfolio/widgets/customized_text_view.dart';
import 'package:portfolio/widgets/hover_text_button.dart';
import 'package:portfolio/widgets/text_button_view.dart';

class CustomizedAppBar extends StatelessWidget {
  const CustomizedAppBar({
    super.key,
    required this.currentIndexName,
    required this.onTapMenu,
    required this.onChooseIndex,
    required this.onChooseSkill,
    required this.onChooseResume,
    required this.onChooseProject,
  });

  final Function onChooseIndex;
  final Function onChooseSkill;
  final Function onChooseResume;
  final Function onChooseProject;
  final String currentIndexName;
  final Function onTapMenu;

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: _MobileAppBarView(
        currentIndexName: currentIndexName,
        onTapMenu: onTapMenu,
      ),
      tablet: _DesktopAndTabletAppBarView(
        currentIndexName: currentIndexName,
        isTablet: true,
        onChooseIndex: onChooseIndex,
        onChooseSkill: onChooseSkill,
        onChooseResume: onChooseResume,
        onChooseProject: onChooseProject,
      ),
      desktop: _DesktopAndTabletAppBarView(
        currentIndexName: currentIndexName,
        onChooseIndex: onChooseIndex,
        onChooseSkill: onChooseSkill,
        onChooseResume: onChooseResume,
        onChooseProject: onChooseProject,
      ),
    );
  }
}

class _MobileAppBarView extends StatelessWidget {
  const _MobileAppBarView({
    required this.currentIndexName,
    required this.onTapMenu,
  });

  final String currentIndexName;
  final Function onTapMenu;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kMargin24,
        vertical: kMargin24,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CustomizedTextView(
            textData: kTextHomePageAppBarLeading,
            textFontSize: kFont24,
            textFontWeight: FontWeight.bold,
          ),
          const Spacer(),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                onTapMenu();
              },
              child: const Icon(
                Icons.menu,
                color: kWhiteColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DesktopAndTabletAppBarView extends StatelessWidget {
  const _DesktopAndTabletAppBarView({
    required this.currentIndexName,
    this.isTablet = false,
    required this.onChooseIndex,
    required this.onChooseSkill,
    required this.onChooseResume,
    required this.onChooseProject,
  });

  final String currentIndexName;
  final bool? isTablet;
  final Function onChooseIndex;
  final Function onChooseSkill;
  final Function onChooseResume;
  final Function onChooseProject;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: (isTablet ?? false)
                ? MediaQuery.of(context).size.width * 0.12
                : MediaQuery.of(context).size.width * 0.12,
            vertical: kMargin24),
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
            HoverWidget(
              builder: (isHovered) {
                return TextButtonView(
                  isSelected: currentIndexName == kTextHome,
                  textData: kTextHome,
                  onTapTextButton: () {
                    if (currentIndexName != kTextHome) {
                      onChooseIndex();
                    }
                  },
                  isHovered: isHovered,
                  textColor: currentIndexName == kTextHome ? kHoveredColor : kWhiteColor,
                  textFontSize: kFont16,
                );
              },
            ),
            const SizedBox(
              width: kMargin20,
            ),
            HoverWidget(
              builder: (isHovered) {
                return TextButtonView(
                  isSelected: currentIndexName == kTextServices,
                  textData: kTextServices,
                  onTapTextButton: () {
                    if (currentIndexName != kTextServices) {
                      // context.go(RouteConstants.kRouteService);
                      onChooseSkill();
                    }
                  },
                  isHovered: isHovered,
                  textColor: currentIndexName == kTextServices ? kHoveredColor : kWhiteColor,
                  textFontSize: kFont16,
                );
              },
            ),
            const SizedBox(
              width: kMargin20,
            ),
            HoverWidget(
              builder: (isHovered) {
                return TextButtonView(
                  isSelected: currentIndexName == kTextResume,
                  textData: kTextResume,
                  onTapTextButton: () {
                    if (currentIndexName != kTextResume) {
                      onChooseResume();
                    }
                  },
                  isHovered: isHovered,
                  textColor: currentIndexName == kTextResume ? kHoveredColor : kWhiteColor,
                  textFontSize: kFont16,
                );
              },
            ),
            const SizedBox(
              width: kMargin20,
            ),
            HoverWidget(
              builder: (isHovered) {
                return TextButtonView(
                  isSelected: currentIndexName == kTextProjects,
                  textData: kTextProjects,
                  onTapTextButton: () {
                    if (currentIndexName != kTextProjects) {
                      onChooseProject();
                    }
                  },
                  isHovered: isHovered,
                  textColor: currentIndexName == kTextProjects ? kHoveredColor : kWhiteColor,
                  textFontSize: kFont16,
                );
              },
            ),
            // const SizedBox(
            //   width: kMargin20,
            // ),
            // HoverTextButton(
            //   builder: (isHovered) {
            //     return TextButtonView(
            //       isSelected: currentIndexName == kTextContact,
            //       textData: kTextContact,
            //       onTapTextButton: () {},
            //       isHovered: isHovered,
            //       textColor: currentIndexName == kTextContact ? kHoveredColor : kWhiteColor,
            //       textFontSize: kFont16,
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
