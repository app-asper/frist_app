import 'package:flutter/material.dart';
import 'package:frist_app/About.dart';
import 'package:frist_app/Help.dart';
import 'package:frist_app/Home.dart';
import 'package:frist_app/My%20Tripes.dart';
import 'package:frist_app/PrivacyPolicy.dart';
import 'package:frist_app/Profilefom.dart';
import 'package:frist_app/explore.dart';
import 'package:frist_app/favortie.dart';
import 'package:frist_app/theme&conditions.dart';
import 'package:frist_app/main.dart'; // <-- Add your target page import here

// Dummy edit profile screen

class EditProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: Center(
        child: Text(
          "Edit Profile Page",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 3;

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 0) {
      Navigator.pop(context);
    } else if (index == 1) {
    } else if (index == 2) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 45,
                    backgroundImage: AssetImage('images/trc.jpg'),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 14,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.camera_alt, size: 16),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Anees Ahmad",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text("@anees063", style: TextStyle(color: Colors.green)),
                ],
              ),
            ],
          ),
          SizedBox(height: 30),

          _buildProfileItem("Profile", onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => editprofrofil()),
            );
          }),

          _buildProfileItem("Fevriote", onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => fevortie()),
            );
          }),
          _buildProfileItem("Help", onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Help()),
            );
          }),
          _buildProfileItem("About", onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => About()),
            );
          }),
          _buildProfileItem("Privacy Policy", onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => privacy()),
            );
          }),
          _buildProfileItem("Thems & conditions", onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => them()),
            );
          }),
          SizedBox(height: 30),

          // 👇 Updated logout with navigation
          Center(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyApp()),
                );
              },
              child: Text(
                "Logout",
                style:
                    TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Homepage()),
            );
          }
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => explore()),
            );
          }
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyTripsPage()),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.hiking), label: "My Trips"),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: "Explore"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }

  Widget _buildProfileItem(String label, {VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 12),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(label, style: TextStyle(fontSize: 16)),
      ),
    );
  }
}
