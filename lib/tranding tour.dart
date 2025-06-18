import 'package:flutter/material.dart';

void main() => runApp(Myall());

class Myall extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TrendingToursPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TrendingToursPage extends StatelessWidget {
  final List<Map<String, dynamic>> tours = [
    {
      "image": "images/dast.jpg",
      "title": "Cherry Blossom Trip to Hunza Valley",
      "from": "Lahore",
      "duration": "10 days",
      "groupSize": "18 people",
      "price": "PKR 7000",
      "rating": 4.5,
      "discount": "13%",
      "bookingLeft": "3 Booking Left"
    },
    {
      "image": "images/sightseeing.jpg",
      "title": "Trip To Hunza & Khunjerab Pass",
      "from": "Lahore",
      "duration": "12 days",
      "groupSize": "22 people",
      "price": "PKR 8500",
      "rating": 4.7,
      "discount": "13%",
      "bookingLeft": "3 Booking Left"
    },
    {
      "image": "images/sightseeing.jpg",
      "title": "Trip To Hunza & Khunjerab Pass",
      "from": "Lahore",
      "duration": "12 days",
      "groupSize": "22 people",
      "price": "PKR 8500",
      "rating": 4.7,
      "discount": "13%",
      "bookingLeft": "3 Booking Left"
    },
    {
      "image": "images/dast.jpg",
      "title": "Cherry Blossom Trip to Hunza Valley",
      "from": "Lahore",
      "duration": "10 days",
      "groupSize": "18 people",
      "price": "PKR 7000",
      "rating": 4.5,
      "discount": "13%",
      "bookingLeft": "3 Booking Left"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Trending Tours", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none), // Bell icon
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => NotificationsPage()),
              );
            },
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.filter_list),
          ),
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: tours.length,
        itemBuilder: (context, index) {
          final tour = tours[index];
          return Card(
            margin: EdgeInsets.only(bottom: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(16)),
                      child: Image.asset(
                        tour["image"],
                        height: 160,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    if (tour.containsKey("bookingLeft"))
                      Positioned(
                        top: 11,
                        left: 8,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(tour["bookingLeft"],
                              style: TextStyle(fontSize: 12)),
                        ),
                      ),
                    Positioned(
                      top: 10,
                      right: 12,
                      child: Icon(Icons.favorite_border, color: Colors.white),
                    ),
                    Positioned(
                      top: 40,
                      left: 8,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text("${tour["discount"]} OFF",
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
                      Text("From - ${tour["from"]}",
                          style:
                              TextStyle(fontSize: 12, color: Colors.black54)),
                      SizedBox(height: 4),
                      Text(
                        tour["title"],
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.schedule, size: 14, color: Colors.grey),
                          SizedBox(width: 4),
                          Text(tour["duration"],
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey)),
                          SizedBox(width: 12),
                          Icon(Icons.group, size: 14, color: Colors.grey),
                          SizedBox(width: 4),
                          Text(tour["groupSize"],
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey)),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            tour["price"] + " / Person",
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.amber, size: 16),
                              SizedBox(width: 4),
                              Text(tour["rating"].toString(),
                                  style: TextStyle(fontSize: 12)),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Center(
        child: Text(
          "No Notifications Yet",
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
