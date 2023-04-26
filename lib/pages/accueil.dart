import 'package:eny/pages/home_page.dart';
import 'package:eny/provider/dark_theme_provider.dart';
import 'package:eny/widgets/app_text.dart';
import 'package:eny/widgets/app_text_large.dart';
import 'package:eny/widgets/developper_chart.dart';
import 'package:flutter/material.dart';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:provider/provider.dart';

import '../widgets/colors.dart';

class Acceuil extends StatefulWidget {
  const Acceuil({super.key});

  @override
  State<Acceuil> createState() => _AcceuilState();
}

class _AcceuilState extends State<Acceuil> {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    bool isTheme = themeChange.darkTheme;
    final List<DeveloperSeries> data = [
      DeveloperSeries(year: "Sol", developers: 40000),
      DeveloperSeries(year: "Hyd", developers: 5000),
      DeveloperSeries(year: "Eol", developers: 40000),
      DeveloperSeries(year: "Geo", developers: 35000),
      DeveloperSeries(year: "Ther", developers: 45000),
      DeveloperSeries(year: "Bio", developers: 25000),
      DeveloperSeries(year: "Nuc", developers: 15000),
    ];
    final List<DeveloperSeries> data2 = [
      DeveloperSeries(year: "Sol", developers: 10000),
      DeveloperSeries(year: "Hyd", developers: 50000),
      DeveloperSeries(year: "Eol", developers: 0000),
      DeveloperSeries(year: "Geo", developers: 35000),
      DeveloperSeries(year: "Ther", developers: 45000),
      DeveloperSeries(year: "Bio", developers: 25000),
      DeveloperSeries(year: "Nuc", developers: 15000),
    ];
    final List<DeveloperSeries> data3 = [
      DeveloperSeries(year: "Sol", developers: 5000),
      DeveloperSeries(year: "Hyd", developers: 1000),
      DeveloperSeries(year: "Eol", developers: 8000),
      DeveloperSeries(year: "Geo", developers: 7000),
      DeveloperSeries(year: "Ther", developers: 2000),
      DeveloperSeries(year: "Bio", developers: 6000),
      DeveloperSeries(year: "Nuc", developers: 8000),
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
                                                decoration: BoxDecoration(
                                                  image: const DecorationImage(
                                                      image: AssetImage(
                                                          'images/profil.png')),
                                                  color: Theme.of(context)
                                                      .hoverColor,
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                    color: Theme.of(context)
                                                        .buttonColor,
                                                    width: 2,
                                                  ),
                                                ),
                                              ),
                                              Positioned(
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
                                                  child: const Icon(
                                                      Icons.add_a_photo,
                                                      color: AppColors
                                                          .bigTextColor,
                                                      size: 30),
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
                                              AppTextLarge(
                                                text: 'Binja Zihalirwa Gisele',
                                                color:
                                                    Theme.of(context).hintColor,
                                                size: 16,
                                              )
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
                                                  Icon(Icons.phone,
                                                      size: 30,
                                                      color: Theme.of(context)
                                                          .bottomAppBarColor),
                                                  const SizedBox(width: 20),
                                                  AppTextLarge(
                                                    text: '+243 975 024 769',
                                                    color: Theme.of(context)
                                                        .hintColor,
                                                    size: 16,
                                                  )
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
                                                    Icons.phone,
                                                    size: 20,
                                                    color: AppColors.activColor,
                                                  ),
                                                ),
                                                sizedbox2,
                                                CircleAvatar(
                                                  radius: 20,
                                                  backgroundColor:
                                                      Theme.of(context)
                                                          .focusColor,
                                                  child: const Icon(
                                                    Icons.message_rounded,
                                                    size: 20,
                                                    color: AppColors.activColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
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
                                                  AppTextLarge(
                                                    text:
                                                        'Giselebinja@gmail.com',
                                                    color: Theme.of(context)
                                                        .hintColor,
                                                    size: 16,
                                                  )
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
                                                    Icons.mail,
                                                    size: 20,
                                                    color: AppColors.activColor,
                                                  ),
                                                ),
                                                sizedbox2,
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
                                                          onTap: () async {},
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
                                                          onTap: () {},
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
                                                              color: Theme.of(
                                                                      context)
                                                                  .indicatorColor,
                                                            ),
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
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.grey),
                          child: const Icon(Icons.person),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 50),
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
                            text: '2005',
                            color: Colors.black,
                            size: 16,
                          ),
                        ),
                        Tab(
                          child: AppTextLarge(
                            text: '2018',
                            color: Colors.black,
                            size: 16,
                          ),
                        ),
                        Tab(
                          child: AppTextLarge(
                            text: '2022',
                            color: Colors.black,
                            size: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 20),
                    width: double.maxFinite,
                    height: 290,
                    child: TabBarView(
                      children: [
                        DeveloperChart(data: data),
                        DeveloperChart2(data2: data2),
                        DeveloperChart3(data3: data3),
                        // LoginPage(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
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
                                  backgroundColor: Colors.green,
                                ),
                                AppTextLarge(
                                  size: 30,
                                  text: '',
                                  color: Colors.black,
                                ),
                                AppTextLarge(
                                  size: 14,
                                  text: '%',
                                  color: Colors.black,
                                ),
                              ],
                            ),
                            AppText(
                              text: 'Geothermie ',
                              color: Colors.black,
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
                                  backgroundColor: Colors.white,
                                ),
                                AppTextLarge(
                                  size: 30,
                                  text: '12.8',
                                  color: Colors.black,
                                ),
                                AppTextLarge(
                                  size: 14,
                                  text: '%',
                                  color: Colors.black,
                                ),
                              ],
                            ),
                            AppText(
                              text: 'Hydrolique ',
                              color: Colors.black,
                              size: 16,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      card(MediaQuery.of(context).size.width * 0.26, 120,
                          '22.5', 'jaz', Colors.red, Colors.black, 16, 15),
                      card(MediaQuery.of(context).size.width * 0.26, 120, '0.0',
                          'jaz', Colors.red, Colors.black, 16, 15),
                      card(MediaQuery.of(context).size.width * 0.26, 120, '0.0',
                          'jaz', Colors.red, Colors.black, 16, 15),
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
          CircleAvatar(
            radius: radius,
            backgroundColor: Colors.white,
            child: const Icon(
              Icons.edit,
              size: 20,
            ),
          ),
          AppTextLarge(
            size: 35,
            text: titre,
            color: color1,
          ),
          AppText(
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
  final int developers;

  DeveloperSeries({
    required this.year,
    required this.developers,
  });
}
