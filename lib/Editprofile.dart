import 'package:flutter/material.dart';

class Editprofile extends StatefulWidget {
  @override
  _EditprofileState createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {
  final TextEditingController usernameController =
      TextEditingController(text: '@anees063');
  final TextEditingController cityController =
      TextEditingController(text: 'Lahore');
  final TextEditingController dobController =
      TextEditingController(text: '08 - 04 - 2007');
  final TextEditingController cnicController =
      TextEditingController(text: '35201 - 1771800 - 6');
  final TextEditingController maritalStatusController =
      TextEditingController(text: 'Single');
  final TextEditingController phoneController =
      TextEditingController(text: '+92 306 - 45 44 717');
  final TextEditingController addressController =
      TextEditingController(text: '30 - A Tariq Block New Garden Town Lahore');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Username'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            buildTextField('User Name', usernameController),
            buildTextField('City', cityController),
            buildTextField('Date of Birth', dobController),
            buildTextField('CNIC', cnicController),
            buildTextField('Marital Status', maritalStatusController),
            buildTextField('Phone Number', phoneController),
            buildTextField('Address', addressController),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Save logic can go here
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          hintStyle: TextStyle(color: Colors.grey),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green, width: 2),
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
            borderRadius: BorderRadius.circular(8),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 18),
        ),
      ),
    );
  }
}
