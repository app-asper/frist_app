import 'package:flutter/material.dart';
import 'package:frist_app/Home.dart';

void main() => runApp(TravelGuide());

class TravelGuide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TravelGuidesPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TravelGuidesPage extends StatelessWidget {
  final List<Map<String, String>> guides = [
    {
      "title": "Karachi to Naran Travel Guide",
      "image": "images/naran.jpg",
    },
    {
      "title": "Ansu Lake Travel Guide",
      "image": "images/karchi.jpg",
    },
    {
      "title": "Karachi to Naran Travel Guide",
      "image": "images/dast.jpg",
    },
    {
      "title": "Ansu Lake Travel Guide",
      "image": "images/road.jpg",
    },
    {
      "title": "Karachi to Naran Travel Guide",
      "image": "images/montin.jpg",
    },
    {
      "title": "Ansu Lake Travel Guide",
      "image": "images/sightseeing.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Homepage()),
            );
          },
        ),
        title: Text('Travel Guides'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: guides.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return TravelGuideCard(
              title: guides[index]['title']!,
              imagePath: guides[index]['image']!,
            );
          },
        ),
      ),
    );
  }
}

class TravelGuideCard extends StatelessWidget {
  final String title;
  final String imagePath;

  const TravelGuideCard({required this.title, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.bottomLeft,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.1),
                  Colors.black.withOpacity(0.7)
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
                height: 1.3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
