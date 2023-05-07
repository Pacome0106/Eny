import 'package:eny/pages/accueil.dart';
import 'package:eny/widgets/app_text.dart';
import 'package:eny/widgets/app_text_large.dart';
import 'package:eny/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import '../pages/home_page.dart';

class DeveloperChart extends StatelessWidget {
  final List<DeveloperSeries> data;

  const DeveloperChart({super.key, required this.data});
  @override
  Widget build(BuildContext context) {
    List<charts.Series<DeveloperSeries, String>> series = [
      charts.Series(
          id: "developers",
          data: data,
          domainFn: (DeveloperSeries series, _) => series.year,
          measureFn: (DeveloperSeries series, _) => series.developers,
          colorFn: (_, __) => charts.MaterialPalette.yellow.shadeDefault,
          fillColorFn: (DeveloperSeries series, __) => series.color),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        AppTextLarge(
          text: "Diagramme de production mondiale en électricité ",
          color: Theme.of(context).hintColor,
          size: 18,
        ),
        sizedbox,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {
                pop(context, const [
                  Type(type: 'Pétrole', color: Colors.deepOrangeAccent),
                  Type(type: 'Charbon', color: Colors.blueGrey),
                  Type(type: 'Gaz naturel', color: Colors.grey),
                  Type(type: 'Bioénergie', color: Colors.greenAccent),
                  Type(type: 'Nucléaire', color: Colors.orange),
                  Type(type: 'Hydroélectricité', color: Colors.blue),
                  Type(
                      type: 'Autre énergie renouvelable',
                      color: Colors.lightBlue),
                ]);
              },
              child: AppTextLarge(
                text: "Légende",
                color: AppColors.activColor,
                size: 16,
              ),
            ),
            sizedbox2,
            const Icon(
              Icons.filter_none,
              size: 20,
              color: AppColors.activColor,
            )
          ],
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

class DeveloperChart2 extends StatelessWidget {
  final List<DeveloperSeries> data2;

  const DeveloperChart2({super.key, required this.data2});
  @override
  Widget build(BuildContext context) {
    List<charts.Series<DeveloperSeries, String>> series = [
      charts.Series(
          id: "developers",
          data: data2,
          domainFn: (DeveloperSeries series, _) => series.year,
          measureFn: (DeveloperSeries series, _) => series.developers,
          colorFn: (_, __) => charts.MaterialPalette.yellow.shadeDefault,
          fillColorFn: (DeveloperSeries series, __) => series.color),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        AppTextLarge(
          text: "Diagramme de production mondiale en électricité ",
          color: Theme.of(context).hintColor,
          size: 18,
        ),
        sizedbox,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {
                pop(context, const [
                  Type(type: 'Pétrole', color: Colors.deepOrangeAccent),
                  Type(type: 'Charbon', color: Colors.blueGrey),
                  Type(type: 'Gaz naturel', color: Colors.grey),
                  Type(type: 'Nucléaire', color: Colors.orange),
                  Type(type: 'Hydroélectricité', color: Colors.blue),
                  Type(
                      type:
                          'Énergies renouvelables hors hydroélectricité et déchets',
                      color: Colors.blueAccent),
                ]);
              },
              child: AppTextLarge(
                text: "Légende",
                color: AppColors.activColor,
                size: 16,
              ),
            ),
            sizedbox2,
            const Icon(
              Icons.filter_none,
              size: 20,
              color: AppColors.activColor,
            )
          ],
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

class DeveloperChart3 extends StatelessWidget {
  final List<DeveloperSeries> data3;

  const DeveloperChart3({super.key, required this.data3});
  @override
  Widget build(BuildContext context) {
    List<charts.Series<DeveloperSeries, String>> series = [
      charts.Series(
          id: "developers",
          data: data3,
          domainFn: (DeveloperSeries series, _) => series.year,
          measureFn: (DeveloperSeries series, _) => series.developers,
          colorFn: (_, __) => charts.MaterialPalette.yellow.shadeDefault,
          fillColorFn: (DeveloperSeries series, __) => series.color),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        AppTextLarge(
          text: "Diagramme de production mondiale en électricité ",
          color: Theme.of(context).hintColor,
          size: 18,
        ),
        sizedbox,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {
                pop(context, const [
                  Type(type: 'Charbon', color: Colors.blueGrey),
                  Type(type: 'Gaz naturel', color: Colors.grey),
                  Type(type: 'Bioénergie', color: Colors.greenAccent),
                  Type(type: 'Nucléaire', color: Colors.orange),
                  Type(type: 'Hydroélectricité', color: Colors.blue),
                  Type(type: 'Éolien', color: Colors.lightBlue),
                  Type(type: 'Solaire', color: Colors.orangeAccent),
                  Type(
                      type: 'Autre énergie renouvelable',
                      color: Colors.lightBlue),
                ]);
              },
              child: AppTextLarge(
                text: "Légende",
                color: AppColors.activColor,
                size: 16,
              ),
            ),
            sizedbox2,
            const Icon(
              Icons.filter_none,
              size: 20,
              color: AppColors.activColor,
            )
          ],
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

pop(context, List<Widget> list) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).focusColor,
          insetPadding: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          title: Center(
            child: Column(
              children: [
                AppTextLarge(
                  text: 'Légende',
                  size: 16,
                  color: Theme.of(context).hintColor,
                ),
                ListBody(
                  children: list,
                ),
              ],
            ),
          ),
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
          contentPadding:
              const EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context, rootNavigator: true).pop();
                },
                child: Container(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                    color: Theme.of(context).indicatorColor,
                  ),
                  height: 30,
                  width: 120,
                  child: AppTextLarge(
                      text: 'Fermer',
                      size: 18,
                      color: Theme.of(context).disabledColor),
                ),
              ),
            ],
          ),
        );
      });
}

class Type extends StatelessWidget {
  const Type({
    super.key,
    required this.type,
    required this.color,
  });
  final String type;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: color,
            ),
          ),
          sizedbox2,
          SizedBox(
            width: 150,
            child: AppText(
              text: type,
              color: Theme.of(context).hintColor,
            ),
          ),
        ],
      ),
    );
  }
}
