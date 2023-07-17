// import 'package:csv/csv.dart';
// import 'package:flutter/services.dart' show rootBundle;
// import 'package:iitd/LandingPage/Meter1.dart';
//
//
// class HistoryData1 {
//   final String date;
//   final String time;
//   final int i1;
//   final int i2;
//   final int i3;
//   final double v1;
//   final double v2;
//   final double v3;
//
//   HistoryData1({
//     required this.date,
//     required this.time,
//     required this.i1,
//     required this.i2,
//     required this.i3,
//     required this.v1,
//     required this.v2,
//     required this.v3,
//   });
// }
//
// class Meter1 {
//   List<HistoryData1> meter1Data = [];
//
//   Future<void> loadMeter1Data() async {
//     final csvData = await rootBundle.loadString('lib/assets/meter1data.csv');
//     final List<List<dynamic>> csvTable = CsvToListConverter().convert(csvData);
//
//     // Clear the existing meter1Data list
//     meter1Data.clear();
//
//     // Populate the meter1Data list with the CSV data
//     for (int i = 1; i < csvTable.length; i++) {
//       final row = csvTable[i];
//       final historyData = HistoryData1(
//         date: row[0].toString(),
//         time: row[1].toString(),
//         i1: int.parse(row[2].toString()),
//         i2: int.parse(row[3].toString()),
//         i3: int.parse(row[4].toString()),
//         v1: double.parse(row[5].toString()),
//         v2: double.parse(row[6].toString()),
//         v3: double.parse(row[7].toString()),
//       );
//       meter1Data.add(historyData);
//     }
//   }
// }