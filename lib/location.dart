import 'package:flutter/material.dart';
import 'package:frist_app/Home.dart';
import 'northareas.dart';
import 'islamabad.dart';
import 'Sindh.dart';
import 'Balochistan.dart';
import 'AzadKasmir.dart';
import 'Khabir.dart';
import 'Pnajab.dart';

void main() => runApp(LocationPage());

class LocationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LocationScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'PtSans', // Add your font family
      ),
    );
  }
}

class LocationScreen extends StatelessWidget {
  final List<String> states = [
    'Azad Kashmir',
    'Baloshistan',
    'Islamabad Capital Territory',
    'Khyber Pakhtunkhwa',
    'Northern Areas',
    'Punjab',
    'Sindh',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 1,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Homepage()),
            );
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search your City',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),

          // Use current city
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Row(
              children: [
                Icon(Icons.my_location, color: Colors.green),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Use Current City',
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      'Lahore',
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Choose state label
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Text(
              'CHOOSE STATE',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                color: Colors.green[200],
              ),
            ),
          ),

          // State list
          Expanded(
            child: ListView.separated(
              itemCount: states.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(states[index]),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {
                    switch (states[index]) {
                      case 'Azad Kashmir':
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Azadkasmir()));
                        break;
                      case 'Baloshistan':
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Balochistan()));
                        break;
                      case 'Islamabad Capital Territory':
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => islamabad()));
                        break;
                      case 'Khyber Pakhtunkhwa':
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Khabir()));
                        break;
                      case 'Northern Areas':
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Northless()));
                        break;
                      case 'Punjab':
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Punjab()));
                        break;
                      case 'Sindh':
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Sindh()));
                        break;
                      default:
                        break;
                    }

                    // Handle tap if needed
                  },
                );
              },
              separatorBuilder: (context, index) => Divider(height: 1),
            ),
          ),
        ],
      ),
    );
  }
}
