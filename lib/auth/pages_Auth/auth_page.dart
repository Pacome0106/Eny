import 'package:eny/auth/pages_Auth/login_screens.dart';
import 'package:eny/auth/pages_Auth/signup_page.dart';
import 'package:eny/widgets/app_text_large.dart';
import 'package:eny/widgets/colors.dart';
import 'package:flutter/material.dart';
import '../../widgets/app_text.dart';

class AuthantPage extends StatefulWidget {
  const AuthantPage({super.key});

  @override
  State<AuthantPage> createState() => _AuthantPageState();
}

class _AuthantPageState extends State<AuthantPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                  child: Row(
                    children: [
                      AppTextLarge(
                        text: 'E',
                        color: AppColors.activColor,
                        size: 50,
                      ),
                      AppTextLarge(
                        text: 'ny',
                        color: Theme.of(context).hintColor,
                        size: 40,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: AppText(
                    text:
                        '''Connectez-vous sur Eny avant de prendre une decision sur votre projet énergetique ''',
                    color: Theme.of(context).hintColor,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                TabBar(
                  enableFeedback: true,
                  dividerColor: Colors.transparent,
                  indicatorPadding: const EdgeInsets.only(bottom: 5.0),
                  indicatorWeight: 1,
                  mouseCursor: MouseCursor.uncontrolled,
                  indicatorColor: Theme.of(context).hintColor,
                  labelColor: Theme.of(context).hintColor,
                  unselectedLabelColor: Theme.of(context).hoverColor,
                  // isScrollable: true,
                  tabs: const [
                    Tab(text: "J'ai déjà un compte"),
                    Tab(text: "Pour la première fois"),
                  ],
                ),
                const SizedBox(
                  width: double.maxFinite,
                  height: 450,
                  child: TabBarView(
                    clipBehavior: Clip.hardEdge,
                    children: [
                      LoginPage(),
                      SignupPage(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
