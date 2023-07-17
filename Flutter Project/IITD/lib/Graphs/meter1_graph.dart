// import 'package:flutter/material.dart';
// import 'package:charts_flutter/flutter.dart' as charts;
// import 'package:iitd/LandingPage/Meter1.dart';
//
// class Meter1Graph extends StatelessWidget {
//   final List<HistoryData> historyData;
//   final bool animate;
//
//   Meter1Graph({required this.historyData, required this.animate});
//
//   @override
//   List<charts.Series<HistoryData, String>> createChartSeries(List<HistoryData> data) {
//     return [
//       charts.Series<HistoryData, String>(
//         id: 'I1',
//         colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
//         domainFn: (HistoryData data, _) => data.time,
//         measureFn: (HistoryData data, _) => data.i1,
//         data: data,
//         labelAccessorFn: (HistoryData data, _) => '${data.i1} A',
//       ),
//       charts.Series<HistoryData, String>(
//         id: 'I2',
//         colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
//         domainFn: (HistoryData data, _) => data.time,
//         measureFn: (HistoryData data, _) => data.i2,
//         data: data,
//         labelAccessorFn: (HistoryData data, _) => '${data.i2} A',
//       ),
//       charts.Series<HistoryData, String>(
//         id: 'I3',
//         colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
//         domainFn: (HistoryData data, _) => data.time,
//         measureFn: (HistoryData data, _) => data.i3,
//         data: data,
//         labelAccessorFn: (HistoryData data, _) => '${data.i3} A',
//       ),
//     ];
//   }
//   Widget buildChart() {
//     List<HistoryData> selectedData = getHistoryData(selectedOption);
//     List<charts.Series<HistoryData, String>> series = createChartSeries(selectedData);
//
//     return Container(
//       height: 300,
//       padding: EdgeInsets.all(16.0),
//       child: charts.BarChart(
//         series,
//         animate: true,
//         barRendererDecorator: charts.BarLabelDecorator<String>(),
//         domainAxis: charts.OrdinalAxisSpec(
//           renderSpec: charts.SmallTickRendererSpec(labelRotation: 60),
//         ),
//       ),
//     );
//   }
// }
//
