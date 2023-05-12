// ignore_for_file: use_build_context_synchronously, non_constant_identifier_names

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eny/pages/home_page.dart';
import 'package:eny/provider/dark_theme_provider.dart';
import 'package:eny/widgets/app_text.dart';
import 'package:eny/widgets/app_text_large.dart';
import 'package:eny/widgets/developper_chart.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../screens/selected_image_user.dart';
import '../widgets/colors.dart';

class Acceuil extends StatefulWidget {
  const Acceuil({super.key});

  @override
  State<Acceuil> createState() => _AcceuilState();
}

class _AcceuilState extends State<Acceuil> {
  Map<String, dynamic>? userData;
  final theuser = FirebaseAuth.instance.currentUser;
  final ImagePicker _picker = ImagePicker();
  File? imagePath;
  bool isUser = false;

  Future getUser() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(theuser!.uid)
        .get()
        .then((value) {
      userData = value.data();
    });
    if (userData != null) {
      isUser = true;
      if (!mounted) {
        return;
      }
      setState(() {
        userData;
        isUser;
      });
    }
    print(userData!['name']);
  }

  selectImages(
      String name, String number_or_email, String password, String uid) async {
    final image = await _picker.pickImage(source: ImageSource.gallery);
    if (image == null) {
      return null;
    } else {
      File? img = File(image.path);
      setState(() {
        imagePath = img;
      });
    }
    if (imagePath != null) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => SelectedImageUser(
              imagePath!.path,
              name: name,
              number_or_email: number_or_email,
              password: password,
              uid: uid,
            ),
          ),
          (route) => false);
    } else {
      // print("error");
    }
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    bool isTheme = themeChange.darkTheme;

    final List<DeveloperSeries> data = [
      DeveloperSeries(
        year: "Pet",
        developers: 31.4,
        color: charts.ColorUtil.fromDartColor(Colors.deepOrangeAccent),
      ),
      DeveloperSeries(
        year: "Cha",
        developers: 29.0,
        color: charts.ColorUtil.fromDartColor(Colors.blueGrey),
      ),
      DeveloperSeries(
        year: "Gaz",
        developers: 21.3,
        color: charts.ColorUtil.fromDartColor(Colors.grey),
      ),
      DeveloperSeries(
        year: "Bio",
        developers: 10.0,
        color: charts.ColorUtil.fromDartColor(Colors.greenAccent),
      ),
      DeveloperSeries(
        year: "Nuc",
        developers: 4.8,
        color: charts.ColorUtil.fromDartColor(Colors.orange),
      ),
      DeveloperSeries(
        year: "Hyd",
        developers: 2.4,
        color: charts.ColorUtil.fromDartColor(Colors.blue),
      ),
      DeveloperSeries(
        year: "Aut",
        developers: 1.1,
        color: charts.ColorUtil.fromDartColor(Colors.lightBlue),
      ),
    ];
//----------
    final List<DeveloperSeries> data2 = [
      DeveloperSeries(
        year: "Pet",
        developers: 2.9,
        color: charts.ColorUtil.fromDartColor(Colors.deepOrangeAccent),
      ),
      DeveloperSeries(
          year: "Cha",
          developers: 38.2,
          color: charts.ColorUtil.fromDartColor(Colors.blueGrey)),
      DeveloperSeries(
        year: "Gaz",
        developers: 23.1,
        color: charts.ColorUtil.fromDartColor(Colors.grey),
      ),
      DeveloperSeries(
        year: "Nuc",
        developers: 10.2,
        color: charts.ColorUtil.fromDartColor(Colors.orange),
      ),
      DeveloperSeries(
        year: "Hyd",
        developers: 15.8,
        color: charts.ColorUtil.fromDartColor(Colors.blue),
      ),
      DeveloperSeries(
        year: "Enr",
        developers: 9.8,
        color: charts.ColorUtil.fromDartColor(Colors.blueAccent),
      ),
    ];
    //---------
    final List<DeveloperSeries> data3 = [
      DeveloperSeries(
        year: "Cha",
        developers: 35.7,
        color: charts.ColorUtil.fromDartColor(Colors.blueGrey),
      ),
      DeveloperSeries(
        year: "Gaz",
        developers: 22.2,
        color: charts.ColorUtil.fromDartColor(Colors.grey),
      ),
      DeveloperSeries(
        year: "Bio",
        developers: 2.4,
        color: charts.ColorUtil.fromDartColor(Colors.greenAccent),
      ),
      DeveloperSeries(
        year: "Nuc",
        developers: 9.2,
        color: charts.ColorUtil.fromDartColor(Colors.orange),
      ),
      DeveloperSeries(
        year: "Hyd",
        developers: 15.1,
        color: charts.ColorUtil.fromDartColor(Colors.blue),
      ),
      DeveloperSeries(
        year: "Eol",
        developers: 7.6,
        color: charts.ColorUtil.fromDartColor(Colors.lightBlue),
      ),
      DeveloperSeries(
        year: "Sol",
        developers: 4.5,
        color: charts.ColorUtil.fromDartColor(Colors.orangeAccent),
      ),
      DeveloperSeries(
        year: "Aut",
        developers: 3.3,
        color: charts.ColorUtil.fromDartColor(Colors.lightBlue),
      ),
    ];
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        width: 50,
                      ),
                      AppTextLarge(
                        text: "Analyse",
                        color: Theme.of(context).hintColor,
                      ),
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              elevation: 10,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0,
                                      right: 20,
                                      top: 10,
                                      bottom: 20),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Container(
                                          alignment: Alignment.center,
                                          height: 8,
                                          width: 50,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: Theme.of(context).hoverColor,
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            isTheme = !isTheme;
                                            themeChange.darkTheme = isTheme;
                                            setState(
                                              () {
                                                isTheme;
                                              },
                                            );
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.only(
                                                right: 10),
                                            alignment: Alignment.topRight,
                                            child: isTheme
                                                ? const Icon(Icons.light_mode,
                                                    size: 30)
                                                : const Icon(
                                                    Icons.nights_stay_sharp,
                                                    size: 30),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Stack(
                                            alignment: Alignment.bottomRight,
                                            children: [
                                              Container(
                                                height: 140,
                                                width: 140,
                                                decoration: isUser &&
                                                        userData!['photo'] != ""
                                                    ? BoxDecoration(
                                                        image: DecorationImage(
                                                          image: NetworkImage(
                                                              userData![
                                                                  'photo']),
                                                          fit: BoxFit.cover,
                                                        ),
                                                        color: Theme.of(context)
                                                            .hoverColor,
                                                        shape: BoxShape.circle,
                                                        border: Border.all(
                                                          color:
                                                              Theme.of(context)
                                                                  .buttonColor,
                                                          width: 2,
                                                        ),
                                                      )
                                                    : BoxDecoration(
                                                        color: Theme.of(context)
                                                            .hoverColor,
                                                        shape: BoxShape.circle,
                                                        border: Border.all(
                                                          color:
                                                              Theme.of(context)
                                                                  .buttonColor,
                                                          width: 2,
                                                        ),
                                                      ),
                                              ),
                                              Positioned(
                                                child: InkWell(
                                                  onTap: () => selectImages(
                                                    userData!['name'],
                                                    userData![
                                                        'number_or_email'],
                                                    userData!['password'],
                                                    userData!['uid'],
                                                  ),
                                                  child: Container(
                                                    height: 45.0,
                                                    width: 45.0,
                                                    decoration: BoxDecoration(
                                                      color: Theme.of(context)
                                                          .hoverColor,
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                        color: Theme.of(context)
                                                            .buttonColor,
                                                        width: 2,
                                                      ),
                                                    ),
                                                    child: Icon(
                                                        Icons.add_a_photo,
                                                        color: Theme.of(context)
                                                            .hintColor,
                                                        size: 25),
                                                  ),
                                                ),
                                              )
                                            ]),
                                        sizedbox,
                                        sizedbox,
                                        Container(
                                          alignment: Alignment.centerLeft,
                                          child: Row(
                                            children: [
                                              Icon(Icons.person,
                                                  size: 30,
                                                  color: Theme.of(context)
                                                      .bottomAppBarColor),
                                              const SizedBox(width: 20),
                                              isUser
                                                  ? AppTextLarge(
                                                      text: userData!['name'],
                                                      color: Theme.of(context)
                                                          .hintColor,
                                                      size: 16,
                                                    )
                                                  : Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.5,
                                                      height: 16,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            borderRadius,
                                                        color: Theme.of(context)
                                                            .focusColor,
                                                      ),
                                                    ),
                                            ],
                                          ),
                                        ),
                                        sizedbox,
                                        sizedbox,
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              alignment: Alignment.centerLeft,
                                              child: Row(
                                                children: [
                                                  Icon(Icons.mail,
                                                      size: 30,
                                                      color: Theme.of(context)
                                                          .bottomAppBarColor),
                                                  const SizedBox(width: 20),
                                                  isUser
                                                      ? AppTextLarge(
                                                          text: userData![
                                                              'number_or_email'],
                                                          color:
                                                              Theme.of(context)
                                                                  .hintColor,
                                                          size: 16,
                                                        )
                                                      : Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.5,
                                                          height: 16,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                borderRadius,
                                                            color: Theme.of(
                                                                    context)
                                                                .focusColor,
                                                          ),
                                                        ),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                CircleAvatar(
                                                  radius: 20,
                                                  backgroundColor:
                                                      Theme.of(context)
                                                          .focusColor,
                                                  child: const Icon(
                                                    Icons.send,
                                                    size: 20,
                                                    color: AppColors.activColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        sizedbox,
                                        GestureDetector(
                                          onTap: () async {
                                            showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    backgroundColor:
                                                        Theme.of(context)
                                                            .focusColor,
                                                    insetPadding:
                                                        const EdgeInsets.only(
                                                      left: 20,
                                                      right: 20,
                                                    ),
                                                    title: Center(
                                                      child: AppText(
                                                        text:
                                                            'Souhaitez-vous vous déconnecter ?',
                                                        size: 14,
                                                        color: Theme.of(context)
                                                            .disabledColor,
                                                      ),
                                                    ),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                borderRadius),
                                                    contentPadding:
                                                        const EdgeInsets.only(
                                                            top: 20,
                                                            bottom: 20,
                                                            left: 10,
                                                            right: 10),
                                                    content: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () async {
                                                            await FirebaseAuth
                                                                .instance
                                                                .signOut();
                                                            Navigator
                                                                .pushNamedAndRemoveUntil(
                                                                    context,
                                                                    '/',
                                                                    (route) =>
                                                                        false);
                                                          },
                                                          child: Container(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 8,
                                                                    right: 8),
                                                            alignment: Alignment
                                                                .center,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                20,
                                                              ),
                                                              border:
                                                                  Border.all(
                                                                color: AppColors
                                                                    .poweroffColor,
                                                                width: 1,
                                                              ),
                                                            ),
                                                            height: 30,
                                                            width: 120,
                                                            child: AppTextLarge(
                                                              text:
                                                                  'Déconnecter',
                                                              size: 18,
                                                              color: AppColors
                                                                  .poweroffColor,
                                                            ),
                                                          ),
                                                        ),
                                                        sizedbox2,
                                                        sizedbox2,
                                                        GestureDetector(
                                                          onTap: () {
                                                            setState(() {
                                                              Navigator.of(
                                                                      context,
                                                                      rootNavigator:
                                                                          true)
                                                                  .pop();
                                                            });
                                                          },
                                                          child: Container(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 8,
                                                                    right: 8),
                                                            alignment: Alignment
                                                                .center,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
                                                                color: Theme.of(
                                                                        context)
                                                                    .indicatorColor),
                                                            height: 30,
                                                            width: 120,
                                                            child: AppTextLarge(
                                                                text: 'Annuler',
                                                                size: 18,
                                                                color: Theme.of(
                                                                        context)
                                                                    .disabledColor),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                });
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20, top: 40, right: 20),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    AppTextLarge(
                                                        text: 'Se déconnecter',
                                                        size: 18,
                                                        color: AppColors
                                                            .poweroffColor),
                                                    sizedbox2,
                                                    Container(
                                                      height: 40,
                                                      width: 40,
                                                      decoration: BoxDecoration(
                                                        color: Theme.of(context)
                                                            .focusColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(25),
                                                        border: Border.all(
                                                            color: AppColors
                                                                .poweroffColor,
                                                            width: 2),
                                                      ),
                                                      child: const Icon(
                                                          Icons.logout_rounded,
                                                          color: AppColors
                                                              .poweroffColor),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              });
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: isUser && userData!['photo'] != ""
                              ? BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.grey,
                                  image: DecorationImage(
                                    image: NetworkImage(userData!['photo']),
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.grey,
                                ),
                          child: isUser
                              ? userData!['photo'] == ""
                                  ? const Icon(Icons.person)
                                  : null
                              : null,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 30),
                  Container(
                    height: 45.0,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.grey),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: TabBar(
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicator: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(25.0)),
                      mouseCursor: MouseCursor.uncontrolled,
                      indicatorColor: Theme.of(context).hintColor,
                      labelColor: Theme.of(context).hintColor,
                      unselectedLabelColor: Theme.of(context).hoverColor,
                      tabs: [
                        Tab(
                          child: AppTextLarge(
                            text: '2012',
                            color: Theme.of(context).hintColor,
                            size: 16,
                          ),
                        ),
                        Tab(
                          child: AppTextLarge(
                            text: '2017',
                            color: Theme.of(context).hintColor,
                            size: 16,
                          ),
                        ),
                        Tab(
                          child: AppTextLarge(
                            text: '2022',
                            color: Theme.of(context).hintColor,
                            size: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 20),
                    width: double.maxFinite,
                    height: 350,
                    child: TabBarView(
                      children: [
                        DeveloperChart(data: data),
                        DeveloperChart2(data2: data2),
                        DeveloperChart3(data3: data3),
                        // LoginPage(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                            top: 5.0, left: 5.0, right: 5.0),
                        width: MediaQuery.of(context).size.width * 0.42,
                        height: 75,
                        decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Colors.grey),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const CircleAvatar(
                                  radius: 20.0,
                                  backgroundColor: Color(0xFFF07649),
                                ),
                                AppTextLarge(
                                  size: 30,
                                  text: '67.1',
                                  color: Theme.of(context).hintColor,
                                ),
                                AppTextLarge(
                                  size: 14,
                                  text: '%',
                                  color: Theme.of(context).hintColor,
                                ),
                              ],
                            ),
                            AppText(
                              text: 'Non renouvelables ',
                              color: Theme.of(context).hintColor,
                              size: 16,
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            top: 5.0, left: 5.0, right: 5.0),
                        width: MediaQuery.of(context).size.width * 0.42,
                        height: 75,
                        decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Colors.grey),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Color(0xFF3CB7EB),
                                ),
                                AppTextLarge(
                                  size: 30,
                                  text: '32.9',
                                  color: Theme.of(context).hintColor,
                                ),
                                AppTextLarge(
                                  size: 14,
                                  text: '%',
                                  color: Theme.of(context).hintColor,
                                ),
                              ],
                            ),
                            AppText(
                              text: 'Renouvelables',
                              color: Theme.of(context).hintColor,
                              size: 16,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      AppTextLarge(
                          text: "Puissance de la R.D.C en (MW) :",
                          size: 18,
                          color: Theme.of(context).hintColor),
                    ],
                  ),
                  sizedbox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      card(
                          MediaQuery.of(context).size.width * 0.26,
                          120,
                          '3000',
                          'Demandée',
                          Colors.red,
                          Theme.of(context).hintColor,
                          16,
                          15),
                      card(
                          MediaQuery.of(context).size.width * 0.26,
                          120,
                          '2442',
                          'Installée',
                          Colors.red,
                          Theme.of(context).hintColor,
                          16,
                          15),
                      card(
                          MediaQuery.of(context).size.width * 0.26,
                          120,
                          '1281',
                          'Fournie',
                          Colors.red,
                          Theme.of(context).hintColor,
                          16,
                          15),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget card(
    double width,
    double height,
    String titre,
    String text,
    Color color1,
    Color color2,
    double size,
    double radius,
  ) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      padding: const EdgeInsets.all(5.0),
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: const Color(0xFFD6D3D3),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 1,
            offset: Offset(4, 4), // Shadow position
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(
            Icons.energy_savings_leaf_rounded,
            size: 25,
            color: Theme.of(context).canvasColor,
          ),
          AppTextLarge(
            size: 30,
            text: titre,
            color: color1,
          ),
          AppTextLarge(
            text: text,
            color: color2,
            size: size,
          )
        ],
      ),
    );
  }

  Widget developperchart(final List<DeveloperSeries> datas,
      {required List<DeveloperSeries> data}) {
    List<charts.Series<DeveloperSeries, String>> series = [
      charts.Series(
        id: "developers",
        data: datas,
        domainFn: (DeveloperSeries series, _) => series.year,
        measureFn: (DeveloperSeries series, _) => series.developers,
        colorFn: (_, __) => charts.MaterialPalette.yellow.shadeDefault,
        fillColorFn: (_, __) => charts.MaterialPalette.deepOrange.shadeDefault,
      )
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        AppTextLarge(
          text: "Diagramme",
          color: Theme.of(context).hintColor,
          size: 18,
        ),
        Expanded(
          child: charts.BarChart(
            defaultRenderer: charts.BarRendererConfig(
              cornerStrategy: const charts.ConstCornerStrategy(10),
            ),
            series,
            animate: true,
          ),
        )
      ],
    );
  }
}

class DeveloperSeries {
  final String year;
  final double developers;
  final charts.Color color;

  DeveloperSeries({
    required this.year,
    required this.developers,
    required this.color,
  });
}
