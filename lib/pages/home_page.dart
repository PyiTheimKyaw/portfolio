import 'package:flutter/material.dart';
import 'package:portfolio/utils/colors.dart';
import 'package:portfolio/utils/dimensions.dart';
import 'package:portfolio/utils/strings.dart';
import 'package:portfolio/widgets/customized_app_bar.dart';
import 'package:portfolio/widgets/customized_text_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Stack(
        alignment: Alignment.center,
        children: [
          CustomizedAppBar(
            currentIndexName: kTextHome,
          ),
        ],
      ),
    );
  }
}
