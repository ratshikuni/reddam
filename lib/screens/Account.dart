import 'package:app/screens/Home.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Account extends StatelessWidget {
  const Account({super.key});
//
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.menu,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen())); //
            },
          ),
          title: const Text('John Doe'),
          centerTitle: true,
          toolbarHeight: 100,
          titleTextStyle:
              const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          backgroundColor: const Color(0xFF1D2A3B),
        ),
        body: const AccountContainer(),
      ),
    );
  }
}

class AccountContainer extends StatelessWidget {
  const AccountContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Personal Details Container
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(bottom: 16.0),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: const Color(0xFFF2F2F2),
              border: Border.all(color: Colors.white, width: 0.0),
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey, // Shadow color
                  offset: Offset(
                      0.0, 4.0), // Offset to create a shadow at the bottom
                  blurRadius: 4.0, // Blur radius
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Personal Details',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10.0),
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white, // White rectangle background color
                  padding: const EdgeInsets.all(8.0),
                  child: const Text('Full Name: John Doe'),
                ),
                const SizedBox(height: 5.0),
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white, // White rectangle background color
                  padding: const EdgeInsets.all(8.0),
                  child: const Text('Grade: 10'),
                ),
                const SizedBox(height: 5.0),
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white, // White rectangle background color
                  padding: const EdgeInsets.all(8.0),
                  child: const Text('Class: A'),
                ),
                const SizedBox(height: 5.0),
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white, // White rectangle background color
                  padding: const EdgeInsets.all(8.0),
                  child: const Text('House: Gryffindor'),
                ),
              ],
            ),
          ),

          //Progress bar container
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(bottom: 16.0),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: const Color(0xFFF2F2F2),
              border: Border.all(color: Colors.white, width: 0.0),
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey, // Shadow color
                  offset: Offset(
                      0.0, 4.0), // Offset to create a shadow at the bottom
                  blurRadius: 4.0, // Blur radius
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Progress',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20.0),
                const Text(
                  "Prefect",
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                ),
                LinearPercentIndicator(
                  width: MediaQuery.of(context).size.width - 70,
                  animation: true,
                  lineHeight: 20.0,
                  animationDuration: 2500,
                  percent: 0.8,
                  //hOURS to be cast in to text here
                  center: const Text(
                    "480/600HRS",
                    style: TextStyle(
                      color: Color(0xFFA78E3C),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  barRadius: const Radius.circular(16),
                  progressColor: const Color.fromARGB(255, 18, 46, 68),
                ),
                const SizedBox(height: 5.0),
                const Text(
                  "Colours",
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                ),
                LinearPercentIndicator(
                  width: MediaQuery.of(context).size.width - 70,
                  animation: true,
                  lineHeight: 20.0,
                  animationDuration: 2500,
                  percent: 0.2,
                  //hOURS to be cast in to text here
                  center: const Text(
                    "50/250HRS",
                    style: TextStyle(
                      color: Color(0xFFA78E3C),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  barRadius: const Radius.circular(16),
                  progressColor: const Color.fromARGB(255, 18, 46, 68),
                ),
              ],
            ),
          ),

          // Bar chart Container
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(bottom: 16.0),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: const Color(0xFFF2F2F2),
              border: Border.all(color: Colors.white, width: 0.0),
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey, // Shadow color
                  offset: Offset(
                      0.0, 4.0), // Offset to create a shadow at the bottom
                  blurRadius: 4.0, // Blur radius
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Historical Hours',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10.0),
                Container(
                  height: 200,
                  child: charts.BarChart(
                    _createSampleData(),
                    animate: false,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// class to hold the chart data (a model)
class Hours {
  final String year;
  final int hours;
  Hours(this.year, this.hours);
}

// Created data
List<charts.Series<Hours, String>> _createSampleData() {
  final data = [
    Hours("Gr.8", 30),
    Hours("Gr.9", 50),
    Hours("Gr.10", 100),
    Hours("Gr.11", 30),
    Hours("Gr.12", 55),
  ];
  return [
    charts.Series(
        id: 'hours',
        data: data,
        domainFn: (Hours houRs, _) => houRs.year,
        measureFn: (Hours houRs, _) => houRs.hours,
        colorFn: (_, __) =>
            //Unsure about the color thou as I used a different scheme
            charts.ColorUtil.fromDartColor(
                const Color.fromARGB(255, 18, 46, 68)))
  ];
}
