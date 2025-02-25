import 'package:flutter/material.dart';
import 'package:portfolio/bloc/home_page_bloc.dart';
import 'package:portfolio/data/vos/personal_info_vo.dart';
import 'package:portfolio/utils/colors.dart';
import 'package:portfolio/utils/dimensions.dart';
import 'package:portfolio/utils/enums.dart';
import 'package:portfolio/utils/strings.dart';
import 'package:portfolio/widgets/customized_app_bar.dart';
import 'package:portfolio/widgets/customized_text_view.dart';
import 'package:portfolio/widgets/end_drawer_mobile_view.dart';
import 'package:portfolio/widgets/hover_text_button.dart';
import 'package:portfolio/widgets/loading_state_widget.dart';
import 'package:portfolio/widgets/text_button_view.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/personal_info_section_view.dart';
import '../widgets/skill_section_view.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  final GlobalKey introSectionKey = GlobalKey();
  final GlobalKey skillSectionKey = GlobalKey();
  final GlobalKey projectSectionKey = GlobalKey();
  final GlobalKey resumeSectionKey = GlobalKey();

  void scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomePageBloc>(
      create: (BuildContext context) => HomePageBloc(),
      child: Scaffold(
        key: _key,
        backgroundColor: kPrimaryColor,
        drawerEnableOpenDragGesture: false,
        endDrawer: EndDrawerMobileView(
          currentPageName: kTextHome,
          onTapSkill: () {
            scrollToSection(skillSectionKey);
          },
        ),
        body: Consumer<HomePageBloc>(
          builder: (BuildContext context, bloc, Widget? child) => LoadingStateWidget<HomePageBloc>(
            loadingState: bloc.getLoadingState,
            widgetForSuccessState: SingleChildScrollView(
              controller: _scrollController,
              child: Padding(
                padding: const EdgeInsets.only(bottom: kMargin24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Nav bar
                    CustomizedAppBar(
                      currentIndexName: kTextHome,
                      onTapMenu: () {
                        _key.currentState!.openEndDrawer();
                      },
                      onChooseIndex: () {
                        scrollToSection(introSectionKey);
                      },
                      onChooseSkill: () {
                        scrollToSection(skillSectionKey);
                      },
                      onChooseResume: () {
                        scrollToSection(resumeSectionKey);
                      },
                      onChooseProject: () {
                        scrollToSection(projectSectionKey);
                      },
                    ),
                    const SizedBox(
                      height: kMargin60,
                    ),
                    //Personal introduction
                    PersonalInfoSectionView(
                      key: introSectionKey,
                    ),
                    const SizedBox(
                      height: kMargin48,
                    ),
                    //Skills section
                    SkillsSectionView(
                      key: skillSectionKey,
                    ),
                    // const Center(
                    //   child: _PortfolioLinkSectionView(),
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _PortfolioLinkSectionView extends StatelessWidget {
  const _PortfolioLinkSectionView();

  @override
  Widget build(BuildContext context) {
    return Selector<HomePageBloc, PersonalInfoVO?>(
      selector: (BuildContext context, bloc) => bloc.personalInfo,
      builder: (BuildContext context, personalInfo, Widget? child) => Column(
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
          HoverWidget(
            builder: (isHovered) {
              return TextButtonView(
                textData: kTextViewSourceCode,
                onTapTextButton: () {
                  launchUrl(
                    Uri.parse(
                      personalInfo?.portfolioUrl ?? "",
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
    );
  }
}
