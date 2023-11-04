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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AccountScreen())); //
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
      endDrawer: IconButton(
        icon: Icon(Icons.person),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      AccountScreen())); // Add your settings action here
        },
      ),
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
                  child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          const Text('Timetable',
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold)),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(
                                    8.0), // Adjust the padding as needed
                                child: ColorChangeWidget(),
                              ),
                              Padding(
                                padding: EdgeInsets.all(
                                    8.0), // Adjust the padding as needed
                                child: ColorChangeWidget(),
                              ),
                              Padding(
                                padding: EdgeInsets.all(
                                    8.0), // Adjust the padding as needed
                                child: ColorChangeWidget(),
                              ),
                              Padding(
                                padding: EdgeInsets.all(
                                    8.0), // Adjust the padding as needed
                                child: ColorChangeWidget(),
                              ),
                              Padding(
                                padding: EdgeInsets.all(
                                    8.0), // Adjust the padding as needed
                                child: ColorChangeWidget(),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
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

class ColorChangeWidget extends StatefulWidget {
  @override
  _ColorChangeWidgetState createState() => _ColorChangeWidgetState();
}

class _ColorChangeWidgetState extends State<ColorChangeWidget> {
  bool isSelected = false;
  final Color defaultColor = Colors.white;
  final Color selectedColor = const Color.fromARGB(255, 7, 41, 69);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: Container(
          color: isSelected ? selectedColor : defaultColor,
          height: 50,
          width: 50,
          child: Center(
              child: Column(children: [
            Text(
              'M',
              style: TextStyle(
                color: isSelected
                    ? Colors.white
                    : const Color.fromARGB(255, 7, 41, 69),
              ),
            ),
            Text(
              '28',
              style: TextStyle(
                color: isSelected
                    ? Colors.white
                    : const Color.fromARGB(255, 7, 41, 69),
              ),
            ),
          ])),
        ),
      ),
    );
  }
}
