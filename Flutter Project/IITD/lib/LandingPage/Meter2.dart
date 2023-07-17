import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
// import 'package:iitd/data/meter2_data.dart';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart' show rootBundle;

class Meter2Page extends StatefulWidget {
  @override
  _Meter2PageState createState() => _Meter2PageState();
}
class Meter2 {
  List<HistoryData2> meter2Data = [];

  Future<void> loadMeter2Data() async {
    final csvData2 = await rootBundle.loadString('lib/assets/meter2data.csv');
    final List<List<dynamic>> csvTable2 = CsvToListConverter().convert(csvData2);

    // Clear the existing meter1Data list
    meter2Data.clear();

    // Populate the meter2Data list with the CSV data
    for (int i = 1; i < csvTable2.length; i++) {
      final row = csvTable2[i];
      final historyData2 = HistoryData2(
        date: row[0].toString(),
        time: row[1].toString(),
        i1: int.parse(row[2].toString()),
        i2: int.parse(row[3].toString()),
        i3: int.parse(row[4].toString()),
        v1: double.parse(row[5].toString()),
        v2: double.parse(row[6].toString()),
        v3: double.parse(row[7].toString()),
      );
      meter2Data.add(historyData2);
    }
  }
}


class _Meter2PageState extends State<Meter2Page> {
  String selectedOption = '30m'; // Default selected option is 30 minutes
  List<HistoryData2> history = [];
  @override
  void initState() {
    super.initState();
    loadMeter2Data();
  }

  Future<void> loadMeter2Data() async {
    Meter2 meter2 = Meter2();
    await meter2.loadMeter2Data();
    setState(() {
      history = meter2.meter2Data;
    });
  }

  List<HistoryData2> getHistoryData2(String option) {
    // Return history data based on selected option
    switch (option) {
      case '30m':
        return history.sublist(history.length - 6);
      case '1h':
        return history.sublist(history.length - 12);
      case '2h':
        return history.sublist(history.length - 18);
      case '3h':
        return history.sublist(history.length - 24);
      case '4h':
        return history.sublist(history.length - 30);
      default:
        return [];
    }
  }

  List<charts.Series<HistoryData2, String>> createChartSeries(List<HistoryData2> data) {
    return [
      charts.Series<HistoryData2, String>(
        id: 'I1',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (HistoryData2 data, _) => data.time,
        measureFn: (HistoryData2 data, _) => data.i1,
        data: data,
        labelAccessorFn: (HistoryData2 data, _) => '${data.i1} A',
      ),
      charts.Series<HistoryData2, String>(
        id: 'I2',
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        domainFn: (HistoryData2 data, _) => data.time,
        measureFn: (HistoryData2 data, _) => data.i2,
        data: data,
        labelAccessorFn: (HistoryData2 data, _) => '${data.i2} A',
      ),
      charts.Series<HistoryData2, String>(
        id: 'I3',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (HistoryData2 data, _) => data.time,
        measureFn: (HistoryData2 data, _) => data.i3,
        data: data,
        labelAccessorFn: (HistoryData2 data, _) => '${data.i3} A',
      ),
      charts.Series<HistoryData2, String>(
        id: 'V1',
        colorFn: (_, __) => charts.MaterialPalette.purple.shadeDefault,
        domainFn: (HistoryData2 data, _) => data.time,
        measureFn: (HistoryData2 data, _) => data.v1,
        data: data,
        labelAccessorFn: (HistoryData2 data, _) => '${data.formattedV1} V',
      ),
      charts.Series<HistoryData2, String>(
        id: 'V2',
        colorFn: (_, __) => charts.MaterialPalette.deepOrange.shadeDefault,
        domainFn: (HistoryData2 data, _) => data.time,
        measureFn: (HistoryData2 data, _) => data.v2,
        data: data,
        labelAccessorFn: (HistoryData2 data, _) => '${data.formattedV2} V',
      ),
      charts.Series<HistoryData2, String>(
        id: 'V3',
        colorFn: (_, __) => charts.MaterialPalette.teal.shadeDefault,
        domainFn: (HistoryData2 data, _) => data.time,
        measureFn: (HistoryData2 data, _) => data.v3,
        data: data,
        labelAccessorFn: (HistoryData2 data, _) => '${data.formattedV3} V',
      ),
    ];
  }

  Widget buildChart() {
    List<HistoryData2> selectedData = getHistoryData2(selectedOption);
    List<charts.Series<HistoryData2, String>> series = createChartSeries(selectedData);

    return Container(
      height: 300,
      padding: EdgeInsets.all(16.0),
      child: charts.BarChart(
        series,
        animate: true,
        barRendererDecorator: charts.BarLabelDecorator<String>(),
        domainAxis: charts.OrdinalAxisSpec(
          renderSpec: charts.SmallTickRendererSpec(labelRotation: 60),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        bool isWideScreen = constraints.maxWidth > 1080;
        double columnSpacing = isWideScreen ? 100.0 : 40.0;
        double columnWidth = constraints.maxWidth / 3;
        if (history.isEmpty){
          return CircularProgressIndicator();
        }
        HistoryData2 latestData = history.last;

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children:[
              Container(
                constraints: BoxConstraints(
                  maxWidth: double.infinity,
                  maxHeight: 150,
                ),
                height: constraints.maxHeight * 0.2,
                decoration: BoxDecoration(
                  color: Colors.blue[400],
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'I1',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            '${latestData.i1} A',
                            style: TextStyle(
                                fontSize: 24,
                                color: Colors.white
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'I2',
                            style: TextStyle(
                                fontSize: 18,
                              fontWeight: FontWeight.bold,
                                color: Colors.white
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            '${latestData.i2} A',
                            style: TextStyle(
                              fontSize: 24,
                                color: Colors.white
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'I3',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                                color: Colors.white
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            '${latestData.i3} A',
                            style: TextStyle(
                              fontSize: 24,
                                color: Colors.white
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(padding: const EdgeInsets.all(16.0)),
              Container(
                constraints: BoxConstraints(
                  maxWidth: double.infinity,
                  maxHeight: 150,
                ),
                height: constraints.maxHeight * 0.2,
                decoration: BoxDecoration(
                  color: Colors.blue[400],
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'V1',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                                color: Colors.white
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            '${latestData.v1} V',
                            style: TextStyle(
                              fontSize: 24,
                                color: Colors.white
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'V2',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                                color: Colors.white
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            '${latestData.v2} V',
                            style: TextStyle(
                              fontSize: 24,
                                color: Colors.white
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'V3',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                                color: Colors.white
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            '${latestData.v3} V',
                            style: TextStyle(
                              fontSize: 24,
                                color: Colors.white
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Text(
                      'History Table',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    DropdownButton<String>(
                      value: selectedOption,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedOption = newValue!;
                        });
                      },
                      items: [
                        DropdownMenuItem(child: Text('30 minutes'), value: '30m'),
                        DropdownMenuItem(child: Text('1 hour'), value: '1h'),
                        DropdownMenuItem(child: Text('2 hour'), value: '2h'),
                        DropdownMenuItem(child: Text('3 hour'), value: '3h'),
                        DropdownMenuItem(child: Text('4 hour'), value: '4h'),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.greenAccent,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.greenAccent.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: DataTable(
                        columnSpacing: columnSpacing,
                        columns: [
                          DataColumn(
                            label: Text(
                              'Date',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Time',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'I1 (A)',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'I2 (A)',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'I3 (A)',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'V1 (V)',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'V2 (V)',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'V3 (V)',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                        rows: [
                          ...getHistoryData2(selectedOption).map((data) {
                            return DataRow(cells: [
                              DataCell(Text(data.date)),
                              DataCell(Text(data.time)),
                              DataCell(Text(data.i1.toString())),
                              DataCell(Text(data.i2.toString())),
                              DataCell(Text(data.i3.toString())),
                              DataCell(Text(data.v1.toString())),
                              DataCell(Text(data.v2.toString())),
                              DataCell(Text(data.v3.toString())),
                            ]);
                          }),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'History Chart',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                width: columnWidth * 3,
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.lightBlueAccent[400],
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueAccent.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                padding: EdgeInsets.all(16.0),
                child: charts.BarChart(
                  createChartSeries(getHistoryData2(selectedOption)),
                  animate: true,
                  barRendererDecorator: charts.BarLabelDecorator<String>(),
                  domainAxis: charts.OrdinalAxisSpec(
                    renderSpec: charts.SmallTickRendererSpec(labelRotation: 60),
                  ),
                ),
              ),
              SizedBox(height: 100),
            ],
          ),
        );
      },
    );
  }
}

class HistoryData2 {
  final String date;
  final String time;
  final int i1;
  final int i2;
  final int i3;
  final double v1;
  final double v2;
  final double v3;

  HistoryData2({
    required this.date,
    required this.time,
    required this.i1,
    required this.i2,
    required this.i3,
    required this.v1,
    required this.v2,
    required this.v3,
  });
  String get formattedV1 => v1.toStringAsFixed(0);
  String get formattedV2 => v2.toStringAsFixed(0);
  String get formattedV3 => v3.toStringAsFixed(0);
}
