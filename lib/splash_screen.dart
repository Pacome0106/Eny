// ignore_for_file: deprecated_member_use, unused_local_variable, sized_box_for_whitespace

import 'dart:async';

import 'package:eny/pages/home_page.dart';
import 'package:eny/provider/dark_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
          (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    bool isTheme = themeChange.darkTheme;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(children: [
              Container(
                height: 120,
                width: 120,
                // decoration:
                // isTheme
                // ? const BoxDecoration(
                //     image: DecorationImage(
                //       image: AssetImage("images/splash1.png"),
                //     ),
                //   )
                // : const BoxDecoration(
                //     image: DecorationImage(
                //       image: AssetImage("images/splash2.png"),
                //     ),
                //   ),
              ),
            ]),
            Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.3),
              alignment: Alignment.bottomCenter,
              width: 30,
              height: 30,
              child: const CircularProgressIndicator.adaptive(),
            ),
          ],
        ),
      )),
    );
  }
}
