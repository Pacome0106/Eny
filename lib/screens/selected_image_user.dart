// ignore_for_file: use_build_context_synchronously, prefer_typing_uninitialized_variables, non_constant_identifier_names, unnecessary_null_comparison

import 'dart:io';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import '../../widgets/colors.dart';
import '../../widgets/notification.dart';
import '../pages/home_page.dart';

//page qui donne la selection des photos apres les avoir selectionner dans la gallerie et qui propose de le accepter pour la publication
class SelectedImageUser extends StatefulWidget {
  const SelectedImageUser(
    this.imagePath, {
    Key? key,
    this.name,
    this.number_or_email,
    this.password,
    this.uid,
  }) : super(key: key);
  final String? imagePath;
  final name;
  final number_or_email;
  final password;
  final uid;

  @override
  State<SelectedImageUser> createState() => _SelectedImageUserState();
}

class _SelectedImageUserState extends State<SelectedImageUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bigTextColor,
      body: SafeArea(
        child: Stack(
            // PageView qui posse tout les photos selectionner
            children: [
              Container(
                height: double.maxFinite,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: FileImage(File(widget.imagePath!)),
                      fit: BoxFit.contain),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          child: Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(
                                left: 5, right: 5, top: 5, bottom: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: AppColors.activColor,
                            ),
                            child: const Icon(Icons.close,
                                size: 20, color: AppColors.mainTextColor),
                          ),
                          onTap: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomePage(
                                    currentIndex: 0,
                                  ),
                                ),
                                (route) => false);
                          },
                        ),
                        const SizedBox(),
                      ],
                    ),
                  ),
                  //container qui a l'indicateur des photos
                  Container(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        sizedbox, // button de publication
                        InkWell(
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
                            String urlPhoto = '';
                            //------------------
                            File compressedFile =
                                await FlutterNativeImage.compressImage(
                              widget.imagePath!,
                              quality: 30,
                            );

                            Uint8List image =
                                await File(widget.imagePath!).readAsBytes();
                            if (widget.imagePath != '') {
                              try {
                                var response = await FirebaseStorage.instance
                                    .ref('users_images/${widget.uid}')
                                    .putFile(
                                      compressedFile,
                                    );
                                if (response != null) {
                                  final storageRefPhotos = FirebaseStorage
                                      .instance
                                      .ref('users_images/');
                                  final islandRefPhoto =
                                      storageRefPhotos.child(widget.uid);
                                  urlPhoto =
                                      await islandRefPhoto.getDownloadURL();
                                  if (urlPhoto != '') {
                                    //update user
                                    await FirebaseFirestore.instance
                                        .collection('users')
                                        .doc(widget.uid)
                                        .set({
                                      'uid': widget.uid,
                                      'name': widget.name,
                                      'number_or_email': widget.number_or_email,
                                      'password': widget.password,
                                      'photo': urlPhoto,
                                    });
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                HomePage(currentIndex: 0)),
                                        (route) => false);
                                    notification(
                                        context, 'Mise à jour du profil', 60);
                                  }
                                }
                              } catch (e) {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomePage(
                                              currentIndex: 3,
                                            )),
                                    (route) => false);

                                if (e.toString().contains(
                                    '[firebase_auth/network-request-failed]')) {
                                  notification(context,
                                      'Verifier votre connexion !!!', 50);
                                } else {
                                  print(e.toString());
                                  notification(
                                      context,
                                      'Une erreur s\'est produit veillez essayé plus tard!!!',
                                      65);
                                }
                              }
                              //-----------------------------------
                            } else {
                              notification(
                                  context,
                                  'Une erreur s\'est produite au sauvegardage ! Esseyer plus tard !!!',
                                  60);
                            }
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.width * 0.14,
                            width: MediaQuery.of(context).size.width * 0.14,
                            decoration: const BoxDecoration(
                                color: AppColors.activColor,
                                shape: BoxShape.circle),
                            child: const Icon(
                              Icons.check,
                              color: AppColors.mainTextColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ]),
      ),
    );
  }
}
