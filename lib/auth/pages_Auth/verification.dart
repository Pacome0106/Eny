// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eny/pages/home_page.dart';
import 'package:eny/widgets/notification.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../widgets/app_text.dart';
import '../../widgets/app_text_large.dart';
import '../../widgets/colors.dart';

class Verification extends StatefulWidget {
  const Verification({
    super.key,
    required this.verify,
    required this.number,
    required this.name,
    required this.password,
    required this.source,
  });
  final String verify;
  final String name;
  final String number;
  final String password;
  final String source;

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future logup() async {
    final theuser = FirebaseAuth.instance.currentUser;
    await FirebaseFirestore.instance.collection('users').doc(theuser!.uid).set({
      'uid': theuser.uid,
      'name': widget.name,
      'number_or_email': widget.number,
      'password': widget.password,
      'photo': '',
    });
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
          fontSize: 20, color: Color(0xFF1E3C57), fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.activColor),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: const Color(0xFF72B2EE)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color(0xFFEAEFF3),
      ),
    );
    return Scaffold(
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
                      context, '/', (route) => false);
                },
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
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
                    const SizedBox(height: 30),
                    Center(
                      child: Column(
                        children: [
                          AppTextLarge(
                            text: '''Vérification du numero ''',
                            color: Theme.of(context).hintColor,
                            size: 18,
                          ),
                          AppText(
                            text:
                                '''Entrez le code que vous avez reçue sur le numero''',
                            color: Theme.of(context).hintColor,
                          ),
                          sizedbox,
                          AppText(
                            text: widget.number,
                            color: Theme.of(context).hintColor,
                            size: 16,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    Center(
                      child: Pinput(
                        length: 6,
                        defaultPinTheme: defaultPinTheme,
                        focusedPinTheme: focusedPinTheme,
                        submittedPinTheme: submittedPinTheme,
                        onCompleted: (pin) async {
                          try {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return Center(
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 30,
                                    height: 30,
                                    child: const CircularProgressIndicator
                                        .adaptive(),
                                  ),
                                );
                              },
                            );
                            PhoneAuthCredential credential =
                                PhoneAuthProvider.credential(
                                    verificationId: widget.verify,
                                    smsCode: pin);
                            // Sign the user in (or link) with the credential
                            await auth.signInWithCredential(credential);
                            if (widget.source == "logup") {
                              logup();
                            }
                            print(pin);
                          } catch (e) {
                            Navigator.of(context).pop();
                            notification(context,
                                "Code de vérification invalid !!!", 50);
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AppTextLarge(
                            text: "J'ai pas reçue le code?",
                            size: 16,
                            color: Theme.of(context).hintColor,
                          ),
                          GestureDetector(
                            onTap: () async {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return Center(
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 30,
                                      height: 30,
                                      child: const CircularProgressIndicator
                                          .adaptive(),
                                    ),
                                  );
                                },
                              );
                              await FirebaseAuth.instance.verifyPhoneNumber(
                                phoneNumber: widget.number,
                                verificationCompleted:
                                    (PhoneAuthCredential credential) {},
                                verificationFailed: (FirebaseAuthException e) {
                                  print(e.message);
                                },
                                codeSent:
                                    (String verificationId, int? resendToken) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Verification(
                                        verify: verificationId,
                                        name: widget.name,
                                        number: widget.number,
                                        password: widget.password,
                                        source: widget.source,
                                      ),
                                    ),
                                  );
                                },
                                codeAutoRetrievalTimeout:
                                    (String verificationId) {},
                              );
                            },
                            child: AppTextLarge(
                              text: "Renvoyer",
                              size: 16,
                              color: AppColors.activColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
