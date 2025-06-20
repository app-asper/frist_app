import 'package:flutter/material.dart';
import 'Editprofile.dart'; // Corrected import

class editprofrofil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile information'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: ListView(
          children: [
            ProfileField(title: 'User Name', value: '@anees063'),
            ProfileField(title: 'City', value: 'Lahore'),
            ProfileField(title: 'Date of Birth', value: '08 - 04 - 2007'),
            ProfileField(title: 'CNIC', value: '35201 - 1771800 - 6'),
            ProfileField(title: 'Marital Status', value: 'Single'),
            ProfileField(title: 'Email', value: 'none'),
            ProfileField(title: 'Phone Number', value: '+92 306 - 45 44 717'),
            ProfileField(
              title: 'Address',
              value: '30 - A Tariq Block New Garden Town Lahore',
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Editprofile()),
                );
              },
              style: ElevatedButton.styleFrom(
                side: BorderSide(color: Colors.green),
                backgroundColor: Colors.white,
                foregroundColor: Colors.green,
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
              child: Text('Edit Profile'),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileField extends StatelessWidget {
  final String title;
  final String value;

  const ProfileField({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 13, color: Colors.grey),
          ),
          SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Divider(),
        ],
      ),
    );
  }
}
