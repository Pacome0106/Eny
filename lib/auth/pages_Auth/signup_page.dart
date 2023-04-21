// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eny/auth/pages_Auth/verification.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../firebase_options.dart';
import '../../pages/home_page.dart';
import '../../widgets/app_text.dart';
import '../../widgets/app_text_large.dart';
import '../../widgets/colors.dart';
import '../../widgets/notification.dart';
import '../../widgets/textfield.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController name = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmePassword = TextEditingController();

  final FirebaseAuth auth = FirebaseAuth.instance;

  Future verify() async {
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
              name: name.text.trim().toLowerCase(),
              number: number.text.trim(),
              password: password.text.trim(),
              source: "logup",
            ),
          ),
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
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
                  name,
                  'nom...',
                  1,
                  TextInputType.text,
                  true,
                  false,
                  'NOM',
                  AppColors.activColor,
                  context,
                  false,
                  Icons.person,
                ),
                sizedbox,
                textEdit(
                  number,
                  'numéro...',
                  1,
                  TextInputType.text,
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
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () async {
                    //logup onTap
                    verify();
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
                        text: 'CREER UN COMPTE',
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
