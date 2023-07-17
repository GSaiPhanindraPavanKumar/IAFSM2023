// import 'package:csv/csv.dart';
// import 'package:flutter/services.dart' show rootBundle;
// import 'assets/meter1data.csv';
//
// Future<List<HistoryData>> loadHistoryDataFromCSV() async {
//   final String csvData = await rootBundle.loadString('assets/.csv');
//   final List<List<dynamic>> csvTable = CsvToListConverter().convert(csvData);
//
//   // Remove header row if it exists
//   if (csvTable.isNotEmpty && csvTable[0].length == 8) {
//     csvTable.removeAt(0);
//   }
//
//   // Convert CSV rows to HistoryData objects
//   final List<HistoryData> historyDataList = csvTable.map((row) {
//     return HistoryData(
//       date: row[0].toString(),
//       time: row[1].toString(),
//       i1: double.parse(row[2].toString()),
//       i2: double.parse(row[3].toString()),
//       i3: double.parse(row[4].toString()),
//       v1: double.parse(row[5].toString().replaceAll(',', '.')),
//       v2: double.parse(row[6].toString().replaceAll(',', '.')),
//       v3: double.parse(row[7].toString().replaceAll(',', '.')),
//     );
//   }).toList();
//
//   return historyDataList;
// }
