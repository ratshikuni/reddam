import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

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
      appBar: AppBar(
        elevation: 0,
        title: const Text("Log Hours"),
        centerTitle: true,
      ),
      body: ListView(
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
              width:
                  MediaQuery.of(context).size.width, // Expand to screen width
              padding: const EdgeInsets.only(left: 16, right: 16),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(15)),

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
            width: MediaQuery.of(context).size.width,
            height: 50,
            padding: const EdgeInsets.only(left: 16, right: 16),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(15)),
            child: const TextField(
              decoration: InputDecoration(
                hintText: 'Enter Hours',
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            padding: const EdgeInsets.only(left: 16, right: 16),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(15)),
            child: const TextField(
              decoration: InputDecoration(
                hintText: 'Enter Slip Number',
              ),
            ),
          ),
          const SizedBox(height: 20),
          content(),
        ],
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
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(15)),
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
      dropdownColor: Colors.white,
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
