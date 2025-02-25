import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:portfolio/data/vos/skills_vo.dart';
import 'package:portfolio/widgets/hover_text_button.dart';
import 'package:provider/provider.dart';

import '../bloc/home_page_bloc.dart';
import '../data/vos/development_vo.dart';
import '../utils/colors.dart';
import '../utils/dimensions.dart';
import '../utils/responsive.dart';
import '../utils/strings.dart';
import 'customized_text_view.dart';
import 'hover_button.dart';

class SkillsSectionView extends StatelessWidget {
  const SkillsSectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kSkillSectionBgColor,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: kMargin24),
      child: Column(
        children: [
          const CustomizedTextView(
            textData: kTextWhatICanDo,
            textFontSize: kFont24,
            textFontWeight: FontWeight.w600,
          ),
          Responsive(
            mobile: Container(),
            tablet: _DesktopSkillSectionView(
              // skills: skills,
              isTablet: true,
            ),
            desktop: _DesktopSkillSectionView(
              // skills: skills,
            ),
          ),
        ],
      ),
    );
  }
}

class _MobileSkillSectionView extends StatelessWidget {
  const _MobileSkillSectionView({
    this.services,
  });

  final List<DevelopmentVO>? services;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05,
            vertical: kMargin16,
          ),
          itemCount: services?.length,
          itemBuilder: (context, index) {
            return _DesktopServiceItemView(
              serviceCount: index + 1,
              service: services?[index],
              isMobile: true,
            );
          }),
    );
  }
}

class _TabletSkillSectionView extends StatelessWidget {
  const _TabletSkillSectionView({
    this.services,
  });

  final List<DevelopmentVO>? services;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.12,
        vertical: kMargin48,
      ),
      child: CarouselSlider.builder(
        itemCount: services?.length,
        itemBuilder: (BuildContext context, int index, int pageViewIndex) => SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(
              kMargin24,
            ),
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(kRadius20), border: Border.all(color: kHoveredColor)),
            child: _TabletServiceItemView(
              service: services?[index],
              serviceCount: index + 1,
            ),
          ),
        ),
        options: CarouselOptions(
          aspectRatio: 4 / 3,
          viewportFraction: 0.6,
          height: MediaQuery.of(context).size.height * 0.6,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 2),
          autoPlayAnimationDuration: const Duration(milliseconds: 600),
          autoPlayCurve: Curves.easeInBack,
          enlargeCenterPage: true,
          enlargeFactor: 0.6,
          // onPageChanged: callbackFunction,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}

class _TabletServiceItemView extends StatelessWidget {
  const _TabletServiceItemView({
    this.service,
    required this.serviceCount,
  });

  final DevelopmentVO? service;
  final int serviceCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomizedTextView(
              textData: NumberFormat('00').format(serviceCount),
              textFontWeight: FontWeight.bold,
              textFontSize: kFont24,
            ),
            const Spacer(),
            HoverButton(
              onTapBtn: () {},
              isIconOnly: true,
              icon: FontAwesomeIcons.arrowDownUpLock,
            )
          ],
        ),
        const SizedBox(
          height: kMargin32,
        ),
        CustomizedTextView(
          textData: service?.serviceName ?? "",
          textFontSize: kFont24,
          textFontWeight: FontWeight.bold,
        ),
        CustomizedTextView(
          textData: service?.languages?.join(" , ") ?? "",
          textFontSize: kFont16,
          textFontWeight: FontWeight.w400,
        ),
        const SizedBox(
          height: kMargin24,
        ),
        CustomizedTextView(
          textData: service?.description ?? "",
          textFontSize: kFont14,
          textHeight: 2,
        ),
      ],
    );
  }
}

class _DesktopSkillSectionView extends StatelessWidget {
  const _DesktopSkillSectionView({
    this.isTablet = false,
  });

  final bool? isTablet;

  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageBloc>(
      builder: (BuildContext context, bloc, Widget? child) {
        print("object changed ${bloc.hoveredDevelopment.toString()}");
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * ((isTablet ?? false) ? 0.06 : 0.2),
            vertical: kMargin48,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //Developments
              // Flexible(
              //   child: GridView.builder(
              //       itemCount: services?.length,
              //       shrinkWrap: true,
              //       physics: const NeverScrollableScrollPhysics(),
              //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //           crossAxisSpacing: kMargin12, mainAxisSpacing: kMargin12, crossAxisCount: 2, childAspectRatio:1.8),
              //       itemBuilder: (context, index) {
              //         final skill = services?[index];
              //         if (skill != null) {
              //           return _DevelopmentItemView(
              //             skill: skill,
              //           );
              //         } else {
              //           return const SizedBox.shrink();
              //         }
              //       }),
              // ),

              // Expanded(
              //   child: Column(
              //     children: [
              //       Row(
              //         children: [
              //           _DevelopmentItemView(skill: services?[0]),
              //           _DevelopmentItemView(skill: services?[1]),
              //
              //         ],
              //       ),
              //       Row(
              //         children: [
              //           _DevelopmentItemView(skill: services?[2]),
              //           _DevelopmentItemView(skill: services?[3]),
              //
              //         ],
              //       ),
              //     ],
              //   ),
              // ),
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 450,
                ),
                child: HoverWidget(builder: (isHovered) {
                  print("Is hoveded ${isHovered}");
                  return Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      ...?bloc.skills?.developments?.map((skill) {
                        return _DevelopmentItemView(
                          skill: skill,
                        );
                      })
                    ],
                  );
                }),
              ),
              const SizedBox(
                width: kMargin48,
              ),
              Flexible(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 500,
                  ),
                  child: Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      ...?bloc.skills?.languages?.map((lang) {
                        return Container(
                          padding: const EdgeInsets.all(
                            kMargin12,
                          ),
                          decoration: BoxDecoration(
                            color: (bloc.hoveredDevelopment?.languages?.contains(lang.id) ?? false)
                                ? Colors.red
                                : kSillItemBgColor,
                            borderRadius: BorderRadius.circular(
                              kRadius15,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.network(
                                lang.imageUrl,
                                width: kDownloadIconSize,
                                height: kDownloadIconSize,
                              ),
                              const SizedBox(
                                width: kMargin8,
                              ),
                              CustomizedTextView(
                                textData: bloc.hoveredDevelopment?.serviceName ?? "",
                                textFontSize: kFont12,
                              ),
                            ],
                          ),
                        );
                      })
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _DevelopmentItemView extends StatelessWidget {
  const _DevelopmentItemView({
    required this.skill,
  });

  final DevelopmentVO? skill;

  @override
  Widget build(BuildContext context) {
    return HoverWidget(builder: (isHovered) {
        // skill?.isHovered = isHovered;
      final bloc = Provider.of<HomePageBloc>(context,listen: false);
      bloc.onSetSkillHovered(dev: skill, isHovered: isHovered);
      print("Skii hover or nor ${skill?.serviceName}, ${skill?.isHovered}");

      return Container(
        width: 200,
        padding: const EdgeInsets.all(
          kMargin16,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            kRadius10,
          ),
          color: kSillItemBgColor,
          border: Border.all(
            color: (isHovered) ? kHoveredColor : kSillItemBgColor,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(
              skill?.imageUrl ?? "",
              width: kSkillsIconTabletSize,
              height: kSkillsIconTabletSize,
              color: (isHovered) ? kHoveredColor : kWhiteColor,
            ),
            const SizedBox(
              width: kMargin12,
            ),
            CustomizedTextView(
              textData: skill?.serviceName ?? "",
              textColor: (isHovered) ? kHoveredColor : kWhiteColor,
            )
          ],
        ),
      );
    });
  }
}

class _DesktopServiceItemView extends StatelessWidget {
  const _DesktopServiceItemView({
    this.service,
    required this.serviceCount,
    this.isMobile,
  });

  final DevelopmentVO? service;
  final int serviceCount;
  final bool? isMobile;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomizedTextView(
              textData: NumberFormat('00').format(serviceCount),
              textFontWeight: FontWeight.bold,
              textFontSize: kFont24,
            ),
            const Spacer(),
            HoverButton(
              onTapBtn: () {},
              isIconOnly: true,
              icon: FontAwesomeIcons.arrowDownUpLock,
            )
          ],
        ),
        const SizedBox(
          height: kMargin32,
        ),
        CustomizedTextView(
          textData: service?.serviceName ?? "",
          textFontSize: kFont24,
          textFontWeight: FontWeight.bold,
        ),
        CustomizedTextView(
          textData: service?.languages?.join(" , ") ?? "",
          textFontSize: kFont16,
          textFontWeight: FontWeight.w400,
        ),
        const SizedBox(
          height: kMargin24,
        ),
        CustomizedTextView(
          textData: service?.description ?? "",
          textFontSize: kFont14,
          textHeight: 2,
        ),
        const SizedBox(
          height: kMargin24,
        ),
        Visibility(visible: (isMobile ?? false), child: const Divider()),
      ],
    );
  }
}
