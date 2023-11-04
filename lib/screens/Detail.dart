import 'package:app/screens/Home.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  String name = "Shoba";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Color(0xFF1D2A3B),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 50),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/coolPic.jpeg',
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Welcome $name',
                  style: const TextStyle(
                    color: Color(0xFFA78E3C),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 100),
                buildDropdown('Select Grade',
                    ['Grade 1', 'Grade 2', 'Grade 3', 'Grade 4']),
                SizedBox(height: 20),
                buildDropdown('Select Class',
                    ['Class A', 'Class B', 'Class C', 'Class D']),
                SizedBox(height: 20),
                buildDropdown('Select House',
                    ['House 1', 'House 2', 'House 3', 'House 4']),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                    // Handle submit button press
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFA78E3C),
                  ),
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDropdown(String hintText, List<String> items) {
    return Container(
      width: 300,
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: DropdownButton<String>(
        hint: Text(hintText),
        items: items.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String? value) {
          // Handle selection
        },
      ),
    );
  }
}
