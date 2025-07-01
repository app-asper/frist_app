import 'package:flutter/material.dart';
import 'package:frist_app/Home.dart';
import 'package:frist_app/location.dart';

void main() => runApp(Northless());

class Northless extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'North Cities',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'YourFontFamilyName',
      ),
      home: PunjabCitiesPage(),
    );
  }
}

class PunjabCitiesPage extends StatelessWidget {
  final List<String> cities = [
    'Gilgit'
        'Skardu'
        'Hunza'
        'Nagar'
        'Astore'
        'Khaplu'
        'Ghizer'
        'Shigar'
        'Chilas'
        'Fairy Meadows'
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
        title: Text('North Area',
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
                      case 'Gilgit':
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Homepage()));
                        break;
                      case 'Skardu':
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Homepage()));
                        break;
                      case 'Hunza':
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Homepage()));
                        break;
                      case 'Astore':
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Homepage()));
                        break;
                      case 'Khaplu':
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Homepage()));
                        break;
                      case 'Ghizer':
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Homepage()));
                        break;
                      case 'Shigar':
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Homepage()));
                      case 'Chilas':
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Homepage()));
                      case 'Fairy Meadows':
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Homepage()));
                      case 'Kaghan':
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
