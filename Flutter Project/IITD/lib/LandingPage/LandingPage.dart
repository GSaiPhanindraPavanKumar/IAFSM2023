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
//   List<charts.Series<HistoryData1, String>> createChartSeries(List<HistoryData1> data) {
//     return [
//       charts.Series<HistoryData1, String>(
//         id: 'I1',
//         colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
//         domainFn: (HistoryData1 data, _) => data.time,
//         measureFn: (HistoryData1 data, _) => data.i1,
//         data: data,
//         labelAccessorFn: (HistoryData1 data, _) => '${data.i1} A',
//       ),
//       charts.Series<HistoryData1, String>(
//         id: 'I2',
//         colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
//         domainFn: (HistoryData1 data, _) => data.time,
//         measureFn: (HistoryData1 data, _) => data.i2,
//         data: data,
//         labelAccessorFn: (HistoryData1 data, _) => '${data.i2} A',
//       ),
//       charts.Series<HistoryData1, String>(
//         id: 'I3',
//         colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
//         domainFn: (HistoryData1 data, _) => data.time,
//         measureFn: (HistoryData1 data, _) => data.i3,
//         data: data,
//         labelAccessorFn: (HistoryData1 data, _) => '${data.i3} A',
//       ),
//       charts.Series<HistoryData1, String>(
//         id: 'V1',
//         colorFn: (_, __) => charts.MaterialPalette.purple.shadeDefault,
//         domainFn: (HistoryData1 data, _) => data.time,
//         measureFn: (HistoryData1 data, _) => data.v1,
//         data: data,
//         labelAccessorFn: (HistoryData1 data, _) => '${data.v1} V',
//       ),
//       charts.Series<HistoryData1, String>(
//         id: 'V2',
//         colorFn: (_, __) => charts.MaterialPalette.deepOrange.shadeDefault,
//         domainFn: (HistoryData1 data, _) => data.time,
//         measureFn: (HistoryData1 data, _) => data.v2,
//         data: data,
//         labelAccessorFn: (HistoryData1 data, _) => '${data.v2} V',
//       ),
//       charts.Series<HistoryData1, String>(
//         id: 'V3',
//         colorFn: (_, __) => charts.MaterialPalette.teal.shadeDefault,
//         domainFn: (HistoryData1 data, _) => data.time,
//         measureFn: (HistoryData1 data, _) => data.v3,
//         data: data,
//         labelAccessorFn: (HistoryData1 data, _) => '${data.v3} V',
//       ),
//     ];
//   }
//
//   List<charts.Series<HistoryData2, String>> createChartSeries2(List<HistoryData2> data) {
//     return [
//       charts.Series<HistoryData2, String>(
//         id: 'I1',
//         colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
//         domainFn: (HistoryData2 data, _) => data.time,
//         measureFn: (HistoryData2 data, _) => data.i1,
//         data: data,
//         labelAccessorFn: (HistoryData2 data, _) => '${data.i1} A',
//       ),
//       charts.Series<HistoryData2, String>(
//         id: 'I2',
//         colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
//         domainFn: (HistoryData2 data, _) => data.time,
//         measureFn: (HistoryData2 data, _) => data.i2,
//         data: data,
//         labelAccessorFn: (HistoryData2 data, _) => '${data.i2} A',
//       ),
//       charts.Series<HistoryData2, String>(
//         id: 'I3',
//         colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
//         domainFn: (HistoryData2 data, _) => data.time,
//         measureFn: (HistoryData2 data, _) => data.i3,
//         data: data,
//         labelAccessorFn: (HistoryData2 data, _) => '${data.i3} A',
//       ),
//       charts.Series<HistoryData2, String>(
//         id: 'V1',
//         colorFn: (_, __) => charts.MaterialPalette.purple.shadeDefault,
//         domainFn: (HistoryData2 data, _) => data.time,
//         measureFn: (HistoryData2 data, _) => data.v1,
//         data: data,
//         labelAccessorFn: (HistoryData2 data, _) => '${data.v1} V',
//       ),
//       charts.Series<HistoryData2, String>(
//         id: 'V2',
//         colorFn: (_, __) => charts.MaterialPalette.deepOrange.shadeDefault,
//         domainFn: (HistoryData2 data, _) => data.time,
//         measureFn: (HistoryData2 data, _) => data.v2,
//         data: data,
//         labelAccessorFn: (HistoryData2 data, _) => '${data.v2} V',
//       ),
//       charts.Series<HistoryData2, String>(
//         id: 'V3',
//         colorFn: (_, __) => charts.MaterialPalette.teal.shadeDefault,
//         domainFn: (HistoryData2 data, _) => data.time,
//         measureFn: (HistoryData2 data, _) => data.v3,
//         data: data,
//         labelAccessorFn: (HistoryData2 data, _) => '${data.v3} V',
//       ),
//     ];
//   }
//
//   Widget buildChart() {
//     List<HistoryData1> selectedData = history1.sublist(history1.length - 5);
//     List<charts.Series<HistoryData1, String>> series = createChartSeries(selectedData);
//
//     List<HistoryData2> selectedData2 = history2.sublist(history2.length - 5);
//     List<charts.Series<HistoryData2, String>> series2 = createChartSeries2(selectedData2);
//
//     return SizedBox(
//       height: 300,
//       child: charts.BarChart(
//         series,
//         animate: true,
//         barRendererDecorator: charts.BarLabelDecorator<String>(
//           labelPosition: charts.BarLabelPosition.inside,
//           insideLabelStyleSpec: charts.TextStyleSpec(
//             color: charts.MaterialPalette.white,
//             fontSize: 12,
//           ),
//         ),
//         domainAxis: charts.OrdinalAxisSpec(
//           renderSpec: charts.SmallTickRendererSpec(
//             labelStyle: charts.TextStyleSpec(
//               fontSize: 12,
//               color:charts.MaterialPalette.black,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (BuildContext context, BoxConstraints constraints) {
//         bool isWideScreen = constraints.maxWidth > 1080;
//         double columnSpacing = isWideScreen ? 100.0 : 40.0;
//         double columnWidth = constraints.maxWidth / 3;
//
//         HistoryData1 latestData1 = history1.last;
//         HistoryData2 latestData2 = history2.last;
//
//         return SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               SizedBox(
//                 height: 150,
//                 width: double.infinity,
//                 child: Card(
//                   color: Colors.grey[400],
//                   child: Padding(
//                     padding: EdgeInsets.all(16.0),
//                     child: Column(
//                       children: [
//                         Text(
//                           'Meter 1',
//                           style: TextStyle(
//                             fontSize: 24,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         SizedBox(height: 20),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             buildMeterData(latestData1.i1, 'I1'),
//                             buildMeterData(latestData1.i2, 'I2'),
//                             buildMeterData(latestData1.i3, 'I3'),
//                             buildMeterData(latestData1.v1, 'V1'),
//                             buildMeterData(latestData1.v2, 'V2'),
//                             buildMeterData(latestData1.v3, 'V3'),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(padding: const EdgeInsets.all(16.0)),
//               SizedBox(
//                 height: 150,
//                 width: double.infinity,
//                 child: Card(
//                   color: Colors.grey[400],
//                   child: Padding(
//                     padding: EdgeInsets.all(16.0),
//                     child: Column(
//                       children: [
//                         Text(
//                           'Meter 2',
//                           style: TextStyle(
//                             fontSize: 24,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         SizedBox(height: 20),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             buildMeterData(latestData2.i1, 'I1'),
//                             buildMeterData(latestData2.i2, 'I2'),
//                             buildMeterData(latestData2.i3, 'I3'),
//                             buildMeterData(latestData2.v1, 'V1'),
//                             buildMeterData(latestData2.v2, 'V2'),
//                             buildMeterData(latestData2.v3, 'V3'),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Text(
//                   'Meter 1 Chart',
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 width: columnWidth * 3,
//                 height: 300,
//                 child: Card(
//                   color: Colors.grey[200],
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Padding(
//                     padding: EdgeInsets.all(16.0),
//                     child: buildChart(),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Text(
//                   'Meter 2 Chart',
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 width: columnWidth * 3,
//                 height: 300,
//                 child: Card(
//                   color: Colors.grey[200],
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Padding(
//                     padding: EdgeInsets.all(16.0),
//                     child: buildChart(),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 100),
//             ],
//           ),
//         );
//       },
//     );
//   }
//
//   Widget buildMeterData(double value, String label) {
//     return Expanded(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             label,
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           SizedBox(height: 10),
//           Text(
//             value.toStringAsFixed(2),
//             style: TextStyle(
//               fontSize: 24,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
