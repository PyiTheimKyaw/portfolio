import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:photo_view/photo_view.dart';
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
        body: Column(
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
              index: index,
              totalProjCount: projects?.length ?? 0,
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
              index: index,
              totalProjCount: projects?.length ?? 0,
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
    required this.index,
    required this.totalProjCount,
  });

  final ProjectVO? project;
  final Function onTapBack;
  final Function onTapForward;
  final bool? isMobile;
  final int index;
  final int totalProjCount;

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
              index: index,
              totalProjCount: totalProjCount,
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
    required this.index,
    required this.totalProjCount,
  });

  final ProjectVO? project;
  final Function onTapBack;
  final Function onTapForward;
  final int index;
  final int totalProjCount;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * (0.12),
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
                index: index,
                totalProjCount: totalProjCount,
              ),
            ),
            // Expanded(child: Container()),
          ],
        ),
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
    required this.index,
    required this.totalProjCount,
  });

  final ProjectVO? project;
  final Function onTapBack;
  final Function onTapForward;
  final bool? isMobile;
  final int index;
  final int totalProjCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    clipBehavior: Clip.antiAlias,
                    backgroundColor: Colors.transparent,
                    insetPadding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
                    child: Stack(
                      children: [
                        PhotoView(
                          backgroundDecoration: const BoxDecoration(color: Colors.transparent),
                          imageProvider: AssetImage(project?.image ?? ""),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: const EdgeInsets.only(top: kMargin32),
                            child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.close),
                              color: Colors.red,
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                });
          },
          child: Visibility(
            visible: isMobile ?? false,
            replacement: Image.asset(
              project?.image ?? "",
            ),
            child: Stack(alignment: Alignment.center, children: [
              Image.asset(
                project?.image ?? "",
              ),
              Visibility(
                visible: index != 0,
                child: Align(
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
              ),
              Visibility(
                visible: (index + 1) < totalProjCount,
                child: Align(
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
              ),
            ]),
          ),
        ),
        const SizedBox(
          height: kMargin16,
        ),
        Visibility(
          visible: !(isMobile ?? false),
          child: Row(
            children: [
              const Expanded(child: SizedBox.shrink()),
              Visibility(
                visible: index != 0,
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
              const SizedBox(
                width: kMargin12,
              ),
              Visibility(
                visible: (index + 1) < totalProjCount,
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
          textFontSize: kFont14,
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
            Visibility(
              visible: project?.url != null,
              child: Padding(
                padding: const EdgeInsets.only(right: kMargin8),
                child: HoverButton(
                  onTapBtn: () {
                    launchUrl(
                      Uri.parse(project?.url ?? ""),
                    );
                  },
                  fontAweIcon: FontAwesomeIcons.github,
                  isIconOnly: true,
                ),
              ),
            ),
            Visibility(
              visible: project?.androidUrl != null,
              child: Padding(
                padding: const EdgeInsets.only(right: kMargin8),
                child: HoverButton(
                  onTapBtn: () {
                    launchUrl(
                      Uri.parse(project?.androidUrl ?? ""),
                    );
                  },
                  btnPadding: kMargin8,
                  btnText: kTextApk,
                  fontAweIcon: FontAwesomeIcons.download,
                  isIconOnly: false,
                ),
              ),
            ),
            Visibility(
              visible: project?.iosUrl != null,
              child: Padding(
                padding: const EdgeInsets.only(right: kMargin8),
                child: HoverButton(
                  onTapBtn: () {
                    launchUrl(
                      Uri.parse(project?.iosUrl ?? ""),
                    );
                  },
                  btnPadding: kMargin8,
                  btnText: kTextIos,
                  fontAweIcon: FontAwesomeIcons.download,
                  isIconOnly: false,
                ),
              ),
            ),
            Visibility(
              visible: project?.webUrl != null,
              child: Padding(
                padding: const EdgeInsets.only(right: kMargin8),
                child: HoverButton(
                  onTapBtn: () {
                    launchUrl(
                      Uri.parse(project?.webUrl ?? ""),
                    );
                  },
                  btnPadding: kMargin8,
                  btnText: kTextWeb,
                  fontAweIcon: FontAwesomeIcons.desktop,
                  isIconOnly: false,
                ),
              ),
            ),
            Visibility(
              visible: project?.recordUrl != null,
              child: Padding(
                padding: const EdgeInsets.only(right: kMargin8),
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
            ),
          ],
        ),
      ],
    );
  }
}
