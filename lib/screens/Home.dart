import 'package:app/screens/Account.dart';
import 'package:app/screens/LogHrs.dart';
import 'package:app/screens/main_navigation_drawer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String Name = "shoba";
  int Total_hours = 50;
  bool isSelected = false;
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
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => AccountScreen())); //
              // Add your onPressed logic here
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
                                    backgroundColor:
                                        const Color.fromARGB(255, 7, 41, 69),
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
                  child: WeekCalendar()),
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

class WeekCalendar extends StatefulWidget {
  @override
  _WeekCalendarState createState() => _WeekCalendarState();
}

class _WeekCalendarState extends State<WeekCalendar> {
  int selectedDayIndex = -1;

  @override
  Widget build(BuildContext context) {
    List<String> daysOfWeek = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

    return Column(
      children: [
        // Your existing week calendar
        GridView.builder(
          shrinkWrap: true,
          itemCount: 7,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
          ),
          itemBuilder: (context, index) {
            if (index < daysOfWeek.length) {
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
                child: Container(
                  decoration: BoxDecoration(
                    color: index == selectedDayIndex
                        ? Colors.blue
                        : Colors.transparent,
                    border: Border.all(
                      color: Colors.grey,
                      width: 0.5,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      daysOfWeek[index],
                      style: TextStyle(
                        color: index == selectedDayIndex
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                ),
              );
            } else {
              int dayNumber = index - daysOfWeek.length + 1;
              return Container(
                decoration: BoxDecoration(
                  color: index == selectedDayIndex
                      ? Colors.blue
                      : Colors.transparent,
                  border: Border.all(
                    color: Colors.grey,
                    width: 0.5,
                  ),
                ),
                child: Center(
                  child: Text(
                    dayNumber.toString(),
                    style: TextStyle(
                      color: index == selectedDayIndex
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
              );
            }
          },
        ),
        SizedBox(
            height: 16), // Add some space between the calendar and the button
        // Button that changes color and works on tap when a day is selected
        ElevatedButton(
          onPressed: selectedDayIndex != -1
              ? () {
                  // Do something when the button is tapped
                  print('Button tapped!');
                }
              : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: selectedDayIndex != -1 ? Colors.blue : Colors.grey,
          ),
          child: Text('My Button'),
        ),
      ],
    );
  }
}
