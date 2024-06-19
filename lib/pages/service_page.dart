import 'package:flutter/material.dart';
import 'package:portfolio/utils/colors.dart';
import 'package:portfolio/utils/strings.dart';
import 'package:portfolio/widgets/customized_app_bar.dart';
import 'package:portfolio/widgets/end_drawer_mobile_view.dart';

final GlobalKey<ScaffoldState> _key = GlobalKey();

class ServicePage extends StatelessWidget {
  const ServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      backgroundColor: kPrimaryColor,
      drawerEnableOpenDragGesture: false,
      endDrawer: const EndDrawerMobileView(
        currentPageName: kTextServices,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          CustomizedAppBar(
            currentIndexName: kTextServices,
            onTapMenu: () {
              _key.currentState!.openEndDrawer();
            },
          ),
        ],
      ),
    );
  }
}
