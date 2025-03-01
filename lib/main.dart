import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/firebase_options.dart';
import 'package:portfolio/utils/app_router.dart';
import 'package:portfolio/utils/fonts.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: kFontPoppins,
        textTheme: Theme.of(context).textTheme.apply(fontFamily: kFontPoppins),
      ),
      routerConfig: AppRouter().router,
    );
  }
}
