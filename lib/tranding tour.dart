import 'package:flutter/material.dart';
import 'package:frist_app/Home.dart';
import 'package:frist_app/filter.dart';
import 'package:frist_app/tripdeatil.dart';

void main() => runApp(Myall());

class Myall extends StatelessWidget {
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
      "title": "Cherry Blossom Trip to Hunza Valley",
      "location": "From - Lahore",
      "duration": "9 days",
      "groupSize": "20 people",
      "price": "PKR 7000",
      "rating": 4.5,
      "image": "images/dast.jpg",
      "availability": "3 Booking Left",
      "discount": "13% OFF"
    },
    {
      "title": "Trip To Hunza & Khunerab Pass",
      "location": "From - Lahore",
      "duration": "10 days",
      "groupSize": "20 people",
      "price": "PKR 7000",
      "rating": 4.2,
      "image": "images/sightseeing.jpg",
      "availability": "3 Booking Left",
      "discount": "13% OFF"
    },
    {
      "title": "Trip To Hunza & Khunj Pass",
      "location": "From - Lahore",
      "duration": "14 days",
      "groupSize": "20 people",
      "price": "PKR 7500",
      "rating": 4.5,
      "image": "images/sightseeing.jpg",
      "availability": "3 Booking Left",
      "discount": "09% OFF"
    },
    {
      "title": "Trip To aptabad & Khabir Pass",
      "location": "From - Lahore",
      "duration": "09 days",
      "groupSize": "20 people",
      "price": "PKR 3999",
      "rating": 4.7,
      "image": "images/sightseeing.jpg",
      "availability": "3 Booking Left",
      "discount": "10% OFF"
    },
    {
      "title": "Trip To isad & Khunjerab Pass",
      "location": "From - Lahore",
      "duration": "10 days",
      "groupSize": "21 people",
      "price": "PKR 3000",
      "rating": 4.2,
      "image": "images/sightseeing.jpg",
      "availability": "3 Booking Left",
      "discount": "16% OFF"
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
        title: Text(" Ready To Go Tour"),
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
          return InkWell(
            onTap: () {
              if (index == 0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyAp()),
                );
              } else {
                // Just click effect, no navigation
                debugPrint("Card $index clicked");
              }
            },
            splashColor: Colors.grey.withOpacity(0.3),
            borderRadius: BorderRadius.circular(15),
            child: Card(
              margin: EdgeInsets.all(16),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
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
                      if (trip['availability'] != "")
                        Positioned(
                          top: 10,
                          left: 10,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.white70,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(trip['availability'],
                                style: TextStyle(fontSize: 12)),
                          ),
                        ),
                      Positioned(
                        top: 39,
                        left: 9,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(trip['discount'],
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12)),
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
                        Row(
                          children: [
                            Icon(Icons.schedule, size: 16, color: Colors.grey),
                            SizedBox(width: 4),
                            Text(trip['duration']),
                            SizedBox(width: 16),
                            Icon(Icons.group, size: 16, color: Colors.grey),
                            SizedBox(width: 4),
                            Text(trip['groupSize']),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              trip['price'] + " / Person",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            Row(
                              children: [
                                Icon(Icons.star,
                                    color: Colors.orange, size: 18),
                                SizedBox(width: 4),
                                Text(trip['rating'].toString(),
                                    style: TextStyle(fontSize: 16))
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
