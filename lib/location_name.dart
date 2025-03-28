import 'package:flutter/material.dart';
import 'information.dart';

class location_name extends StatefulWidget {
  @override
  _location_name createState() => _location_name();
}

class _location_name extends State<location_name> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  String? selectedCity;
  bool isChecked = false;
  final List<String> cities = [
    "Karachi",
    "  Lahore",
    "Islamabad",
    "Rawalpindi",
    "Faisalabad ",
    " Multan ",
    " Peshawar ",
    " Quetta",
    "Sialkot",
    "Hyderabad",
    "Gujranwala",
    " Bahawalpur",
    " Sargodha ",
    " Sukkur",
    "Mardan"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //
                Center(
                  child: Image.asset('images/phone.png', height: 60),
                ),
                Text(
                  "Find everything you \nneed to crush your fitness goals",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: "Full Name",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your full name";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 14),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                      labelText: "Select City",
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black54))),
                  value: selectedCity,
                  items: cities.map((String city) {
                    return DropdownMenuItem<String>(
                      value: city,
                      child: Text(city),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedCity = value;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return "Please select a city";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),

                Row(
                  children: [
                    Checkbox(
                      value: isChecked,
                      onChanged: (value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                    Expanded(
                      child: Text(
                        "Yes, inform me on deals & new features. I can opt out at any time.",
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: Colors.green,
                    minimumSize: Size(double.infinity, 50),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => InformationScreen()),
                    );
                    if (_formKey.currentState!.validate()) {
                      print(
                          "User: ${nameController.text}, City: $selectedCity");
                    }
                  },
                  child:
                      Text("Continue", style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
