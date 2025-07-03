import 'package:flutter/material.dart';
import 'package:frist_app/Home.dart';
import 'package:frist_app/filter.dart';

void main() => runApp(thingbrfore());

class thingbrfore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'PTSans'),
      home: HunzaTripsPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HunzaTripsPage extends StatelessWidget {
  final List<Map<String, dynamic>> trips = [
    {
      "title": "Cherry Blossom Trip to Hunza Valley\n 2023",
      "location": "21 jun 2023",
      "image": "images/dast.jpg",
    },
    {
      "title": "Trip To Hunza & Khunjerab Pass\n 2024",
      "location": "23 may 2024",
      "image": "images/naran.jpg",
    },
    {
      "title": "Trip To Hunza & Khunjerab Pass\n 2025",
      "location": "24 april 2025",
      "image": "images/cheary.jpg",
    },
    {
      "title": "Trip To Hunza & Khunjerab Pass\n 2019",
      "location": "19 june 2019",
      "image": "images/sightseeing.jpg",
    },
    {
      "title": "Trip To Hunza & Khunjerab Pass\n 2021",
      "location": "10 Decmber 2021",
      "image": "images/montin.jpg",
    },
    {
      "title": "Trip To Hunza & Khunjerab Pass\n 2024",
      "location": "19 Agust 2024",
      "image": "images/road.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Homepage()));
          },
        ),
        title: Text("thing brfore "),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.tune),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Filter()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: trips.length,
        itemBuilder: (context, index) {
          final trip = trips[index];
          return Card(
            margin: EdgeInsets.all(10),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(15)),
                      child: Image.asset(
                        trip['image'],
                        width: double.infinity,
                        height: 160,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(trip['location'],
                          style: TextStyle(color: Colors.grey)),
                      SizedBox(height: 4),
                      Text(
                        trip['title'],
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      SizedBox(height: 8),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
