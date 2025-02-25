import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:portfolio/bloc/service_page_bloc.dart';
import 'package:portfolio/data/vos/development_vo.dart';
import 'package:portfolio/utils/colors.dart';
import 'package:portfolio/utils/dimensions.dart';
import 'package:portfolio/utils/enums.dart';
import 'package:portfolio/utils/responsive.dart';
import 'package:portfolio/utils/strings.dart';
import 'package:portfolio/widgets/customized_app_bar.dart';
import 'package:portfolio/widgets/customized_text_view.dart';
import 'package:portfolio/widgets/end_drawer_mobile_view.dart';
import 'package:portfolio/widgets/hover_button.dart';
import 'package:portfolio/widgets/loading_state_widget.dart';
import 'package:provider/provider.dart';

final GlobalKey<ScaffoldState> _key = GlobalKey();

class ServicePage extends StatelessWidget {
  const ServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => ServicePageBloc(),
      child: Selector<ServicePageBloc, LoadingState>(
        selector: (_, bloc) => bloc.getLoadingState,
        builder: (BuildContext context, loadingState, Widget? child) =>
            LoadingStateWidget<ServicePageBloc>(
          loadingState: loadingState,
          widgetForSuccessState: Scaffold(
            key: _key,
            backgroundColor: kPrimaryColor,
            drawerEnableOpenDragGesture: false,
            endDrawer: const EndDrawerMobileView(
              currentPageName: kTextServices,
            ),
            body: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // CustomizedAppBar(
                //   currentIndexName: kTextServices,
                //   onTapMenu: () {
                //     _key.currentState!.openEndDrawer();
                //   },
                // ),
                const _ServicesSectionView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ServicesSectionView extends StatelessWidget {
  const _ServicesSectionView();

  @override
  Widget build(BuildContext context) {
    return Selector<ServicePageBloc, List<DevelopmentVO>?>(
      selector: (BuildContext context, bloc) => bloc.services,
      shouldRebuild: (prev, next) => prev != next,
      builder: (BuildContext context, services, Widget? child) => Responsive(
        mobile: _MobileServiceSectionView(
          services: services,
        ),
        tablet: Align(
          alignment: Alignment.center,
          child: _TabletServiceSectionView(
            services: services,
          ),
        ),
        desktop: _DesktopServiceSectionView(
          services: services,
        ),
      ),
    );
  }
}

class _MobileServiceSectionView extends StatelessWidget {
  const _MobileServiceSectionView({
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

class _TabletServiceSectionView extends StatelessWidget {
  const _TabletServiceSectionView({
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
        itemBuilder: (BuildContext context, int index, int pageViewIndex) =>
            SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(
              kMargin24,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kRadius20),
                border: Border.all(color: kHoveredColor)),
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

class _DesktopServiceSectionView extends StatelessWidget {
  const _DesktopServiceSectionView({
    this.services,
  });

  final List<DevelopmentVO>? services;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * (0.12),
          vertical: kMargin48,
        ),
        child: CarouselSlider.builder(
          itemCount: services?.length,
          itemBuilder: (BuildContext context, int index, int pageViewIndex) =>
              SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(
                kMargin24,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kRadius20),
                border: Border.all(
                  color: kHoveredColor,
                ),
              ),
              child: _DesktopServiceItemView(
                service: services?[index],
                serviceCount: index + 1,
              ),
            ),
          ),
          options: CarouselOptions(
            aspectRatio: 4 / 3,
            viewportFraction: 0.65,
            height: MediaQuery.of(context).size.height * 0.7,
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
            scrollDirection: Axis.vertical,
          ),
        ),
      ),
    );
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
