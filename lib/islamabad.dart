import 'package:flutter/material.dart';
import 'package:frist_app/Home.dart';
import 'package:frist_app/location.dart';

void main() => runApp(islamabad());

class islamabad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Islamabad Cities',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'PtSans',
      ),
      home: PunjabCitiesPage(),
    );
  }
}

class PunjabCitiesPage extends StatelessWidget {
  final List<String> cities = [
    'Murree',
    'Taxila',
    'Wah Cantt',
    'Kahuta',
    'Gujar Khan',
    'Chakwal',
    'Fateh Jang',
    'Attock',
    'Mandra',
    'Kallar Syedan',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LocationPage()),
              );
            }),
        title: Text('Islamabad',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search your City',
                prefixIcon: Icon(Icons.search),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                filled: true,
                fillColor: Colors.grey.shade100,
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: Colors.green.shade50,
            child: Text('CHOOSE CITY',
                style: TextStyle(fontWeight: FontWeight.w600)),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cities.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(cities[index]),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    switch (cities[index]) {
                      case 'Murree':
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Homepage()));
                        break;
                      case 'Taxila':
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Homepage()));
                        break;
                      case 'Wah Cantt':
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Homepage()));
                        break;
                      case 'Gujar Khan':
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Homepage()));
                        break;
                      case 'Fateh Jang':
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Homepage()));
                        break;
                      case 'Attock':
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Homepage()));
                        break;
                      case 'Chakwal':
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Homepage()));
                      case 'Mandra':
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Homepage()));
                      case 'Kallar Syedan':
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Homepage()));
                      case 'Daska':
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Homepage()));
                        break;
                      default:
                        break;
                    }
                    // Handle city selection
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
