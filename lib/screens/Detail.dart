import 'package:app/screens/Home.dart';
import 'package:app/screens/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DetailScreen extends StatefulWidget {
  var id;
  var email;

  var password;

  DetailScreen({Key? key, required this.id, this.email, this.password})
      : super(key: key);
  _DetailScreenState createState() => _DetailScreenState();
}

Future<http.Response> createAlbum(String email, String password) {
  return http.post(
    Uri.parse(
        'https://reddam.agreeableplant-3f520c83.southafricanorth.azurecontainerapps.io/studentsignin'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'email': email,
      'password': password,
    }),
  );
}

class _DetailScreenState extends State<DetailScreen> {
  late String id;
  late String email;

  late String password;

  @override
  void initState() {
    super.initState();
    if (widget.id != null) {
      id = widget.id;
      email = widget.email;

      password = widget.password;
    }
  }

  String selectedGrade = '';
  String selectedClass = '';
  String selectedHouse = '';
  String hintTextGrade = 'Select an option';
  String hintTextClass = 'Select an option';
  String hintTextHouse = 'Select an option';

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
                  'Welcome ',
                  style: const TextStyle(
                    color: Color(0xFFA78E3C),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 50),
                buildDropdown(
                  'Select Grade',
                  ['Grade 1', 'Grade 2', 'Grade 3', 'Grade 4'],
                  hintTextGrade,
                  (String value) {
                    setState(() {
                      selectedGrade = value ?? '';
                      hintTextGrade = selectedGrade.isNotEmpty
                          ? 'Selected: $selectedGrade'
                          : 'Select an option';
                    });
                  },
                ),
                SizedBox(height: 20),
                buildDropdown(
                  'Select Class',
                  ['Class A', 'Class B', 'Class C', 'Class D'],
                  hintTextClass,
                  (String value) {
                    setState(() {
                      selectedClass = value ?? '';
                      hintTextClass = selectedClass.isNotEmpty
                          ? 'Selected: $selectedClass'
                          : 'Select an option';
                    });
                  },
                ),
                SizedBox(height: 20),
                buildDropdown(
                  'Select House',
                  ['House 1', 'House 2', 'House 3', 'House 4'],
                  hintTextHouse,
                  (String value) {
                    setState(() {
                      selectedHouse = value ?? '';
                      hintTextHouse = selectedHouse.isNotEmpty
                          ? 'Selected: $selectedHouse'
                          : 'Select an option';
                    });
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    if (selectedGrade.isNotEmpty &&
                        selectedHouse.isNotEmpty &&
                        selectedClass.isNotEmpty) {
                      final response = await http.put(
                          Uri.parse(
                              'https://reddam.agreeableplant-3f520c83.southafricanorth.azurecontainerapps.io/studentupdate'),
                          headers: <String, String>{
                            'Content-Type': 'application/json; charset=UTF-8',
                          },
                          body: jsonEncode(<String, String>{
                            'grade': '$selectedGrade',
                            'house': '$selectedHouse',
                            'class': '$selectedClass',
                            'id': '$id',
                            'email': '$email',
                            'password': '$password'
                          }));

                      print("it works" + jsonDecode(response.body).toString());
                      print(email);
                      print(password);

                      final response2 = await createAlbum(email, password);

                      print("clicked");

                      Album album = Album.fromJson(jsonDecode(response2.body));

                      if (response2.statusCode == 200) {
                        print(
                            "it works" + jsonDecode(response2.body).toString());

                        // String message = album.message;
                        // print("we got $message");
                        // print("$album");

                        String name = album.user.email;
                        print("we got $name");
                        print("$name");
                        print("sd");

                        // showSnackBar("we have signed in", Duration(seconds: 5));
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(
                              objct: album,
                            ),
                          ),
                        );
                      } else {
                        print(
                            "it doens" + jsonDecode(response2.body).toString());

                        int code = response.statusCode;
                        print("it 't work");
                        // String message = album.message;
                        // print("we got $message");
                        // showSnackBar("$message", Duration(seconds: 3));
                      }
                    } else {
                      showSnackBar("select your details", Duration(seconds: 3));
                    }
                    // Handle submit button press
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => DetailScreen()),
                    // );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFA78E3C),
                  ),
                  child: const Text(
                    " Submit ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1D2A3B),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  showSnackBar(String snackText, Duration d) {
    final snackBar = SnackBar(
      content: Text(snackText),
      duration: d,
      backgroundColor: Color(0xFFA78E3C),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Widget buildDropdown(String hintText, List<String> items,
      String currentHintText, Function(String) onChanged) {
    String selectedValue = '';
    return Container(
      width: 300,
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: DropdownButton<String>(
        hint: Text(currentHintText),
        items: items.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String? value) {
          // Handle selection
          onChanged(value ?? '');
        },
      ),
    );
  }
}
