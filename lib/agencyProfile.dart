import 'package:flutter/material.dart';
import 'package:frist_app/agency2.dart';
import 'package:frist_app/tripdeatil.dart';

void main() {
  runApp(const agencyprofile());
}

class agencyprofile extends StatelessWidget {
  const agencyprofile({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'PtSans'),
      home: const AgencyProfilePage(),
    );
  }
}

class AgencyProfilePage extends StatelessWidget {
  const AgencyProfilePage({super.key});

  final List<Map<String, dynamic>> tripList = const [
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
      "title": "Trip to Hunza & Khunjerab Pass",
      "location": "From - Lahore",
      "duration": "16 days",
      "groupSize": "22 people",
      "price": "PKR 17000",
      "rating": 4.6,
      "image": "images/montin.jpg",
      "availability": null,
      "discount": "13% OFF"
    },
    {
      "title": "Trip to Hunza & Naltar",
      "location": "From - Lahore",
      "duration": "16 days",
      "groupSize": "22 people",
      "price": "PKR 17000",
      "rating": 4.7,
      "image": "images/road.jpg",
      "availability": null,
      "discount": null
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agency Profile'),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MyAp()),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'images/boys.jpg',
              width: double.infinity,
              height: 250, // Expanded height
              fit: BoxFit.cover,
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage('images/dast.jpg'),
                    radius: 30,
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => agency2()),
                          );
                        },
                        child: const Text(
                          "Adventure Point\nTravel Agency",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Row(
                        children: [
                          Icon(Icons.star, color: Colors.green, size: 16),
                          SizedBox(width: 4),
                          Text("4.8",
                              style: TextStyle(fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Packages",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),

            // Trip Cards
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: tripList.map((trip) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: _tripCard(context, trip),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tripCard(BuildContext context, Map<String, dynamic> trip) {
    return SizedBox(
      width: double.infinity,
      height: 300,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            Image.asset(
              trip['image'],
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            if (trip['discount'] != null)
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    trip['discount'],
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            if (trip['availability'] != null)
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    trip['availability'],
                    style: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            Positioned(
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width - 32,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.95),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(trip['location'],
                        style: TextStyle(color: Colors.grey[600])),
                    const SizedBox(height: 4),
                    Text(trip['title'],
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Icon(Icons.access_time, size: 16),
                        const SizedBox(width: 4),
                        Text(trip['duration']),
                        const SizedBox(width: 12),
                        const Icon(Icons.group, size: 16),
                        const SizedBox(width: 4),
                        Text(trip['groupSize']),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(trip['price'],
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green)),
                        Row(
                          children: [
                            const Icon(Icons.star,
                                color: Colors.orange, size: 18),
                            const SizedBox(width: 2),
                            Text(trip['rating'].toStringAsFixed(1)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
