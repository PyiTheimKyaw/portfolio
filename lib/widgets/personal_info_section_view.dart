import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../animations/profile_animations.dart';
import '../bloc/home_page_bloc.dart';
import '../data/vos/personal_info_vo.dart';
import '../utils/colors.dart';
import '../utils/dimensions.dart';
import '../utils/fonts.dart';
import '../utils/portfolio_images.dart';
import '../utils/responsive.dart';
import '../utils/strings.dart';
import 'customized_text_view.dart';
import 'hover_button.dart';

class PersonalInfoSectionView extends StatelessWidget {
  const PersonalInfoSectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<HomePageBloc, PersonalInfoVO?>(
      selector: (BuildContext context, bloc) => bloc.personalInfo,
      builder: (BuildContext context, personalInfo, Widget? child) =>
          Responsive(
            mobile: _TabletOrMobilePersonalInfoView(
              isMobile: true,
              personalInfo: personalInfo,
            ),
            tablet: _TabletOrMobilePersonalInfoView(
              personalInfo: personalInfo,
            ),
            desktop: _DesktopPersonalInfoView(
              personalInfo: personalInfo,
            ),
          ),
    );
  }
}

class _TabletOrMobilePersonalInfoView extends StatelessWidget {
  const _TabletOrMobilePersonalInfoView({
    this.isMobile = false,
    required this.personalInfo,
  });

  final bool? isMobile;
  final PersonalInfoVO? personalInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: (isMobile ?? false)
            ? MediaQuery.of(context).size.width * 0.05
            : MediaQuery.of(context).size.width * 0.12,
      ),
      child: _AboutMeTabletOrMobileView(
        isMobile: isMobile ?? false,
        personalInfo: personalInfo,
      ),
    );
  }
}

class _DesktopPersonalInfoView extends StatelessWidget {
  const _DesktopPersonalInfoView({required this.personalInfo});

  final PersonalInfoVO? personalInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.12,
      ),
      child: _AboutMeDesktopView(
        personalInfo: personalInfo,
      ),
    );
  }
}

class _AboutMeTabletOrMobileView extends StatelessWidget {
  const _AboutMeTabletOrMobileView({
    required this.isMobile,
    required this.personalInfo,
  });

  final bool isMobile;
  final PersonalInfoVO? personalInfo;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        (isMobile)
            ? Container(
          width: MediaQuery.of(context).size.width * 0.3,
          height: MediaQuery.of(context).size.width * 0.3,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black.withOpacity(0.8),
            border: Border.all(color: kHoveredColor),
            image: DecorationImage(
              fit: BoxFit.cover,
              alignment: Alignment.bottomLeft,
              image: personalInfo?.profileImage != null
                  ? NetworkImage(personalInfo?.profileImage ?? "")
                  : const AssetImage(PortfolioImages.kMyProfileImage),
            ),
          ),
        )
            : ProfileAnimations(
          profileImage: personalInfo?.profileImage,
        ),
        const SizedBox(
          height: kMargin16,
        ),
        CustomizedTextView(
          textData: personalInfo?.greeting ?? "",
          textFontSize: kFont24,
          textFontWeight: FontWeight.w400,
          textColor: kWhiteColor,
        ),
        const SizedBox(
          height: kMargin16,
        ),
        CustomizedTextView(
          textData: personalInfo?.greetingName ?? "",
          textFontSize: kFont32,
          textFontWeight: FontWeight.bold,
        ),
        const SizedBox(
          height: kMargin16,
        ),
        DefaultTextStyle(
          style: const TextStyle(
              fontSize: kFont24,
              fontFamily: kFontPoppins,
              color: kHoveredColor,
              fontWeight: FontWeight.w600),
          child: AnimatedTextKit(
            totalRepeatCount: 10,
            pause: const Duration(milliseconds: 1500),
            animatedTexts: [
              TypewriterAnimatedText(personalInfo?.developer ?? ""),
            ],
          ),
        ),
        const SizedBox(
          height: kMargin16,
        ),
        CustomizedTextView(
          textData: personalInfo?.aboutMeDesc ?? "",
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
                launchUrl(Uri.parse(personalInfo?.cvUrl ?? ""));
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
                  launchUrl(Uri.parse(personalInfo?.cvUrl ?? ""));
                },
                icon: Icons.download,
                btnRadius: kRadius15,
              ),
            ),
            HoverButton(
              onTapBtn: () {
                launchUrl(
                  Uri.parse(personalInfo?.githubUrl ?? ""),
                );
              },
              fontAweIcon: FontAwesomeIcons.github,
              isIconOnly: true,
            ),
            HoverButton(
              onTapBtn: () {
                launchUrl(
                  Uri.parse(personalInfo?.linkedinUrl ?? ""),
                );
              },
              fontAweIcon: FontAwesomeIcons.linkedinIn,
              isIconOnly: true,
            ),
            HoverButton(
              onTapBtn: () {
                launchUrl(
                  Uri.parse(personalInfo?.whatAppsUrl ?? ""),
                );
              },
              fontAweIcon: FontAwesomeIcons.whatsapp,
              isIconOnly: true,
            ),
            HoverButton(
              onTapBtn: () {
                launchUrl(
                  Uri.parse(personalInfo?.lineUrl ?? ""),
                );
              },
              fontAweIcon: FontAwesomeIcons.line,
              isIconOnly: true,
            ),
          ],
        ),
      ],
    );
  }
}

class _AboutMeDesktopView extends StatelessWidget {
  const _AboutMeDesktopView({this.personalInfo});

  final PersonalInfoVO? personalInfo;

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
              CustomizedTextView(
                textData: personalInfo?.greeting ?? "",
                textFontSize: kFont24,
                textFontWeight: FontWeight.w400,
                textColor: kWhiteColor,
              ),
              const SizedBox(
                height: kMargin16,
              ),
              CustomizedTextView(
                textData: personalInfo?.greetingName ?? "",
                textFontSize: kFont32,
                textFontWeight: FontWeight.bold,
              ),
              const SizedBox(
                height: kMargin16,
              ),
              DefaultTextStyle(
                style: const TextStyle(
                    fontSize: kFont24,
                    fontFamily: kFontPoppins,
                    color: kHoveredColor,
                    fontWeight: FontWeight.w600),
                child: AnimatedTextKit(
                  totalRepeatCount: 10,
                  pause: const Duration(milliseconds: 1500),
                  animatedTexts: [
                    TypewriterAnimatedText(personalInfo?.developer ?? ""),
                  ],
                ),
              ),
              const SizedBox(
                height: kMargin16,
              ),
              CustomizedTextView(
                textData: personalInfo?.aboutMeDesc ?? "",
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
                      launchUrl(Uri.parse(personalInfo?.cvUrl ?? ""));
                    },
                    icon: Icons.download,
                    btnRadius: kRadius15,
                  ),
                  HoverButton(
                    onTapBtn: () {
                      launchUrl(
                        Uri.parse(personalInfo?.githubUrl ?? ""),
                      );
                    },
                    fontAweIcon: FontAwesomeIcons.github,
                    isIconOnly: true,
                  ),
                  HoverButton(
                    onTapBtn: () {
                      launchUrl(
                        Uri.parse(personalInfo?.linkedinUrl ?? ""),
                      );
                    },
                    fontAweIcon: FontAwesomeIcons.linkedinIn,
                    isIconOnly: true,
                  ),
                  HoverButton(
                    onTapBtn: () {
                      launchUrl(
                        Uri.parse(personalInfo?.whatAppsUrl ?? ""),
                      );
                    },
                    fontAweIcon: FontAwesomeIcons.whatsapp,
                    isIconOnly: true,
                  ),
                  HoverButton(
                    onTapBtn: () {
                      launchUrl(
                        Uri.parse(personalInfo?.lineUrl ?? ""),
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
        ProfileAnimations(
          profileImage: personalInfo?.profileImage,
        ),
      ],
    );
  }
}