/*
ဒီ widget သည် network or json က data တွေက်ို fetch တဲ့အခါ fetching status က loading / error/ success ပေါ်မူတည်ပြီး
widget တွေ switch ပြီးပြပေးန်ုင်မယ့် reusable widget ဖြစ်ပါတယ်။
Fetching process တွေနဲ့ သုံးရတဲ့ screen တိုင်းမှာ ဒီ widget က်ို အသုံးပြုသင့်ပါသည်
 */
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/bloc/base_bloc.dart';
import 'package:portfolio/utils/dimensions.dart';
import 'package:portfolio/utils/enums.dart';

class LoadingStateWidget<T extends BaseBloc> extends StatelessWidget {
  const LoadingStateWidget(
      {super.key,
      required this.loadingState,
      this.dialogLoadingState = LoadingState.success,
      this.widgetForLoadingState,
      this.loadingDialogColor,
      required this.widgetForSuccessState});

  final Widget? widgetForLoadingState;
  final Widget widgetForSuccessState;
  final LoadingState loadingState;
  final Color? loadingDialogColor;
  final LoadingState? dialogLoadingState;

  @override
  Widget build(BuildContext context) {
    return switch (loadingState) {
      LoadingState.loading => Center(
          child: widgetForLoadingState ??
              Lottie.asset(
                'assets/jsons/lottie_loading.json',
                width: kLoadingAniSize,
                height: kLoadingAniSize,
                fit: BoxFit.fill,
              ),
        ),
      _ => widgetForSuccessState,
    };
  }
}
