import 'package:charts_flutter/flutter.dart' as charts;
import 'package:eny/pages/similator.dart';
import 'package:eny/widgets/app_text.dart';
import 'package:eny/widgets/app_text_large.dart';
import 'package:eny/widgets/colors.dart';
import 'package:flutter/material.dart';

class SegmentsLineChart extends StatefulWidget {
  final List<charts.Series<dynamic, String>> seriesList;

  const SegmentsLineChart(
    this.seriesList, {
    super.key,
  });

  factory SegmentsLineChart.withSampleData() {
    return SegmentsLineChart(
      _createSampleData().cast<charts.Series<dynamic, String>>(),
    );
  }

  @override
  State<SegmentsLineChart> createState() => _SegmentsLineChartState();

  static List<charts.Series<TimeSeriesSales, DateTime>> _createSampleData() {
    final desktopSalesData = [
      TimeSeriesSales(DateTime(2017, 9, 19), 5),
      TimeSeriesSales(DateTime(2017, 9, 26), 25),
      TimeSeriesSales(DateTime(2017, 10, 3), 100),
      TimeSeriesSales(DateTime(2017, 10, 10), 75),
    ];

    final tableSalesData = [
      TimeSeriesSales(DateTime(2017, 9, 19), 10),
      TimeSeriesSales(DateTime(2017, 9, 26), 50),
      TimeSeriesSales(DateTime(2017, 10, 3), 200),
      TimeSeriesSales(DateTime(2017, 10, 10), 150),
    ];

    final mobileSalesData = [
      TimeSeriesSales(DateTime(2017, 9, 19), 10),
      TimeSeriesSales(DateTime(2017, 9, 26), 50),
      TimeSeriesSales(DateTime(2017, 10, 3), 200),
      TimeSeriesSales(DateTime(2017, 10, 10), 150),
    ];

    return [
      charts.Series<TimeSeriesSales, DateTime>(
        id: 'Desktop',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (TimeSeriesSales sales, _) => sales.time,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        data: desktopSalesData,
      ),
      charts.Series<TimeSeriesSales, DateTime>(
        id: 'Tablet',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (TimeSeriesSales sales, _) => sales.time,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        data: tableSalesData,
      ),
      charts.Series<TimeSeriesSales, DateTime>(
          id: 'Mobile',
          colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
          domainFn: (TimeSeriesSales sales, _) => sales.time,
          measureFn: (TimeSeriesSales sales, _) => sales.sales,
          data: mobileSalesData)
        ..setAttribute(charts.rendererIdKey, 'customPoint'),
    ];
  }
}

class _SegmentsLineChartState extends State<SegmentsLineChart> {
  TextEditingController carbon_credit = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: (){
                Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Similator(),
                              
                            ),
                            (route) => false);
              },
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(left: 20, top: 20),
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Theme.of(context).buttonColor,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.arrow_back_ios),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  child: AppTextLarge(
                    size: 18,
                    text: 'Graphique',
                    color: Theme.of(context).hintColor,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 300,
              width: double.maxFinite,
              child: charts.TimeSeriesChart(
                widget.seriesList.cast<charts.Series<dynamic, DateTime>>(),
                defaultRenderer: charts.LineRendererConfig(),
                customSeriesRenderers: [
                  charts.PointRendererConfig(customRendererId: 'customPoint')
                ],
                dateTimeFactory: const charts.LocalDateTimeFactory(),
              ),
            ),
            Container(
              width: double.maxFinite,
              height: 500.0,
              decoration:  BoxDecoration(
                color: Theme.of(context).hoverColor,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(150.0),
                  topLeft: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppTextLarge(text: '''Donnees Esthimatif
trouver apres Operation
                    ''', color:Theme.of(context).hintColor, size: 16),
                    const SizedBox(height: 20),
                    Column(children: [
                      card(const Icon(Icons.update), 'Carbon credit', '128.9'),
                      const SizedBox(height: 20),
                      card(const Icon(Icons.ac_unit),
                          'Time to return to indleness', '12 mois'),
                      const SizedBox(height: 20),
                      card(const Icon(Icons.spa), 'Ecological benefit',
                          '1234.6'),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                  text: 'Number of jobs cr.',
                                  color:Theme.of(context).hintColor,
                                  size: 18),
                              Container(
                                padding: const EdgeInsets.all(10),
                                height: 45,
                                width: 155.0,
                                decoration: BoxDecoration(
                                    color: AppColors.mainColor,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Icon(Icons.directions_walk, size: 30),
                                    AppTextLarge(
                                        text: '1.000.000',
                                        color:Theme.of(context).hintColor,
                                        size: 18)
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                  text: 'Annual budget cont.',
                                  color: Theme.of(context).hintColor,
                                  size: 18),
                              Container(
                                padding: const EdgeInsets.all(10),
                                height: 45,
                                width: 165.0,
                                decoration: BoxDecoration(
                                    color:AppColors.mainColor,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Icon(Icons.monetization_on, size: 30),
                                    AppTextLarge(
                                        text: '50.000.000',
                                        color:Theme.of(context).hintColor,
                                        size: 18)
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ]),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }

  Widget card(
    Icon icon,
    String text,
    String resulat,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            margin: const EdgeInsets.only(top: 35.0),
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              color: AppColors.mainColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: icon),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(text: text, color: AppColors.bigTextColor, size: 16),
            const SizedBox(height: 10),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(left: 10, right: 10),
              height: 45,
              width: 200,
              decoration: BoxDecoration(
                color: AppColors.mainColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: AppTextLarge(
                color: Theme.of(context as BuildContext).hintColor,
                text: resulat,
                size: 18,
              ),
            ),
          ],
        )
      ],
    );
  }
}

class TimeSeriesSales {
  final DateTime time;
  final int sales;

  TimeSeriesSales(this.time, this.sales);
}
