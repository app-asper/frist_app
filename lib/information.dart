import 'package:flutter/material.dart';
import 'package:frist_app/Home.dart';

class InformationScreen extends StatefulWidget {
  @override
  _InformationScreenState createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController cnicController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  String? maritalStatus;

  final List<String> maritalStatuses = [
    "Single",
    "Married",
    "Divorced",
    "Widowed"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Profile",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Homepage()));
            },
            child: Text("Skip",
                style: TextStyle(color: Colors.blue, fontSize: 16)),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Profile Picture
                    Center(
                      child: Stack(
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.grey.shade300,
                            child: Icon(Icons.person,
                                color: Colors.white, size: 50),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 10,
                            child: CircleAvatar(
                              radius: 14,
                              backgroundColor: Colors.green,
                              child: Icon(Icons.camera_alt,
                                  color: Colors.white, size: 14),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),

                    // Email
                    Text("Email",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 5),
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: "Enter your email",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty)
                          return "Please enter your email";
                        return null;
                      },
                    ),
                    SizedBox(height: 14),

                    // Date of Birth
                    Text("Date of Birth",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 5),
                    TextFormField(
                      controller: dobController,
                      decoration: InputDecoration(
                        hintText: "DD - MM - YYYY",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty)
                          return "Please enter your date of birth";
                        return null;
                      },
                    ),
                    SizedBox(height: 14),

                    // CNIC
                    Text("CNIC", style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 5),
                    TextFormField(
                      controller: cnicController,
                      decoration: InputDecoration(
                        hintText: "35201 - 1234567 - 7",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 14),

                    Text("Marital Status",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 5),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      value: maritalStatus,
                      items: maritalStatuses.map((String status) {
                        return DropdownMenuItem<String>(
                          value: status,
                          child: Text(status),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          maritalStatus = value;
                        });
                      },
                      validator: (value) {
                        if (value == null)
                          return "Please select your marital status";
                        return null;
                      },
                    ),
                    SizedBox(height: 14),

                    // Address
                    Text("Address",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 5),
                    TextFormField(
                      controller: addressController,
                      decoration: InputDecoration(
                        hintText: "House, Street, Area",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty)
                          return "Please enter your address";
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Save & Continue Button (Fixed Position)
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                backgroundColor: Colors.green,
                minimumSize: Size(double.infinity, 50),
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  print(
                      "Email: ${emailController.text}, DOB: ${dobController.text}, CNIC: ${cnicController.text}, Marital Status: $maritalStatus, Address: ${addressController.text}");
                }

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Homepage()));
              },
              child: Text("Save & Continue",
                  style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
