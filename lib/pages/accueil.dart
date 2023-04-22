import 'package:eny/widgets/app_text.dart';
import 'package:eny/widgets/app_text_large.dart';
import 'package:eny/widgets/developper_chart.dart';
import 'package:flutter/material.dart';

import 'package:charts_flutter/flutter.dart' as charts;

class Acceuil extends StatefulWidget {
  const Acceuil({super.key});

  @override
  State<Acceuil> createState() => _AcceuilState();
}

class _AcceuilState extends State<Acceuil> {
  @override
  Widget build(BuildContext context) {
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
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey),
                        child: const Icon(Icons.person),
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
                    height: 320,
                    child: TabBarView(
                      children: [
                        DeveloperChart(
                          data: data,
                        ),
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
                        width: 180,
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
                        width: 180,
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
                      card(100, 120, '22.5', 'jaz', Colors.red, Colors.black,
                          16, 15),
                      card(100, 120, '0.0', 'jaz', Colors.red, Colors.black, 16,
                          15),
                      card(100, 120, '0.0', 'jaz', Colors.red, Colors.black, 16,
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
      padding: const EdgeInsets.all(5.0),
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35.0),
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
