import 'package:flutter/material.dart';
import 'package:frist_app/Home.dart';
import 'location.dart';

void main() => runApp(Sindh());

class Sindh extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sindh Cities',
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
    'Hyderabad'
        'Sukkur'
        'Larkana'
        'Nawabshah (Shaheed Benazirabad)'
        'Mirpur Khas'
        'Jacobabad'
        'Shikarpur'
        'Dadu'
        'Thatta'
        'Badin'
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
        title: Text('Sindh',
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
                      case 'Hyderabad':
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Homepage()));
                        break;
                      case 'Sukkur':
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Homepage()));
                        break;
                      case 'Larkana':
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Homepage()));
                        break;
                      case 'Nawabshah (Shaheed Benazirabad)':
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Homepage()));
                        break;
                      case 'bhakkar':
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Homepage()));
                        break;
                      case 'Mirpur Khas':
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Homepage()));
                        break;
                      case 'Jacobabad':
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Homepage()));
                      case 'Shikarpur':
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Homepage()));
                      case 'Dadu':
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Homepage()));
                      case 'Thatta':
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Homepage()));
                      case 'Badin':
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
