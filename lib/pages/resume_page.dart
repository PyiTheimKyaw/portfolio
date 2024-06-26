import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/bloc/resume_page_bloc.dart';
import 'package:portfolio/data/vos/certificate_vo.dart';
import 'package:portfolio/data/vos/education_vo.dart';
import 'package:portfolio/data/vos/experience_vo.dart';
import 'package:portfolio/data/vos/profile_vo.dart';
import 'package:portfolio/utils/colors.dart';
import 'package:portfolio/utils/dimensions.dart';
import 'package:portfolio/utils/portfolio_images.dart';
import 'package:portfolio/utils/responsive.dart';
import 'package:portfolio/utils/strings.dart';
import 'package:portfolio/widgets/customized_app_bar.dart';
import 'package:portfolio/widgets/customized_text_view.dart';
import 'package:portfolio/widgets/end_drawer_mobile_view.dart';
import 'package:portfolio/widgets/hover_button.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

final GlobalKey<ScaffoldState> _key = GlobalKey();

class ResumePage extends StatelessWidget {
  const ResumePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => ResumePageBloc(),
      child: Scaffold(
        key: _key,
        backgroundColor: kPrimaryColor,
        drawerEnableOpenDragGesture: false,
        endDrawer: const EndDrawerMobileView(
          currentPageName: kTextResume,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: kMargin24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomizedAppBar(
                  currentIndexName: kTextResume,
                  onTapMenu: () {
                    _key.currentState!.openEndDrawer();
                  },
                ),
                const SizedBox(
                  height: kMargin48,
                ),
                const ResumeSectionView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ResumeSectionView extends StatelessWidget {
  const ResumeSectionView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: _MobileResumeSectionView(),
      tablet: _DesktopAndTabletResumeView(
        isTablet: true,
      ),
      desktop: _DesktopAndTabletResumeView(),
    );
  }
}

class _MobileResumeSectionView extends StatelessWidget {
  const _MobileResumeSectionView();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * (0.05),
      ),
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SelectionListView(
            isMobile: true,
          ),
          SizedBox(
            height: kMargin24,
          ),
          _SelectedSectionView(
            isTablet: false,
            isMobile: true,
          ),
        ],
      ),
    );
  }
}

class _DesktopAndTabletResumeView extends StatelessWidget {
  const _DesktopAndTabletResumeView({this.isTablet = false});

  final bool? isTablet;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * ((isTablet ?? false) ? 0.12 : 0.15),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(
            child: _SelectionListView(),
          ),
          const SizedBox(
            width: kMargin16,
          ),
          Expanded(
            child: _SelectedSectionView(
              isTablet: isTablet ?? false,
            ),
          ),
        ],
      ),
    );
  }
}

class _SelectedSectionView extends StatelessWidget {
  const _SelectedSectionView({
    required this.isTablet,
    this.isMobile = false,
  });

  final bool isTablet;
  final bool? isMobile;

  @override
  Widget build(BuildContext context) {
    return Selector<ResumePageBloc, String>(
        selector: (BuildContext context, bloc) => bloc.selectedItem,
        builder: (BuildContext context, selectedItem, Widget? child) {
          switch (selectedItem) {
            case (kTextSkills):
              {
                return _SkillsView(
                  isTablet: (isMobile ?? false) ? true : isTablet,
                  isMobile: isMobile ?? false,
                );
              }
            case (kTextExperiences):
              {
                return _ExperiencesView(
                  isMobile: isMobile ?? false,
                );
              }
            case (kTextEducation):
              {
                return _EducationsView(
                  isMobile: isMobile ?? false,
                );
              }
            case (kTextCertificates):
              {
                return _CertificatesView(
                  isMobile: isMobile ?? false,
                );
              }
            case (kTextAboutMe):
              {
                return _AboutMeView(isMobile: isMobile ?? false);
              }
            default:
              return Container();
          }
        });
  }
}

class _AboutMeView extends StatelessWidget {
  const _AboutMeView({
    required this.isMobile,
  });

  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: (isMobile) ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        const CustomizedTextView(
          textData: kTextAboutMe,
          textFontSize: kFont24,
          textFontWeight: FontWeight.w500,
          textColor: kWhiteColor,
        ),
        const SizedBox(
          height: kMargin24,
        ),
        Selector<ResumePageBloc, ProfileVO?>(
          selector: (BuildContext context, bloc) => bloc.profileData,
          builder: (BuildContext context, profileData, Widget? child) => (isMobile)
              ? SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _ProfileDetailDataItemView(
                        dataLabelText: kTextName,
                        dataText: profileData?.name ?? "",
                      ),
                      const SizedBox(
                        height: kMargin16,
                      ),
                      _ProfileDetailDataItemView(
                        dataLabelText: kTextExperiences,
                        dataText: profileData?.experience ?? "",
                      ),
                      const SizedBox(
                        height: kMargin16,
                      ),
                      _ProfileDetailDataItemView(
                        dataLabelText: kTextNationality,
                        dataText: profileData?.nationality ?? "",
                      ),
                      const SizedBox(
                        height: kMargin16,
                      ),
                      _ProfileDetailDataItemView(
                        dataLabelText: kTextAddress,
                        dataText: profileData?.address ?? "",
                      ),
                      const SizedBox(
                        height: kMargin16,
                      ),
                      _ProfileDetailDataItemView(
                        dataLabelText: kTextPhone,
                        dataText: profileData?.phone ?? "",
                      ),
                      const SizedBox(
                        height: kMargin16,
                      ),
                      _ProfileDetailDataItemView(
                        dataLabelText: kTextEmail,
                        dataText: profileData?.email ?? "",
                      ),
                      const SizedBox(
                        height: kMargin16,
                      ),
                      _ProfileDetailDataItemView(
                        dataLabelText: kTextLine,
                        dataText: profileData?.line ?? "",
                      ),
                      const SizedBox(
                        height: kMargin16,
                      ),
                      _ProfileDetailDataItemView(
                        dataLabelText: kTextWhatApps,
                        dataText: profileData?.whatApps ?? "",
                      ),
                    ],
                  ),
                )
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: _ProfileDataLeftSideView(
                        profile: profileData,
                      ),
                    ),
                    Expanded(
                      child: _ProfileRightSideView(
                        profile: profileData,
                      ),
                    ),
                  ],
                ),
        ),
      ],
    );
  }
}

class _ProfileRightSideView extends StatelessWidget {
  const _ProfileRightSideView({
    this.profile,
  });

  final ProfileVO? profile;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _ProfileDetailDataItemView(
          dataLabelText: kTextPhone,
          dataText: profile?.phone ?? "",
        ),
        const SizedBox(
          height: kMargin16,
        ),
        _ProfileDetailDataItemView(
          dataLabelText: kTextEmail,
          dataText: profile?.email ?? "",
        ),
        const SizedBox(
          height: kMargin16,
        ),
        _ProfileDetailDataItemView(
          dataLabelText: kTextLine,
          dataText: profile?.line ?? "",
        ),
        const SizedBox(
          height: kMargin16,
        ),
        _ProfileDetailDataItemView(
          dataLabelText: kTextWhatApps,
          dataText: profile?.whatApps ?? "",
        ),
      ],
    );
  }
}

class _ProfileDataLeftSideView extends StatelessWidget {
  const _ProfileDataLeftSideView({
    this.profile,
  });

  final ProfileVO? profile;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _ProfileDetailDataItemView(
          dataLabelText: kTextName,
          dataText: profile?.name ?? "",
        ),
        const SizedBox(
          height: kMargin16,
        ),
        _ProfileDetailDataItemView(
          dataLabelText: kTextExperiences,
          dataText: profile?.experience ?? "",
        ),
        const SizedBox(
          height: kMargin16,
        ),
        _ProfileDetailDataItemView(
          dataLabelText: kTextNationality,
          dataText: profile?.nationality ?? "",
        ),
        const SizedBox(
          height: kMargin16,
        ),
        _ProfileDetailDataItemView(
          dataLabelText: kTextAddress,
          dataText: profile?.address ?? "",
        ),
      ],
    );
  }
}

class _ProfileDetailDataItemView extends StatelessWidget {
  const _ProfileDetailDataItemView({
    required this.dataLabelText,
    required this.dataText,
  });

  final String dataLabelText;
  final String dataText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomizedTextView(
          textData: dataLabelText,
          textFontSize: kFont16,
          textFontWeight: FontWeight.w400,
          textColor: kWhiteColor.withOpacity(0.5),
        ),
        const SizedBox(
          width: kMargin16,
        ),
        Flexible(
          child: CustomizedTextView(
            textData: dataText,
            textFontSize: kFont16,
            textFontWeight: FontWeight.w400,
            textColor: kWhiteColor,
            isSelectable: true,
          ),
        ),
      ],
    );
  }
}

class _CertificatesView extends StatelessWidget {
  const _CertificatesView({required this.isMobile});

  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: (isMobile) ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        const CustomizedTextView(
          textData: kTextCertificates,
          textFontSize: kFont24,
          textFontWeight: FontWeight.w500,
          textColor: kWhiteColor,
        ),
        const SizedBox(
          height: kMargin24,
        ),
        Selector<ResumePageBloc, List<CertificateVO>?>(
          selector: (BuildContext context, bloc) => bloc.certificates,
          builder: (BuildContext context, certificates, Widget? child) => ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: certificates?.length ?? 0,
            itemBuilder: (context, index) {
              return _CertificateItemView(
                certificate: certificates?[index],
                isMobile: isMobile,
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
              height: kMargin16,
            ),
          ),
        ),
      ],
    );
  }
}

class _EducationsView extends StatelessWidget {
  const _EducationsView({required this.isMobile});

  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: (isMobile) ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        const CustomizedTextView(
          textData: kTextEducation,
          textFontSize: kFont24,
          textFontWeight: FontWeight.w500,
          textColor: kWhiteColor,
        ),
        const SizedBox(
          height: kMargin24,
        ),
        Selector<ResumePageBloc, List<EducationVO>?>(
          selector: (BuildContext context, bloc) => bloc.educations,
          builder: (BuildContext context, educations, Widget? child) => ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: educations?.length ?? 0,
            itemBuilder: (context, index) {
              return _EducationItemView(
                education: educations?[index],
                isMobile: isMobile,
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
              height: kMargin16,
            ),
          ),
        ),
      ],
    );
  }
}

class _CertificateItemView extends StatelessWidget {
  const _CertificateItemView({
    this.certificate,
    this.isMobile = false,
  });

  final CertificateVO? certificate;
  final bool? isMobile;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
        kMargin24,
      ),
      decoration: BoxDecoration(
        color: kLowPrimaryColor,
        borderRadius: BorderRadius.circular(
          kRadius10,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: (isMobile ?? false) ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomizedTextView(
            textData: certificate?.duration ?? "",
            textColor: kHoveredColor,
          ),
          const SizedBox(
            height: kMargin16,
          ),
          CustomizedTextView(
            textData: certificate?.course ?? "",
            textColor: kWhiteColor,
            textFontWeight: FontWeight.w600,
            textFontSize: kFont20,
            textAlign: (isMobile ?? false) ? TextAlign.center : TextAlign.start,
          ),
          const SizedBox(
            height: kMargin16,
          ),
          HoverButton(
            onTapBtn: () {
              launchUrl(Uri.parse(certificate?.link ?? ""));
            },
            btnText: kTextViewCertificate,
            btnTextFontSize: kFont16,
            btnPadding: kMargin8,
            fontAweIcon: FontAwesomeIcons.arrowUpRightFromSquare,
          ),
          const SizedBox(
            height: kMargin16,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: kCircleContainerSize,
                height: kCircleContainerSize,
                decoration: const BoxDecoration(shape: BoxShape.circle, color: kHoveredColor),
              ),
              const SizedBox(
                width: kMargin8,
              ),
              Flexible(
                child: CustomizedTextView(
                  textData: certificate?.className ?? "",
                  textColor: kWhiteColor.withOpacity(0.5),
                  textFontWeight: FontWeight.w400,
                  textFontSize: kFont12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _EducationItemView extends StatelessWidget {
  const _EducationItemView({
    this.education,
    this.isMobile = false,
  });

  final EducationVO? education;
  final bool? isMobile;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
        kMargin24,
      ),
      decoration: BoxDecoration(
        color: kLowPrimaryColor,
        borderRadius: BorderRadius.circular(
          kRadius10,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: (isMobile ?? false) ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomizedTextView(
            textData: education?.duration ?? "",
            textColor: kHoveredColor,
          ),
          const SizedBox(
            height: kMargin16,
          ),
          CustomizedTextView(
            textData: education?.certificate ?? "",
            textColor: kWhiteColor,
            textFontWeight: FontWeight.w600,
            textFontSize: kFont20,
            textAlign: (isMobile ?? false) ? TextAlign.center : TextAlign.start,
          ),
          const SizedBox(
            height: kMargin16,
          ),
          CustomizedTextView(
            textData: education?.course ?? "",
            textColor: kWhiteColor,
            textFontWeight: FontWeight.w600,
            textFontSize: kFont20,
          ),
          const SizedBox(
            height: kMargin16,
          ),
          HoverButton(
            onTapBtn: () {
              launchUrl(Uri.parse(education?.link ?? ""));
            },
            btnText: kTextOfficialPage,
            btnTextFontSize: kFont16,
            btnPadding: kMargin8,
            fontAweIcon: FontAwesomeIcons.arrowUpRightFromSquare,
          ),
          const SizedBox(
            height: kMargin16,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: kCircleContainerSize,
                height: kCircleContainerSize,
                decoration: const BoxDecoration(shape: BoxShape.circle, color: kHoveredColor),
              ),
              const SizedBox(
                width: kMargin8,
              ),
              Flexible(
                child: CustomizedTextView(
                  textData: education?.schoolName ?? "",
                  textColor: kWhiteColor.withOpacity(0.5),
                  textFontWeight: FontWeight.w400,
                  textFontSize: kFont12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ExperiencesView extends StatelessWidget {
  const _ExperiencesView({required this.isMobile});

  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: (isMobile) ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        const CustomizedTextView(
          textData: kTextMyExp,
          textFontSize: kFont24,
          textFontWeight: FontWeight.w500,
          textColor: kWhiteColor,
        ),
        const SizedBox(
          height: kMargin24,
        ),
        Selector<ResumePageBloc, List<ExperienceVO>?>(
          selector: (BuildContext context, bloc) => bloc.experiences,
          builder: (BuildContext context, experiences, Widget? child) => ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: experiences?.length ?? 0,
            itemBuilder: (context, index) {
              return _ExperienceItemView(
                experience: experiences?[index],
                isMobile: isMobile,
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
              height: kMargin16,
            ),
          ),
        ),
      ],
    );
  }
}

class _ExperienceItemView extends StatelessWidget {
  const _ExperienceItemView({
    this.experience,
    this.isMobile = false,
  });

  final ExperienceVO? experience;
  final bool? isMobile;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
        kMargin24,
      ),
      decoration: BoxDecoration(
        color: kLowPrimaryColor,
        borderRadius: BorderRadius.circular(
          kRadius10,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: (isMobile ?? false) ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomizedTextView(
            textData: experience?.duration ?? "",
            textColor: kHoveredColor,
          ),
          const SizedBox(
            height: kMargin16,
          ),
          CustomizedTextView(
            textData: experience?.position ?? "",
            textColor: kWhiteColor,
            textFontWeight: FontWeight.w600,
            textFontSize: kFont20,
          ),
          const SizedBox(
            height: kMargin16,
          ),
          HoverButton(
            onTapBtn: () {
              launchUrl(Uri.parse(experience?.link ?? ""));
            },
            btnText: kTextOfficialPage,
            btnTextFontSize: kFont16,
            btnPadding: kMargin8,
            fontAweIcon: FontAwesomeIcons.arrowUpRightFromSquare,
          ),
          const SizedBox(
            height: kMargin16,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: kCircleContainerSize,
                height: kCircleContainerSize,
                decoration: const BoxDecoration(shape: BoxShape.circle, color: kHoveredColor),
              ),
              const SizedBox(
                width: kMargin16,
              ),
              CustomizedTextView(
                textData: experience?.companyName ?? "",
                textColor: kWhiteColor.withOpacity(0.5),
                textFontWeight: FontWeight.w400,
                textFontSize: kFont12,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SkillsView extends StatelessWidget {
  const _SkillsView({required this.isTablet, required this.isMobile});

  final bool isTablet;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: (isMobile) ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        const CustomizedTextView(
          textData: kTextMySkills,
          textFontSize: kFont24,
          textFontWeight: FontWeight.w500,
          textColor: kWhiteColor,
        ),
        const SizedBox(
          height: kMargin24,
        ),
        Align(
          alignment: (isMobile) ? Alignment.center : Alignment.centerLeft,
          child: Wrap(
            spacing: kMargin12,
            runSpacing: kMargin12,
            runAlignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: (isMobile) ? WrapAlignment.center : WrapAlignment.start,
            children: [
              _SkillItemByFontAwe(
                customImage: PortfolioImages.kFlutterLogoImage,
                isTablet: isTablet,
              ),
              _SkillItemByFontAwe(
                icon: FontAwesomeIcons.android,
                isTablet: isTablet,
              ),
              _SkillItemByFontAwe(
                icon: FontAwesomeIcons.java,
                isTablet: isTablet,
              ),
              _SkillItemByFontAwe(
                icon: FontAwesomeIcons.html5,
                isTablet: isTablet,
              ),
              _SkillItemByFontAwe(
                icon: FontAwesomeIcons.css3,
                isTablet: isTablet,
              ),
              _SkillItemByFontAwe(
                icon: FontAwesomeIcons.figma,
                isTablet: isTablet,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SkillItemByFontAwe extends StatelessWidget {
  const _SkillItemByFontAwe({
    this.icon,
    this.customImage,
    required this.isTablet,
  });

  final IconData? icon;
  final String? customImage;
  final bool isTablet;

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   width: MediaQuery.of(context).size.width * 0.08,
    //   padding: const EdgeInsets.all(kMargin24),
    //   decoration: BoxDecoration(
    //     color: kLowPrimaryColor,
    //     borderRadius: BorderRadius.circular(kRadius10),
    //   ),
    //   child: Align(
    //     alignment: Alignment.center,
    //     child: Visibility(
    //       visible: customImage != null,
    //       replacement: FaIcon(
    //         icon,
    //         size: kSkillsIconSize,
    //         color: kWhiteColor,
    //       ),
    //       child: Image.asset(customImage ?? ""),
    //     ),
    //   ),
    // );
    return SizedBox(
      height: isTablet ? kSkillsItemTabletSize : kSkillsItemSize,
      width: isTablet ? kSkillsItemTabletSize : kSkillsItemSize,
      child: HoverButton(
        onTapBtn: () {},
        fontAweIcon: icon,
        btnUnHoveredBorderColor: kLowPrimaryColor,
        btnUnHoveredColor: kLowPrimaryColor,
        iconHoveredColor: kHoveredColor,
        iconUnHoveredColor: kWhiteColor,
        btnHoveredColor: kLowPrimaryColor,
        iconSize: isTablet ? kSkillsIconTabletSize : kSkillsIconSize,
        btnPadding: kMargin16,
        customImg: customImage,
      ),
    );
  }
}

class _SelectionListView extends StatelessWidget {
  const _SelectionListView({this.isMobile = false});

  final bool? isMobile;

  @override
  Widget build(BuildContext context) {
    return Selector<ResumePageBloc, String>(
      selector: (BuildContext context, bloc) => bloc.selectedItem,
      builder: (BuildContext context, selectedItem, Widget? child) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: (isMobile ?? false) ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        children: [
          const CustomizedTextView(
            textData: kTextWhyHireMe,
            textFontSize: kFont24,
            textFontWeight: FontWeight.bold,
            textColor: kWhiteColor,
          ),
          const SizedBox(
            height: kMargin24,
          ),
          HoverButton(
            btnText: kTextSkills,
            isSelected: selectedItem == kTextSkills,
            onTapBtn: () {
              final bloc = Provider.of<ResumePageBloc>(context, listen: false);
              bloc.onTapSelectItem(kTextSkills);
            },
            btnRadius: kRadius10,
            textUnHoveredColor: kWhiteColor,
            btnUnHoveredBorderColor: kLowPrimaryColor,
            btnUnHoveredColor: kLowPrimaryColor,
            isDense: true,
          ),
          const SizedBox(
            height: kMargin16,
          ),
          HoverButton(
            btnText: kTextExperiences,
            isSelected: selectedItem == kTextExperiences,
            onTapBtn: () {
              final bloc = Provider.of<ResumePageBloc>(context, listen: false);
              bloc.onTapSelectItem(kTextExperiences);
            },
            btnRadius: kRadius10,
            textUnHoveredColor: kWhiteColor,
            btnUnHoveredBorderColor: kLowPrimaryColor,
            btnUnHoveredColor: kLowPrimaryColor,
            isDense: true,
          ),
          const SizedBox(
            height: kMargin16,
          ),
          HoverButton(
            btnText: kTextEducation,
            isSelected: selectedItem == kTextEducation,
            onTapBtn: () {
              final bloc = Provider.of<ResumePageBloc>(context, listen: false);
              bloc.onTapSelectItem(kTextEducation);
            },
            btnRadius: kRadius10,
            textUnHoveredColor: kWhiteColor,
            btnUnHoveredBorderColor: kLowPrimaryColor,
            btnUnHoveredColor: kLowPrimaryColor,
            isDense: true,
          ),
          const SizedBox(
            height: kMargin16,
          ),
          HoverButton(
            btnText: kTextCertificates,
            isSelected: selectedItem == kTextCertificates,
            onTapBtn: () {
              final bloc = Provider.of<ResumePageBloc>(context, listen: false);
              bloc.onTapSelectItem(kTextCertificates);
            },
            btnRadius: kRadius10,
            textUnHoveredColor: kWhiteColor,
            btnUnHoveredBorderColor: kLowPrimaryColor,
            btnUnHoveredColor: kLowPrimaryColor,
            isDense: true,
          ),
          const SizedBox(
            height: kMargin16,
          ),
          HoverButton(
            btnText: kTextAboutMe,
            isSelected: selectedItem == kTextAboutMe,
            onTapBtn: () {
              final bloc = Provider.of<ResumePageBloc>(context, listen: false);
              bloc.onTapSelectItem(kTextAboutMe);
            },
            btnRadius: kRadius10,
            textUnHoveredColor: kWhiteColor,
            btnUnHoveredBorderColor: kLowPrimaryColor,
            btnUnHoveredColor: kLowPrimaryColor,
            isDense: true,
          ),
        ],
      ),
    );
  }
}
