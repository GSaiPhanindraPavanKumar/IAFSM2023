import 'package:flutter/material.dart';
import 'package:iitd/LandingPage/Meter1.dart';
import 'package:iitd/LandingPage/Meter2.dart';
import 'package:iitd/data/meter1_data.dart';
import 'package:iitd/data/meter2_data.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:iitd/data/Meter1csv.dart';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart' show rootBundle;


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class Meter1 {
  List<HistoryData1> meter1Data = [];

  Future<void> loadMeter1Data() async {
    final csvData = await rootBundle.loadString('lib/assets/meter1data.csv');
    final List<List<dynamic>> csvTable = CsvToListConverter().convert(csvData);

    // Clear the existing meter1Data list
    meter1Data.clear();

    // Populate the meter1Data list with the CSV data
    for (int i = 1; i < csvTable.length; i++) {
      final row = csvTable[i];
      final historyData = HistoryData1(
        date: row[0].toString(),
        time: row[1].toString(),
        i1: int.parse(row[2].toString()),
        i2: int.parse(row[3].toString()),
        i3: int.parse(row[4].toString()),
        v1: double.parse(row[5].toString()),
        v2: double.parse(row[6].toString()),
        v3: double.parse(row[7].toString()),
      );
      meter1Data.add(historyData);
    }
  }
}

class Meter2 {
  List<HistoryData2> meter2Data = [];

  Future<void> loadMeter2Data() async {
    final csvData = await rootBundle.loadString('lib/assets/meter2data.csv');
    final List<List<dynamic>> csvTable = CsvToListConverter().convert(csvData);

    // Clear the existing meter1Data list
    meter2Data.clear();

    // Populate the meter1Data list with the CSV data
    for (int i = 1; i < csvTable.length; i++) {
      final row = csvTable[i];
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

class _HomePageState extends State<HomePage> {
  List<HistoryData1> history1 = [];
  List<HistoryData2> history2 = [];
  @override
  void initState() {
    super.initState();
    loadMeterData();
    loadMeter2Data();
  }

  Future<void> loadMeterData() async {
    Meter1 meter1 = Meter1();
    await meter1.loadMeter1Data();
    setState(() {
      history1 = meter1.meter1Data;
    });
  }
  Future<void> loadMeter2Data() async {
    Meter2 meter2 = Meter2();
    await meter2.loadMeter2Data();
    setState(() {
      history2 = meter2.meter2Data;
    });
  }


  // List<HistoryData1> history1 = meter1.meter1Data;
  // List<HistoryData2> history2 = meter2History;

  List<charts.Series<HistoryData1, String>> createChartSeries(List<HistoryData1> data) {
    return [
      charts.Series<HistoryData1, String>(
        id: 'I1',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (HistoryData1 data, _) => data.time,
        measureFn: (HistoryData1 data, _) => data.i1,
        data: data,
        labelAccessorFn: (HistoryData1 data, _) => '${data.i1} A',
      ),
      charts.Series<HistoryData1, String>(
        id: 'I2',
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        domainFn: (HistoryData1 data, _) => data.time,
        measureFn: (HistoryData1 data, _) => data.i2,
        data: data,
        labelAccessorFn: (HistoryData1 data, _) => '${data.i2} A',
      ),
      charts.Series<HistoryData1, String>(
        id: 'I3',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (HistoryData1 data, _) => data.time,
        measureFn: (HistoryData1 data, _) => data.i3,
        data: data,
        labelAccessorFn: (HistoryData1 data, _) => '${data.i3} A',
      ),
      charts.Series<HistoryData1, String>(
        id: 'V1',
        colorFn: (_, __) => charts.MaterialPalette.purple.shadeDefault,
        domainFn: (HistoryData1 data, _) => data.time,
        measureFn: (HistoryData1 data, _) => data.v1,
        data: data,
        labelAccessorFn: (HistoryData1 data, _) => '${data.formattedV1} V',
      ),
      charts.Series<HistoryData1, String>(
        id: 'V2',
        colorFn: (_, __) => charts.MaterialPalette.deepOrange.shadeDefault,
        domainFn: (HistoryData1 data, _) => data.time,
        measureFn: (HistoryData1 data, _) => data.v2,
        data: data,
        labelAccessorFn: (HistoryData1 data, _) => '${data.formattedV2} V',
      ),
      charts.Series<HistoryData1, String>(
        id: 'V3',
        colorFn: (_, __) => charts.MaterialPalette.teal.shadeDefault,
        domainFn: (HistoryData1 data, _) => data.time,
        measureFn: (HistoryData1 data, _) => data.v3,
        data: data,
        labelAccessorFn: (HistoryData1 data, _) => '${data.formattedV2} V',
      ),
    ];
  }

  List<charts.Series<HistoryData2, String>> createChartSeries2(List<HistoryData2> data) {
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
    List<HistoryData1> selectedData = history1.sublist(history1.length - 5);
    List<charts.Series<HistoryData1, String>> series = createChartSeries(selectedData);

    List<HistoryData2> selectedData2 = history2.sublist(history2.length - 5);
    List<charts.Series<HistoryData2, String>> series2 = createChartSeries2(selectedData2);

    return Container(
      height: 300,
      padding: EdgeInsets.all(16.0),
      child: charts.BarChart(
        [
          ...series,
          ...series2,
        ],
        animate: true,
        barRendererDecorator: charts.BarLabelDecorator<String>(
          labelPosition: charts.BarLabelPosition.inside,
        ),
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
        if (history1.isEmpty){
          return CircularProgressIndicator();
        }
        if (history2.isEmpty){
          return CircularProgressIndicator();
        }
        HistoryData1 latestData1 = history1.last;
        HistoryData2 latestData2 = history2.last;

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
                // color: Colors.blue[400],
                child: Column(
                  children: [
                    Text(
                      'Meter 1',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
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
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                '${latestData1.i1} A',
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
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
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                '${latestData1.i2} A',
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
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
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                '${latestData1.i3} A',
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
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
                                'V1',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                '${latestData1.v1} V',
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
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
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                '${latestData1.v2} V',
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
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
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                '${latestData1.v3} V',
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
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
                // color: Colors.grey[400],
                child: Column(
                  children: [
                    Text(
                      'Meter 2',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
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
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                '${latestData2.i1} A',
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
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
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                '${latestData2.i2} A',
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
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
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                '${latestData2.i3} A',
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
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
                                'V1',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                '${latestData2.v1} V',
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
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
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                '${latestData2.v2} V',
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
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
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                '${latestData2.v3} V',
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Meter 1 Chart',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                width: columnWidth * 3, // Adjust the width of the chart container
                height: 300,
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.lightBlueAccent[200],
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueAccent.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: charts.BarChart(
                  createChartSeries(history1.sublist(history1.length - 5)),
                  animate: true,
                  barRendererDecorator: charts.BarLabelDecorator<String>(
                    insideLabelStyleSpec: charts.TextStyleSpec(
                      color: charts.MaterialPalette.white,
                      fontSize: 12,
                      fontWeight: 'bold',
                    ),
                    outsideLabelStyleSpec: charts.TextStyleSpec(
                      color: charts.MaterialPalette.black,
                      fontSize: 12,
                    ),
                  ),
                  domainAxis: charts.OrdinalAxisSpec(
                    renderSpec: charts.SmallTickRendererSpec(
                      labelRotation: 60,
                      labelStyle: charts.TextStyleSpec(
                        fontSize: 12,
                        color: charts.MaterialPalette.black,
                      ),
                    ),
                  ),
                  primaryMeasureAxis: charts.NumericAxisSpec(
                    renderSpec: charts.GridlineRendererSpec(
                      labelStyle: charts.TextStyleSpec(
                        color: charts.MaterialPalette.black,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Meter 2 Chart',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                width: columnWidth * 3, // Adjust the width of the chart container
                height: 300,
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.lightBlueAccent[200],
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueAccent.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: charts.BarChart(
                  createChartSeries2(history2.sublist(history2.length - 5)),
                  animate: true,
                  barRendererDecorator: charts.BarLabelDecorator<String>(
                    insideLabelStyleSpec: charts.TextStyleSpec(
                      color: charts.MaterialPalette.white,
                      fontSize: 12,
                      fontWeight: 'bold',
                    ),
                    outsideLabelStyleSpec: charts.TextStyleSpec(
                      color: charts.MaterialPalette.black,
                      fontSize: 12,
                    ),
                  ),
                  domainAxis: charts.OrdinalAxisSpec(
                    renderSpec: charts.SmallTickRendererSpec(
                      labelRotation: 60,
                      labelStyle: charts.TextStyleSpec(
                        fontSize: 12,
                        color: charts.MaterialPalette.black,
                      ),
                    ),
                  ),
                  primaryMeasureAxis: charts.NumericAxisSpec(
                    renderSpec: charts.GridlineRendererSpec(
                      labelStyle: charts.TextStyleSpec(
                        color: charts.MaterialPalette.black,
                        fontSize: 12,
                      ),
                    ),
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
