import 'package:app/screens/Home.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

List<String> activeCollection = [
  "Blankets",
  "Bottle Tops and Tags(50)",
  "Eco Bricks(50)",
  "External"
];

List<String> passiveHours = ["Donations", "External"];

List<String> activeTime = [
  "67 Hours",
  "Elandsvlei",
  "Jars of Hope",
  "Sandwiches",
  "Santa ShoeBox",
  "Squares(50)",
  "Tutoring",
  "External"
];

class LogHrs extends StatefulWidget {
  const LogHrs({Key? key}) : super(key: key);

  @override
  _LogHrsState createState() => _LogHrsState();
}

class _LogHrsState extends State<LogHrs> {
  HourTypes? _character = HourTypes.passive;
  String? selectedOption;
  void openFiles() async {
    FilePickerResult? resultFile = await FilePicker.platform.pickFiles();
    if (resultFile != null) {
      PlatformFile file = resultFile.files.first;
      print(file.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_rounded,
            ),
            onPressed: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => HomeScreen())); //
            },
          ),
          toolbarHeight: 100,
          title: const Text("Log Hours"),
          centerTitle: true,
          titleTextStyle:
              const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          backgroundColor: const Color(0xFF1D2A3B),
        ),
        body: SingleChildScrollView(
          //width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Column(
                children: [
                  MyRadios(
                    onRadioChanged: (HourTypes? value) {
                      setState(() {
                        _character = value;
                        // Reset the selected option when the radio button changes
                        selectedOption = null;
                      });
                    },
                  )
                ],
              ),
              const SizedBox(height: 20),
              if (_character == HourTypes.activeTime ||
                  _character == HourTypes.activeCollection ||
                  _character == HourTypes.passive)
                Container(
                  height: 60, // Expand to screen width
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF2F2F2),
                    border: Border.all(color: Colors.white, width: 0.0),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey, // Shadow color
                        offset: Offset(0.0,
                            4.0), // Offset to create a shadow at the bottom
                        blurRadius: 4.0, // Blur radius
                      ),
                    ],
                  ),

                  child: DropdownWidget(
                    items: _character == HourTypes.activeTime
                        ? activeTime
                        : _character == HourTypes.activeCollection
                            ? activeCollection
                            : passiveHours,
                    selectedItem: selectedOption,
                    onChanged: (String? value) {
                      setState(() {
                        selectedOption = value;
                      });
                    },
                  ),
                ),
              const SizedBox(height: 20),

              Container(
                height: 60,
                padding: const EdgeInsets.only(left: 16, right: 16),
                decoration: BoxDecoration(
                  color: const Color(0xFFF2F2F2),
                  border: Border.all(color: Colors.white, width: 0.0),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey, // Shadow color
                      offset: Offset(
                          0.0, 4.0), // Offset to create a shadow at the bottom
                      blurRadius: 4.0, // Blur radius
                    ),
                  ],
                ),
                child: TextField(
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))
                  ], // Allow numeric digits and decimal point
                  decoration: const InputDecoration(
                    hintText: 'Enter Hours',
                    alignLabelWithHint: true,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 60,
                padding: const EdgeInsets.only(left: 16, right: 16),
                decoration: BoxDecoration(
                  color: const Color(0xFFF2F2F2),
                  border: Border.all(color: Colors.white, width: 0.0),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey, // Shadow color
                      offset: Offset(
                          0.0, 4.0), // Offset to create a shadow at the bottom
                      blurRadius: 4.0, // Blur radius
                    ),
                  ],
                ),
                child: TextField(
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                  ],
                  decoration: const InputDecoration(
                    hintText: 'Enter Slip Number',
                  ),
                ),
              ),
              const SizedBox(height: 20),
              content(),
              const SizedBox(height: 20),
              // Add a submit button at the end
              submitButton(),
            ],
          ),
        ));
  }

  Widget submitButton() {
    return ElevatedButton(
      onPressed: () {
        // the submit button action here
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF1D2A3B), // Set the background color
        minimumSize: const Size(180, 40), // the width and height
      ),
      child: const Text(
        'Submit',
        style: TextStyle(fontSize: 18), // font size
      ),
    );
  }

  Widget content() {
    return Center(
      child: GestureDetector(
        onTap: () {
          openFiles();
        },
        child: Container(
          width: 350,
          height: 150,
          decoration: BoxDecoration(
            color: const Color(0xFFF2F2F2),
            border: Border.all(color: Colors.white, width: 0.0),
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey, // Shadow color
                offset:
                    Offset(0.0, 4.0), // Offset to create a shadow at the bottom
                blurRadius: 4.0, // Blur radius
              ),
            ],
          ),

          // color: Colors.blueGrey,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.folder_open_rounded,
                color: Colors.blue,
                size: 48,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "Select File",
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}

enum HourTypes { passive, activeCollection, activeTime }

class MyRadios extends StatefulWidget {
  final ValueChanged<HourTypes?>? onRadioChanged;

  const MyRadios({Key? key, this.onRadioChanged}) : super(key: key);

  @override
  State<MyRadios> createState() => _MyRadiosState();
}

class _MyRadiosState extends State<MyRadios> {
  HourTypes? _character = HourTypes.passive;

  Color radioColor = const Color.fromRGBO(167, 142, 60, 1);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('Passive Hours'),
          leading: Radio<HourTypes>(
            value: HourTypes.passive,
            groupValue: _character,
            onChanged: (HourTypes? value) {
              setState(() {
                _character = value;
                if (widget.onRadioChanged != null) {
                  widget.onRadioChanged!(value);
                }
              });
            },
            activeColor: radioColor, //
          ),
        ),
        ListTile(
          title: const Text('Active Time'),
          leading: Radio<HourTypes>(
            value: HourTypes.activeTime,
            groupValue: _character,
            onChanged: (HourTypes? value) {
              setState(() {
                _character = value;
                if (widget.onRadioChanged != null) {
                  widget.onRadioChanged!(value);
                }
              });
            },
            activeColor: radioColor, // Set the color here
          ),
        ),
        ListTile(
          title: const Text('Active Collection'),
          leading: Radio<HourTypes>(
            value: HourTypes.activeCollection,
            groupValue: _character,
            onChanged: (HourTypes? value) {
              setState(() {
                _character = value;
                if (widget.onRadioChanged != null) {
                  widget.onRadioChanged!(value);
                }
              });
            },
            activeColor: radioColor, // Set the color here
          ),
        ),
      ],
    );
  }
}

class DropdownWidget extends StatelessWidget {
  final List<String> items;
  final String? selectedItem;
  final ValueChanged<String?>? onChanged;

  const DropdownWidget({
    super.key,
    required this.items,
    required this.selectedItem,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      hint: const Text("Select Event Name"),
      dropdownColor: const Color.fromARGB(255, 237, 239, 241),
      value: selectedItem,
      onChanged: onChanged,
      icon: const Icon(Icons.arrow_drop_down),
      isExpanded: true,
      underline: const SizedBox(),
      items: items.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
    );
  }
}
