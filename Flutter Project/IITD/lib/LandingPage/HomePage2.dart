// import 'package:flutter/material.dart';
// import 'package:iitd/LandingPage/Meter1.dart';
// import 'package:iitd/LandingPage/Meter2.dart';
// import 'package:iitd/data/meter1_data.dart';
// import 'package:iitd/data/meter2_data.dart';
// import 'package:charts_flutter/flutter.dart' as charts;
//
// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   List<HistoryData1> history1 = meter1History;
//   List<HistoryData2> history2 = meter2History;
//
//   List<charts.Series<HistoryData1, String>> createChartSeries1(List<HistoryData1> data) {
//     return [
//       charts.Series<HistoryData1, String>(
//         id: 'Meter 1',
//         colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
//         domainFn: (HistoryData1 data, _) => data.time,
//         measureFn: (HistoryData1 data, _) => data.i1,
//         data: data,
//       ),
//     ];
//   }
//
//   List<charts.Series<HistoryData2, String>> createChartSeries2(List<HistoryData2> data) {
//     return [
//       charts.Series<HistoryData2, String>(
//         id: 'Meter 2',
//         colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
//         domainFn: (HistoryData2 data, _) => data.time,
//         measureFn: (HistoryData2 data, _) => data.i1,
//         data: data,
//       ),
//     ];
//   }
//
//   Widget buildChart() {
//     List<HistoryData1> selectedData1 = history1.sublist(history1.length - 5);
//     List<charts.Series<HistoryData1, String>> series1 = createChartSeries1(selectedData1);
//
//     List<HistoryData2> selectedData2 = history2.sublist(history2.length - 5);
//     List<charts.Series<HistoryData2, String>> series2 = createChartSeries2(selectedData2);
//
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Text(
//             'Meter 1 Chart',
//             style: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         Container(
//           height: 300,
//           padding: EdgeInsets.all(16.0),
//           child: charts.TimeSeriesChart(
//             series1,
//             animate: true,
//             dateTimeFactory: const charts.LocalDateTimeFactory(),
//             defaultRenderer: charts.LineRendererConfig(includePoints: true),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Text(
//             'Meter 2 Chart',
//             style: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         Container(
//           height: 300,
//           padding: EdgeInsets.all(16.0),
//           child: charts.TimeSeriesChart(
//             series2,
//             animate: true,
//             dateTimeFactory: const charts.LocalDateTimeFactory(),
//             defaultRenderer: charts.LineRendererConfig(includePoints: true),
//           ),
//         ),
//       ],
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Home'),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             buildChart(),
//             Meter1(),
//             Meter2(),
//           ],
//         ),
//       ),
//     );
//   }
// }
