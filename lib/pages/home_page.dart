import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/animations/zoom_animation.dart';
import 'package:portfolio/utils/colors.dart';
import 'package:portfolio/utils/dimensions.dart';
import 'package:portfolio/utils/fonts.dart';
import 'package:portfolio/utils/responsive.dart';
import 'package:portfolio/utils/strings.dart';
import 'package:portfolio/widgets/customized_app_bar.dart';
import 'package:portfolio/widgets/customized_text_view.dart';
import 'package:portfolio/widgets/end_drawer_mobile_view.dart';
import 'package:portfolio/widgets/hover_button.dart';
import 'package:portfolio/widgets/hover_text_button.dart';
import 'package:portfolio/widgets/text_button_view.dart';
import 'package:url_launcher/url_launcher.dart';

final GlobalKey<ScaffoldState> _key = GlobalKey();

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      backgroundColor: kPrimaryColor,
      drawerEnableOpenDragGesture: false,
      endDrawer: const EndDrawerMobileView(
        currentPageName: kTextHome,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: kMargin24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomizedAppBar(
                currentIndexName: kTextHome,
                onTapMenu: () {
                  _key.currentState!.openEndDrawer();
                },
              ),
              const SizedBox(
                height: kMargin60,
              ),
              const _PersonalInfoSectionView(),
              const SizedBox(
                height: kMargin48,
              ),
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CustomizedTextView(
                      textData: kTextPortfolioAndName,
                      textFontSize: kFont18,
                      textFontWeight: FontWeight.w400,
                    ),
                    const SizedBox(
                      height: kMargin16,
                    ),
                    HoverTextButton(
                      builder: (isHovered) {
                        return TextButtonView(
                          textData: kTextViewSourceCode,
                          onTapTextButton: () {
                            launchUrl(
                              Uri.parse(
                                kTextPortfolioGitUrl,
                              ),
                            );
                          },
                          isHovered: isHovered,
                          textColor: isHovered ? kHoveredColor : kWhiteColor,
                          textFontSize: kFont14,
                        );
                      },
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

class _PersonalInfoSectionView extends StatelessWidget {
  const _PersonalInfoSectionView();

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: _TabletOrMobilePersonalInfoView(
        isMobile: true,
      ),
      tablet: _TabletOrMobilePersonalInfoView(),
      desktop: _DesktopPersonalInfoView(),
    );
  }
}

class _TabletOrMobilePersonalInfoView extends StatelessWidget {
  const _TabletOrMobilePersonalInfoView({this.isMobile = false});

  final bool? isMobile;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal:
            (isMobile ?? false) ? MediaQuery.of(context).size.width * 0.05 : MediaQuery.of(context).size.width * 0.12,
      ),
      child: _AboutMeTabletOrMobileView(
        isMobile: isMobile ?? false,
      ),
    );
  }
}

class _DesktopPersonalInfoView extends StatelessWidget {
  const _DesktopPersonalInfoView();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.15,
      ),
      child: _AboutMeDesktopView(),
    );
  }
}

class _ProfessionalRecordTabletView extends StatelessWidget {
  const _ProfessionalRecordTabletView({
    required this.count,
    required this.dataText,
  });

  final String count;
  final String dataText;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomizedTextView(
            textData: count,
            textFontSize: kFont32,
          ),
          const SizedBox(
            width: kMargin8,
          ),
          Flexible(
            child: CustomizedTextView(
              textData: dataText,
              textFontSize: kFont14,
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfessionalRecordDesktopView extends StatelessWidget {
  const _ProfessionalRecordDesktopView({
    required this.count,
    required this.dataText,
  });

  final String count;
  final String dataText;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomizedTextView(
            textData: count,
            textFontSize: kFont32,
          ),
          const SizedBox(
            width: kMargin8,
          ),
          Flexible(
            child: CustomizedTextView(
              textData: dataText,
              textFontSize: kFont14,
            ),
          ),
        ],
      ),
    );
  }
}

class _AboutMeTabletOrMobileView extends StatelessWidget {
  const _AboutMeTabletOrMobileView({
    required this.isMobile,
  });

  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const ProfileAnimations(),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CustomizedTextView(
              textData: kTextGreeting,
              textFontSize: kFont24,
              textFontWeight: FontWeight.w400,
              textColor: kWhiteColor,
            ),
            const SizedBox(
              height: kMargin16,
            ),
            const CustomizedTextView(
              textData: kTextGreetingMyName,
              textFontSize: kFont32,
              textFontWeight: FontWeight.bold,
            ),
            const SizedBox(
              height: kMargin16,
            ),
            DefaultTextStyle(
              style: const TextStyle(
                  fontSize: kFont24, fontFamily: kFontTWK, color: kHoveredColor, fontWeight: FontWeight.w600),
              child: AnimatedTextKit(
                totalRepeatCount: 10,
                pause: const Duration(milliseconds: 1500),
                animatedTexts: [
                  TypewriterAnimatedText(kTextFlutterDeveloper),
                ],
              ),
            ),
            const SizedBox(
              height: kMargin16,
            ),
            const CustomizedTextView(
              textData: kTextAboutMeDesc,
              textFontSize: kFont14,
              textFontWeight: FontWeight.w400,
              textHeight: 2,
              letterSpacing: 2,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: kMargin16,
            ),
            Visibility(
              visible: isMobile,
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: kMargin16,
                ),
                child: HoverButton(
                  btnText: kTextDownloadCV,
                  onTapBtn: () {
                    launchUrl(Uri.parse(kTextCVUrl));
                  },
                  icon: Icons.download,
                  btnRadius: kRadius15,
                ),
              ),
            ),
            Wrap(
              spacing: kMargin12,
              runSpacing: kMargin12,
              runAlignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Visibility(
                  visible: !isMobile,
                  child: HoverButton(
                    btnText: kTextDownloadCV,
                    onTapBtn: () {
                      launchUrl(Uri.parse(kTextCVUrl));
                    },
                    icon: Icons.download,
                    btnRadius: kRadius15,
                  ),
                ),
                HoverButton(
                  onTapBtn: () {
                    launchUrl(
                      Uri.parse(kTextGitHubUrl),
                    );
                  },
                  fontAweIcon: FontAwesomeIcons.github,
                  isIconOnly: true,
                ),
                HoverButton(
                  onTapBtn: () {
                    launchUrl(
                      Uri.parse(kTextLinkedInUrl),
                    );
                  },
                  fontAweIcon: FontAwesomeIcons.linkedinIn,
                  isIconOnly: true,
                ),
                HoverButton(
                  onTapBtn: () {
                    launchUrl(
                      Uri.parse(kTextWhatAppsUrl),
                    );
                  },
                  fontAweIcon: FontAwesomeIcons.whatsapp,
                  isIconOnly: true,
                ),
                HoverButton(
                  onTapBtn: () {
                    launchUrl(
                      Uri.parse(kTextLineUrl),
                    );
                  },
                  fontAweIcon: FontAwesomeIcons.line,
                  isIconOnly: true,
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}

class _AboutMeDesktopView extends StatelessWidget {
  const _AboutMeDesktopView();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomizedTextView(
                textData: kTextGreeting,
                textFontSize: kFont24,
                textFontWeight: FontWeight.w400,
                textColor: kWhiteColor,
              ),
              const SizedBox(
                height: kMargin16,
              ),
              const CustomizedTextView(
                textData: kTextGreetingMyName,
                textFontSize: kFont32,
                textFontWeight: FontWeight.bold,
              ),
              const SizedBox(
                height: kMargin16,
              ),
              DefaultTextStyle(
                style: const TextStyle(
                    fontSize: kFont24, fontFamily: kFontTWK, color: kHoveredColor, fontWeight: FontWeight.w600),
                child: AnimatedTextKit(
                  totalRepeatCount: 10,
                  pause: const Duration(milliseconds: 1500),
                  animatedTexts: [
                    TypewriterAnimatedText(kTextFlutterDeveloper),
                  ],
                ),
              ),
              const SizedBox(
                height: kMargin16,
              ),
              const CustomizedTextView(
                textData: kTextAboutMeDesc,
                textFontSize: kFont14,
                textFontWeight: FontWeight.w400,
                textHeight: 2,
                letterSpacing: 2,
              ),
              const SizedBox(
                height: kMargin16,
              ),
              Wrap(
                spacing: kMargin12,
                runSpacing: kMargin12,
                runAlignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  HoverButton(
                    btnText: kTextDownloadCV,
                    onTapBtn: () {
                      launchUrl(Uri.parse(kTextCVUrl));
                    },
                    icon: Icons.download,
                    btnRadius: kRadius15,
                  ),
                  HoverButton(
                    onTapBtn: () {
                      launchUrl(
                        Uri.parse(kTextGitHubUrl),
                      );
                    },
                    fontAweIcon: FontAwesomeIcons.github,
                    isIconOnly: true,
                  ),
                  HoverButton(
                    onTapBtn: () {
                      launchUrl(
                        Uri.parse(kTextLinkedInUrl),
                      );
                    },
                    fontAweIcon: FontAwesomeIcons.linkedinIn,
                    isIconOnly: true,
                  ),
                  HoverButton(
                    onTapBtn: () {
                      launchUrl(
                        Uri.parse(kTextWhatAppsUrl),
                      );
                    },
                    fontAweIcon: FontAwesomeIcons.whatsapp,
                    isIconOnly: true,
                  ),
                  HoverButton(
                    onTapBtn: () {
                      launchUrl(
                        Uri.parse(kTextLineUrl),
                      );
                    },
                    fontAweIcon: FontAwesomeIcons.line,
                    isIconOnly: true,
                  ),
                ],
              )
            ],
          ),
        ),
        const ProfileAnimations(),
      ],
    );
  }
}
