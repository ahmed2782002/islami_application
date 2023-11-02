import 'dart:async';

import 'package:flutter/material.dart';
import 'package:islami_app/Islami/Core/Provider/app_provider.dart';
import 'package:islami_app/Islami/modules/home_layout.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = "splash-screen";

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var appProvider = Provider.of<AppProvider>(context);
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, HomeLayout.routeName);
    });
    var mediaQuery = MediaQuery.of(context).size;

    return Scaffold(
      body: Image.asset(
        appProvider.splashScreen(),
        width: mediaQuery.width,
        height: mediaQuery.height,
        fit: BoxFit.cover,
      ),
    );
  }
}
