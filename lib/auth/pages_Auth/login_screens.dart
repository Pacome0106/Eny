// ignore_for_file: use_build_context_synchronously, avoid_print, unused_field

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eny/auth/pages_Auth/verification.dart';
import 'package:eny/widgets/app_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../firebase_options.dart';
import '../../pages/home_page.dart';
import '../../widgets/app_text_large.dart';
import '../../widgets/colors.dart';
import '../../widgets/notification.dart';
import '../../widgets/textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static String number = "";
  static String verify = "";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final theuser = FirebaseAuth.instance.currentUser;
  TextEditingController number = TextEditingController();
  TextEditingController password = TextEditingController();
  final _fromKey = GlobalKey<FormState>();
  Map userUid = {};
  int count = 0;

  Future signIn() async {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Container(
            alignment: Alignment.center,
            width: 30,
            height: 30,
            child: const CircularProgressIndicator.adaptive(),
          ),
        );
      },
    );
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: number.text.trim(),
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
        if (e.message == "TOO_SHORT") {
          notification(context, "Votre numero n'est pas complet !!!", 50);
        } else if (e.message == "TOO_LONG") {
          notification(
              context,
              "Code postal incorrect ou Votre numero dépasse la taille normale !!!",
              60);
        } else {
          notification(context,
              "Une erreur s'est produite ! Veillez reessayé plutard !!!", 60);
        }
      },
      codeSent: (String verificationId, int? resendToken) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Verification(
              verify: verificationId,
              name: '',
              number: number.text,
              password: password.text,
              source: "login",
            ),
          ),
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  Future verifyPassword() async {
    print('1');
    await FirebaseFirestore.instance
        .collection('users')
        .where('number_or_email', isEqualTo: number.text)
        .where('password', isEqualTo: password.text)
        .get()
        .then((value) {
      for (var user in value.docs) {
        print('2');
        userUid = {};
        userUid = user.data();
        setState(() {
          userUid;
          print('xxxxxxxXx$userUid');
        });
      }
    });
    print('3');
    if (userUid.isEmpty == true && count < 3) {
      count++;
      print('4');
      notification(context, "Les identifiants sont fausses !!!", 50);
    }
    if (count == 3) {
      notification(
          context,
          "Les identifiants sont fausses!!! Veillez créer un compte ou cliquez sur 'Mot de passe oublié'",
          70);
      count = 0;
    }
    print('5');
    if (userUid.isNotEmpty == true) {
      signIn();
    }
  }

  Future signupGoogle() async {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Container(
            alignment: Alignment.center,
            width: 30,
            height: 30,
            child: const CircularProgressIndicator.adaptive(),
          ),
        );
      },
    );
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn(
            clientId: DefaultFirebaseOptions.currentPlatform.iosClientId)
        .signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential);
    logup();
  }

  Future logup() async {
    final theuser = FirebaseAuth.instance.currentUser;
    await FirebaseFirestore.instance.collection('users').doc(theuser!.uid).set({
      'uid': theuser.uid,
      'name': theuser.displayName,
      'number_or_email': theuser.email,
      'password': '',
      'photo': theuser.photoURL,
    });
  }

  @override
  void dispose() {
    number.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  void initState() {
    number.text = '+243';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                sizedbox,
                sizedbox,
                textEdit(
                  number,
                  'numéro...',
                  1,
                  TextInputType.phone,
                  true,
                  false,
                  'TELEPHONE',
                  AppColors.activColor,
                  context,
                  false,
                  Icons.phone,
                ),
                sizedbox,
                textEdit(
                  password,
                  'mot de passe...',
                  1,
                  TextInputType.text,
                  true,
                  false,
                  'MOT DE PASSE',
                  AppColors.activColor,
                  context,
                  true,
                  Icons.lock,
                ),
                sizedbox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(context, '/forgot'),
                      child: AppTextLarge(
                        text: 'Mot de passe oublié?',
                        size: 16,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                  ],
                ),
                sizedbox,
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: () async {
                    //login onTap
                    verifyPassword();
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
                        text: 'SE CONNECTER',
                        size: 18,
                        color: AppColors.mainColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 20),
                      height: 2,
                      width: 100,
                      color: AppColors.simpleFondColor2,
                    ),
                    AppText(text: 'ou', color: Theme.of(context).hintColor),
                    Container(
                      margin: const EdgeInsets.only(left: 20),
                      height: 2,
                      width: 100,
                      color: AppColors.simpleFondColor2,
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: () async {
                    //login onTap google
                    signupGoogle();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 50.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: AppColors.activColor,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('images/google.png'),
                            ),
                          ),
                        ),
                        sizedbox2,
                        AppTextLarge(
                          text: 'Continuer avec Google',
                          size: 18,
                          color: Theme.of(context).hintColor,
                        ),
                      ],
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
