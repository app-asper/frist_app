import 'package:flutter/material.dart';
import 'package:frist_app/Home.dart';
import 'package:frist_app/location.dart';
import 'location.dart';

void main() => runApp(Khabir());

class Khabir extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Khabir Cities',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'PtSans',
      ),
      home: KhabirCitiesPage(),
    );
  }
}

class KhabirCitiesPage extends StatelessWidget {
  final List<String> cities = [
    'Haripur'
        'Chitral'
        'Batkhela'
        'Swabi'
        ' Dir (Upper/Lower'
        ' Hangu'
        'Tank'
        'Buner'
        'Shangla'
        'Karak'
        'Abbottabad'
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
        title: Text('Khabir',
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
                      case 'Haripur ':
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Homepage()));
                        break;
                      case 'Chitral':
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Homepage()));
                        break;
                      case 'Batkhela':
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Homepage()));
                        break;
                      case 'Dir (Upper/Lower':
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Homepage()));
                        break;
                      case 'Hangu':
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Homepage()));
                        break;
                      case 'Tank':
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Homepage()));
                        break;
                      case 'Buner':
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Homepage()));
                      case 'Shangla':
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Homepage()));
                      case 'Karak':
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Homepage()));
                      case 'Abbottabad':
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
