import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:portfolio/bloc/projects_page_bloc.dart';
import 'package:portfolio/data/vos/project_vo.dart';
import 'package:portfolio/utils/colors.dart';
import 'package:portfolio/utils/dimensions.dart';
import 'package:portfolio/utils/responsive.dart';
import 'package:portfolio/utils/strings.dart';
import 'package:portfolio/widgets/customized_app_bar.dart';
import 'package:portfolio/widgets/customized_text_view.dart';
import 'package:portfolio/widgets/end_drawer_mobile_view.dart';
import 'package:portfolio/widgets/hover_button.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

final GlobalKey<ScaffoldState> _key = GlobalKey();

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => ProjectsPageBloc(),
      child: Scaffold(
        key: _key,
        backgroundColor: kPrimaryColor,
        drawerEnableOpenDragGesture: false,
        endDrawer: const EndDrawerMobileView(
          currentPageName: kTextProjects,
        ),
        body: Padding(
          padding: const EdgeInsets.only(bottom: kMargin24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomizedAppBar(
                currentIndexName: kTextProjects,
                onTapMenu: () {
                  _key.currentState!.openEndDrawer();
                },
              ),
              const SizedBox(
                height: kMargin48,
              ),
              const _ProjectsListSectionView(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProjectsListSectionView extends StatefulWidget {
  const _ProjectsListSectionView();

  @override
  State<_ProjectsListSectionView> createState() => _ProjectsListSectionViewState();
}

class _ProjectsListSectionViewState extends State<_ProjectsListSectionView> with TickerProviderStateMixin {
  late PageController _pageViewController;

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Selector<ProjectsPageBloc, List<ProjectVO>?>(
      selector: (BuildContext context, bloc) => bloc.projects,
      builder: (BuildContext context, projects, Widget? child) => Responsive(
        mobile: _TabletAndMobileProjectsSectionView(
          pageViewController: _pageViewController,
          projects: projects,
          isMobile: true,
        ),
        tablet: _TabletAndMobileProjectsSectionView(
          pageViewController: _pageViewController,
          projects: projects,
        ),
        desktop: _DesktopProjectsSectionView(
          pageViewController: _pageViewController,
          projects: projects,
        ),
      ),
    );
  }
}

class _TabletAndMobileProjectsSectionView extends StatelessWidget {
  const _TabletAndMobileProjectsSectionView({
    required PageController pageViewController,
    this.projects,
    this.isMobile,
  }) : _pageViewController = pageViewController;

  final PageController _pageViewController;
  final List<ProjectVO>? projects;
  final bool? isMobile;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
          controller: _pageViewController,
          itemCount: projects?.length,
          itemBuilder: (context, index) {
            return _TabletAndMobileProjectItemView(
              project: projects?[index],
              onTapBack: () {
                _pageViewController.previousPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              },
              onTapForward: () {
                _pageViewController.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              },
              isMobile: isMobile,
            );
          }),
    );
  }
}

class _DesktopProjectsSectionView extends StatelessWidget {
  const _DesktopProjectsSectionView({
    required PageController pageViewController,
    this.projects,
  }) : _pageViewController = pageViewController;

  final PageController _pageViewController;
  final List<ProjectVO>? projects;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
          controller: _pageViewController,
          itemCount: projects?.length,
          itemBuilder: (context, index) {
            return _DesktopProjectItemView(
              project: projects?[index],
              onTapBack: () {
                _pageViewController.previousPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              },
              onTapForward: () {
                _pageViewController.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              },
            );
          }),
    );
  }
}

class _TabletAndMobileProjectItemView extends StatelessWidget {
  const _TabletAndMobileProjectItemView({
    this.project,
    required this.onTapBack,
    required this.onTapForward,
    this.isMobile = false,
  });

  final ProjectVO? project;
  final Function onTapBack;
  final Function onTapForward;
  final bool? isMobile;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * ((isMobile ?? false) ? 0.05 : 0.12),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Expanded(child: Container()),
            _ProjectImageView(
              project: project,
              onTapBack: onTapBack,
              onTapForward: onTapForward,
              isMobile: isMobile,
            ),
            _ProjectInfoView(
              project: project,
            ),
          ],
        ),
      ),
    );
  }
}

class _DesktopProjectItemView extends StatelessWidget {
  const _DesktopProjectItemView({
    this.project,
    required this.onTapBack,
    required this.onTapForward,
  });

  final ProjectVO? project;
  final Function onTapBack;
  final Function onTapForward;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * (0.15),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Expanded(child: Container()),
          Expanded(
            flex: 1,
            child: _ProjectInfoView(
              project: project,
            ),
          ),
          const SizedBox(
            width: kMargin24,
          ),
          Expanded(
            flex: 2,
            child: _ProjectImageView(
              project: project,
              onTapBack: onTapBack,
              onTapForward: onTapForward,
            ),
          ),
          // Expanded(child: Container()),
        ],
      ),
    );
  }
}

class _ProjectImageView extends StatelessWidget {
  const _ProjectImageView({
    required this.project,
    required this.onTapBack,
    required this.onTapForward,
    this.isMobile = false,
  });

  final ProjectVO? project;
  final Function onTapBack;
  final Function onTapForward;
  final bool? isMobile;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(
          visible: isMobile ?? false,
          replacement: Image.asset(
            project?.image ?? "",
          ),
          child: Stack(alignment: Alignment.center, children: [
            Image.asset(
              project?.image ?? "",
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                decoration: const BoxDecoration(
                  color: kHoveredColor,
                ),
                child: IconButton(
                  onPressed: () {
                    onTapBack();
                  },
                  icon: const Icon(Icons.arrow_back_ios_new),
                  color: kBlackColor,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                decoration: const BoxDecoration(
                  color: kHoveredColor,
                ),
                child: IconButton(
                  onPressed: () {
                    onTapForward();
                  },
                  icon: const Icon(Icons.arrow_forward_ios),
                  color: kBlackColor,
                ),
              ),
            ),
          ]),
        ),
        const SizedBox(
          height: kMargin16,
        ),
        Visibility(
          visible: !(isMobile ?? false),
          child: Row(
            children: [
              const Expanded(child: SizedBox.shrink()),
              Container(
                decoration: const BoxDecoration(
                  color: kHoveredColor,
                ),
                child: IconButton(
                  onPressed: () {
                    onTapBack();
                  },
                  icon: const Icon(Icons.arrow_back_ios_new),
                  color: kBlackColor,
                ),
              ),
              const SizedBox(
                width: kMargin12,
              ),
              Container(
                decoration: const BoxDecoration(
                  color: kHoveredColor,
                ),
                child: IconButton(
                  onPressed: () {
                    onTapForward();
                  },
                  icon: const Icon(Icons.arrow_forward_ios),
                  color: kBlackColor,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class _ProjectInfoView extends StatelessWidget {
  const _ProjectInfoView({
    this.project,
  });

  final ProjectVO? project;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomizedTextView(
          textData: NumberFormat('00').format(project?.id),
          textFontWeight: FontWeight.bold,
          textFontSize: kFont32,
        ),
        const SizedBox(
          height: kMargin24,
        ),
        CustomizedTextView(
          textData: project?.projectName ?? "",
          textFontSize: kFont24,
          textFontWeight: FontWeight.bold,
        ),
        const SizedBox(
          height: kMargin24,
        ),
        CustomizedTextView(
          textData: project?.projectInfo ?? "",
          textFontSize: kFont18,
          textFontWeight: FontWeight.w400,
          textColor: kWhiteColor.withOpacity(
            0.5,
          ),
        ),
        const SizedBox(
          height: kMargin24,
        ),
        CustomizedTextView(
          textData: project?.platforms ?? "",
          textFontSize: kFont20,
          textColor: kHoveredColor,
          textFontWeight: FontWeight.w600,
        ),
        const SizedBox(
          height: kMargin24,
        ),
        const Divider(),
        const SizedBox(
          height: kMargin24,
        ),
        Row(
          children: [
            HoverButton(
              onTapBtn: () {
                launchUrl(
                  Uri.parse(project?.url ?? ""),
                );
              },
              fontAweIcon: FontAwesomeIcons.github,
              isIconOnly: true,
            ),
            const SizedBox(
              width: kMargin8,
            ),
            Visibility(
              visible: project?.appUrl != null,
              child: HoverButton(
                onTapBtn: () {
                  launchUrl(
                    Uri.parse(project?.appUrl ?? ""),
                  );
                },
                btnPadding: kMargin8,
                btnText: kTextApk,
                fontAweIcon: FontAwesomeIcons.download,
                isIconOnly: false,
              ),
            ),
            const SizedBox(
              width: kMargin8,
            ),
            Visibility(
              visible: project?.recordUrl != null,
              child: HoverButton(
                onTapBtn: () {
                  launchUrl(
                    Uri.parse(project?.recordUrl ?? ""),
                  );
                },
                btnPadding: kMargin8,
                btnText: kTextRecord,
                fontAweIcon: FontAwesomeIcons.video,
                isIconOnly: false,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
