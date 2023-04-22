import 'package:eny/pages/accueil.dart';
import 'package:eny/widgets/app_text_large.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

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
        fillColorFn: (_, __) => charts.MaterialPalette.gray.shade400,
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
        fillColorFn: (_, __) => charts.MaterialPalette.green.shadeDefault
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

// // ignore_for_file: deprecated_member_use
// import 'package:eny/widgets/app_text.dart';
// import 'package:flutter/material.dart';
// import 'package:charts_flutter/flutter.dart' as charts;

// class DeveloperChartVideo extends StatelessWidget {
//   final List<DeveloperSeries> data;

//   const DeveloperChartVideo({super.key, required this.data});
//   @override
//   Widget build(BuildContext context) {
//     List<charts.Series<DeveloperSeries, String>> series = [
//       charts.Series(
//         id: "developers",
//         data: data,
//         domainFn: (DeveloperSeries series, _) => series.day,
//         measureFn: (DeveloperSeries series, _) => series.values,
//         colorFn: (_, __) => charts.MaterialPalette.yellow.shadeDefault,
//         fillColorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
//       )
//     ];

//     return Container(
//       color: Theme.of(context).backgroundColor,
//       width: double.maxFinite,
//       height: 250.0,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           AppText(
//             text: "Video view ",
//             color: Theme.of(context).hintColor,
//             size: 16,
//           ),
//           Expanded(
//             child: charts.BarChart(
//               defaultRenderer: charts.BarRendererConfig(
//                 cornerStrategy: const charts.ConstCornerStrategy(10),
//               ),
//               series,
//               animate: true,
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

// class DeveloperChartUsers extends StatelessWidget {
//   final List<DeveloperSeries> datas;

//   const DeveloperChartUsers({super.key, required this.datas, required List data});
//   @override
//   Widget build(BuildContext context) {
//     List<charts.Series<DeveloperSeries, String>> series = [
//       charts.Series(
//         id: "developers",
//         data: datas,
//         domainFn: (DeveloperSeries series, _) => series.day,
//         measureFn: (DeveloperSeries series, _) => series.values,
//         colorFn: (_, __) => charts.MaterialPalette.yellow.shadeDefault,
//         fillColorFn: (_, __) => charts.MaterialPalette.deepOrange.shadeDefault,
//       )
//     ];

//     return Container(
//       color: Theme.of(context).backgroundColor,
//       width: double.maxFinite,
//       height: 250.0,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           AppText(
//             text: "Active person",
//             color: Theme.of(context).hintColor,
//             size: 16,
//           ),
//           Expanded(
//             child: charts.BarChart(
//               defaultRenderer: charts.BarRendererConfig(
//                 cornerStrategy: const charts.ConstCornerStrategy(10),
//               ),
//               series,
//               animate: true,
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

// class DeveloperSeries {
//   final String day;
//   final int values;

//   DeveloperSeries({
//     required this.day,
//     required this.values,
//   });
// }
