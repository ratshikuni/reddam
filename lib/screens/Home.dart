import 'package:app/screens/Account.dart';
import 'package:app/screens/LogHrs.dart';
import 'package:app/screens/main_navigation_drawer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

List<DateTime> getWeekDates(DateTime currentDate) {
  return List.generate(
      7,
      (index) => currentDate
          .subtract(Duration(days: currentDate.weekday - 1))
          .add(Duration(days: index)));
}

class _HomeScreenState extends State<HomeScreen> {
  String Name = "shoba";
  int Total_hours = 50;

  int selectedDayIndex = -1;
  List<String> daysOfWeek = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri'];
  List<DateTime> weekDates = getWeekDates(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        toolbarHeight: 150,
        backgroundColor: Color.fromARGB(255, 7, 41, 69),
        actions: <Widget>[
          // Add your widget here
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Account())); //
            },
          )
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48.0), // Adjust the height as needed
          child: Padding(
            padding: EdgeInsets.only(bottom: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Welcome " + Name,
                    style: TextStyle(
                        color: Color(0xFFA78E3C),
                        fontWeight: FontWeight.w600,
                        fontSize: 30)),
                const SizedBox(height: 20),
                Text("Total hours : $Total_hours",
                    style: TextStyle(
                        color: Color(0xFFA78E3C),
                        fontWeight: FontWeight.w600,
                        fontSize: 15)),
              ],
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: MainNavigationDrawer(),
      ),
      // endDrawer: IconButton(
      //   icon: Icon(Icons.person),
      //   onPressed: () {
      //     print("asdfasdfasdf");
      //     // Navigator.push(
      //     //     context,
      //     //     MaterialPageRoute(
      //     //         builder: (context) =>
      //     //             Account())); // Add your settings action here
      //   },
      // ),
      body: Container(
        color: Color.fromARGB(218, 218, 218, 218),
        child: Center(
          child: Column(children: [
            Expanded(
              child: Card(
                  elevation: 12.0,
                  margin: EdgeInsets.all(10.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Spacer(flex: 1),
                          Row(
                            children: [
                              Text(
                                '$Total_hours HRS',
                                style: const TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                  color: const Color.fromARGB(255, 7, 41, 69),
                                ),
                              ),
                              Spacer(flex: 1),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LogHrs()),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: selectedDayIndex != -1
                                        ? Color.fromARGB(255, 7, 41, 69)
                                        : Colors.grey,
                                  ),
                                  child: Text('Log Hours'))
                            ],
                          ),
                          Text('Accumulated for the  year',
                              style: const TextStyle(
                                fontSize: 15.0,
                                color: const Color.fromARGB(255, 7, 41, 69),
                              )),
                          Spacer(flex: 2),
                        ],
                      ))),
            ),
            Expanded(
              child: Card(
                elevation: 5.0,
                margin: EdgeInsets.all(10.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Timetable',
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 35,
                        ),
                        GridView.builder(
                          shrinkWrap: true,
                          itemCount: 5,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 5,
                          ),
                          itemBuilder: (context, index) {
                            if (index < daysOfWeek.length) {
                              print("The days are $index");

                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (selectedDayIndex == index) {
                                      selectedDayIndex = -1;
                                    } else {
                                      selectedDayIndex = index;
                                    }
                                  });
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: index == selectedDayIndex
                                          ? Color.fromARGB(255, 7, 41, 69)
                                          : Colors.transparent,
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 0.5,
                                      ),
                                    ),
                                    child: Center(
                                        child: Column(
                                      children: [
                                        Text(
                                          daysOfWeek[index],
                                          style: TextStyle(
                                            color: index == selectedDayIndex
                                                ? Colors.white
                                                : Colors.black,
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          "" +
                                              (weekDates[index].day).toString(),
                                          style: TextStyle(
                                            color: index == selectedDayIndex
                                                ? Colors.white
                                                : Colors.black,
                                          ),
                                        ),
                                      ],
                                    )),
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    )),
              ),
            ),
            Expanded(
              child: Card(
                  elevation: 5.0,
                  margin: EdgeInsets.all(10.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Teachers and Activities',
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 35,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Sandwiches',
                              ),
                              Text(
                                'Yvonne Sanders',
                              ),
                              Text(
                                '50 HRS',
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ))),
            ),
          ]),
        ),
      ),
    );
  }
}
