// ignore_for_file: avoid_print, prefer_typing_uninitialized_variables

import 'dart:typed_data';

import 'package:eny/auth/pages_Auth/verification.dart';
import 'package:eny/pages/home_page.dart';
import 'package:eny/provider/dark_theme_provider.dart';
import 'package:eny/widgets/dark_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import 'auth/main_page.dart';
import 'auth/pages_Auth/auth_page.dart';
import 'auth/pages_Auth/forgot_pw_page.dart';
import 'auth/pages_Auth/signup_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key, this.cameras});
  final cameras;
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChandeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    themeChandeProvider.darkTheme =
        await themeChandeProvider.darkThemePreferences.getTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          return themeChandeProvider;
        }),
      ],
      child: Consumer<DarkThemeProvider>(
        builder: (context, themeData, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Eklezia',
            theme: Styles.themeData(themeChandeProvider.darkTheme, context),
            initialRoute: '/',
            routes: {
              '/': (context) => const MainPage(),
              '/home': (context) => HomePage(),
              '/login': (context) => const AuthantPage(),
              // '/verification': (context) => const Verification(),
              '/signup': (context) => const SignupPage(),
              '/forgot': (context) => const ForgotPasswordPage(),
            },
          );
        },
      ),
    );
  }
}
