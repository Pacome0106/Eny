// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../widgets/app_text.dart';
import '../../widgets/app_text_large.dart';
import '../../widgets/colors.dart';
import '../../widgets/notification.dart';
import '../../widgets/textfield.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  TextEditingController email = TextEditingController();

  Future passwordRest() async {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
              child: Container(
            alignment: Alignment.center,
            width: 30,
            height: 30,
            child: const CircularProgressIndicator.adaptive(),
          ));
        });
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: email.text.trim());
      notification(
          context, 'Consulter boite mail pour un nouveau mot de passe', 65);
      Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
    } catch (e) {
      Navigator.of(context).pop();
      if (e.toString().contains('[firebase_auth/user-not-found]')) {
        notification(context, 'Votre e-mail est incorrect!!!', 50);
      } else if (e.toString().contains('[firebase_auth/invalid-email]')) {
        notification(context, 'Caractere incorrect !!!', 50);
      } else if (e
          .toString()
          .contains('[firebase_auth/network-request-failed]')) {
        notification(context, 'Verifier votre connexion !!!', 50);
      } else {
        notification(context,
            'Une erreur s\'est produit veillez essayé plus tard!!!', 65);
      }
    }
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  padding: const EdgeInsets.all(0),
                  icon: const Icon(Icons.navigate_before),
                  iconSize: 35,
                  color: AppColors.activColor,
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/login', (route) => false);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
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
                const TabBar(
                  enableFeedback: true,
                  dividerColor: Colors.transparent,
                  // isScrollable: true,
                  tabs: [
                    Tab(text: ""),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                SizedBox(
                  width: double.maxFinite,
                  height: 450,
                  child: TabBarView(
                    clipBehavior: Clip.hardEdge,
                    children: [_forgot()],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _forgot() {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                AppTextLarge(
                  text:
                      'Entrer votre Email et vous allez reçevoir un nouveau mot de passe ',
                  size: 16,
                  color: Theme.of(context).hintColor,
                ),
                const SizedBox(
                  height: 50.0,
                ),
                textEdit(
                  email,
                  'e-mail...',
                  1,
                  TextInputType.text,
                  true,
                  false,
                  'E-mail',
                  AppColors.activColor,
                  context,
                  false,
                  Icons.mail,
                ),
                const SizedBox(
                  height: 50.0,
                ),
                GestureDetector(
                  onTap: () async {
                    passwordRest();
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.01),
                    child: Container(
                      alignment: Alignment.center,
                      height: 50.0,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: AppColors.activColor,
                      ),
                      child: AppTextLarge(
                        text: 'RESTAURER',
                        size: 18,
                        color: AppColors.mainColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
