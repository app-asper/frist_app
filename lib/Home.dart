import 'package:flutter/material.dart';
import 'package:frist_app/hotoffer.dart';
import 'package:frist_app/popluar.dart';
import 'package:frist_app/ready%20to%20go.dart';
import 'package:frist_app/tranding%20tour.dart';

void main() => runApp(Homepage());

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel App',
      theme: ThemeData(fontFamily: 'PTSans'),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Map<String, String>> topCategories = [
    {'title': 'Sightseeing', 'image': 'images/dast.jpg'},
    {'title': 'Beach', 'image': 'images/sightseeing.jpg'},
    {'title': 'Camping', 'image': 'images/dast.jpg'},
    {'title': 'Mountains', 'image': 'images/sightseeing.jpg'},
    {'title': 'Desert', 'image': 'images/dast.jpg'},
    {'title': 'City Tours', 'image': 'images/dast.jpg'},
  ];

  final List<Map<String, String>> bottomCategories = [
    {'title': 'Mountains', 'image': 'images/dast.jpg'},
    {'title': 'Desert', 'image': 'images/sightseeing.jpg'},
    {'title': 'City Tours', 'image': 'images/dast.jpg'},
    {'title': 'Mountains', 'image': 'images/sightseeing.jpg'},
    {'title': 'Desert', 'image': 'images/dast.jpg'},
    {'title': 'City Tours', 'image': 'images/sightseeing.jpg'},
  ];

  final List<Map<String, String>> topTrendingTours = [
    {
      'from': 'Lahore',
      'title': 'Cherry Blossom Trip to Hunza Valley',
      'price': '7000',
      'rating': '4.5',
      'image': 'images/dast.jpg',
      'logo': 'images/sightseeing.jpg',
    },
    {
      'from': 'Karachi',
      'title': 'Gwadar Beach Adventure',
      'price': '8500',
      'rating': '4.3',
      'image': 'images/sightseeing.jpg',
      'logo': 'images/sightseeing.jpg',
    },
    {
      'from': 'Islamabad',
      'title': 'Trip to Swat Valley',
      'price': '6000',
      'rating': '4.6',
      'image': 'images/sightseeing.jpg',
      'logo': 'images/sightseeing.jpg',
    },
  ];

  final List<Map<String, String>> bottomTrendingTours = [
    {
      'from': 'Islamabad',
      'title': 'Trip to Swat Valley',
      'price': '6000',
      'rating': '4.6',
      'image': 'images/dast.jpg',
      'logo': 'images/sightseeing.jpg',
    },
    {
      'from': 'Peshawar',
      'title': 'Safari in Cholistan Desert',
      'price': '7500',
      'rating': '4.4',
      'image': 'images/dast.jpg',
      'logo': 'images/sightseeing.jpg',
    },
    {
      'from': 'Islamabad',
      'title': 'Faisal Masjid and Green Land',
      'price': '7500',
      'rating': '4.4',
      'image': 'images/sightseeing.jpg',
      'logo': 'images/sightseeing.jpg',
    },
  ];

  final List<Map<String, String>> upcomingTours = [
    {
      'from': 'Multan',
      'title': 'Desert Night Camp',
      'price': '9000',
      'rating': '4.2',
      'image': 'images/dast.jpg',
      'logo': 'images/sightseeing.jpg',
    },
    {
      'from': 'Lahore',
      'title': 'Kashmir Spring Tour',
      'price': '8200',
      'rating': '4.8',
      'image': 'images/sightseeing.jpg',
      'logo': 'images/sightseeing.jpg',
    },
  ];

  final List<Map<String, String>> weekendTours = [
    {
      'from': 'Karachi',
      'title': 'Weekend at Kund Malir',
      'price': '5000',
      'rating': '4.1',
      'image': 'images/dast.jpg',
      'logo': 'images/sightseeing.jpg',
    },
    {
      'from': 'Islamabad',
      'title': 'Murree Hills Day Trip',
      'price': '4500',
      'rating': '4.3',
      'image': 'images/sightseeing.jpg',
      'logo': 'images/sightseeing.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.location_on, color: Colors.green),
            SizedBox(width: 4),
            Text("Lahore", style: TextStyle(color: Colors.black)),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Text("Where do you\n want to go?",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          SizedBox(height: 12),
          TextField(
            decoration: InputDecoration(
              hintText: 'Search for the place',
              prefixIcon: Icon(Icons.search),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildRoundIcon(Icons.explore, "Explore"),
              _buildRoundIcon(Icons.event, "Activities"),
              _buildRoundIcon(Icons.map, "Plan Trip"),
            ],
          ),
          SizedBox(height: 20),
          _buildSectionTitle("Categories"),
          SizedBox(height: 10),
          _buildCategoryList(topCategories),
          SizedBox(height: 20),
          _buildSectionHeader(
              context, "Trending Tours", topTrendingTours, true),
          SizedBox(height: 10),
          _buildTourList(topTrendingTours),
          SizedBox(height: 24),
          Container(
            margin: EdgeInsets.symmetric(vertical: 8),
            height: 70,
            decoration: BoxDecoration(
              color: Colors.green.shade50,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text("Ad Banner",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green)),
            ),
          ),
          SizedBox(height: 24),
          _buildSectionTitle("Popular Destination"),
          SizedBox(height: 10),
          _buildCategoryList(bottomCategories),
          SizedBox(height: 20),
          _buildSectionHeader(
              context, "Ready To Go Tours", bottomTrendingTours, false),
          SizedBox(height: 10),
          _buildTourList(bottomTrendingTours),
          SizedBox(height: 20),
          _buildSectionHeader(context, "Hot Offer", upcomingTours, false,
              isUpcoming: true),
          SizedBox(height: 10),
          _buildTourList(upcomingTours),
          SizedBox(height: 20),
          _buildSectionHeader(
              context, "Popular Activities", weekendTours, false,
              isWeekend: true),
          SizedBox(height: 10),
          _buildTourList(weekendTours),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.hiking), label: "My Trips"),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: "Explore"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }

  Widget _buildRoundIcon(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: Colors.green.shade50,
          child: Icon(icon, color: Colors.green),
        ),
        SizedBox(height: 7),
        Text(label)
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Row(
      children: [
        Text(title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title,
      List<Map<String, String>> items, bool isTop,
      {bool isUpcoming = false, bool isWeekend = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        TextButton(
            onPressed: () {
              Widget page;
              if (isTop) {
                page = togo();
              } else if (isUpcoming) {
                page = Myall111();
              } else if (isWeekend) {
                page = Myall11();
              } else {
                page = Myall();
              }

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => page),
              );
            },
            child: Text("See All")),
      ],
    );
  }

  Widget _buildCategoryList(List<Map<String, String>> categories) {
    return SizedBox(
      height: 130,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return _buildCategoryCard(categories[index]);
        },
      ),
    );
  }

  Widget _buildCategoryCard(Map<String, String> category) {
    return Container(
      height: 100,
      width: 100,
      margin: EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        image: DecorationImage(
          image: AssetImage(category['image']!),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 5),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(14)),
          ),
          child: Text(
            category['title']!,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget _buildTourList(List<Map<String, String>> tours) {
    return SizedBox(
      height: 260,
      child: PageView.builder(
        controller: PageController(viewportFraction: 0.85),
        itemCount: tours.length,
        itemBuilder: (context, index) {
          final tour = tours[index];

          return _buildTourCard(
            from: tour['from']!,
            title: tour['title']!,
            price: tour['price']!,
            rating: tour['rating']!,
            imagePath: tour['image']!,
            logoPath: tour['logo']!,
          );
        },
      ),
    );
  }

  Widget _buildTourCard({
    required String from,
    required String title,
    required String price,
    required String rating,
    required String imagePath,
    required String logoPath,
  }) {
    return Container(
      margin: EdgeInsets.only(right: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.shade300, blurRadius: 5, offset: Offset(0, 3)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.asset(
                  imagePath,
                  height: 130,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.white,
                  child: ClipOval(
                    child: Image.asset(
                      logoPath,
                      height: 30,
                      width: 30,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text("13% OFF",
                      style: TextStyle(color: Colors.white, fontSize: 10)),
                ),
              ),
              Positioned(
                bottom: 10,
                left: 10,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: Colors.orangeAccent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text("3 Bookings Left",
                      style: TextStyle(color: Colors.white, fontSize: 10)),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("From - $from",
                    style: TextStyle(color: Colors.grey, fontSize: 12)),
                SizedBox(height: 4),
                Text(title,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("PKR $price / Person",
                        style: TextStyle(
                            color: Colors.green, fontWeight: FontWeight.bold)),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 16),
                        SizedBox(width: 3),
                        Text(rating,
                            style: TextStyle(fontWeight: FontWeight.bold)),
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
  }
}

// Dummy Pages for See All
class TopTrendingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(" Trending Tours")),
      body: Center(child: Text(" Trending Tour List")),
    );
  }
}

class BottomReadyToGoTours extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ready To Go Tours")),
      body: Center(child: Text("Ready To Go Tours")),
    );
  }
}

class HoteOffer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hot Offer")),
      body: Center(child: Text("Hot Offer")),
    );
  }
}

class PopularActivities extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Popular Activities")),
      body: Center(child: Text("Popular Activities")),
    );
  }
}
