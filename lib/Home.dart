import 'package:flutter/material.dart';
import 'package:frist_app/My%20Tripes.dart';
import 'package:frist_app/TrevelGudiens.dart';
import 'package:frist_app/explore.dart';
import 'package:frist_app/hotoffer.dart';
import 'package:frist_app/location.dart';
import 'package:frist_app/notifaciton.dart';
import 'package:frist_app/planTrip.dart';
import 'package:frist_app/popluar.dart';
import 'package:frist_app/profile.dart';
import 'package:frist_app/ready to go.dart';
import 'package:frist_app/tranding tour.dart';
import 'My Tripes.dart';
import 'profile.dart';
import 'popluar.dart';
import 'newexplore.dart';
import 'explore.dart';
import 'thing to before.dart';

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

  final List<Map<String, String>> readytogo = [
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

  final List<Map<String, String>> dasrtnightcamp = [
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

  final List<Map<String, String>> featured = [
    {
      'from': 'Multan',
      'title': 'Desert Night Camp',
      'price': '900',
      'rating': '4.f',
      'image': 'images/dast.jpg',
      'logo': 'images/sightseeing.jpg',
    },
    {
      'from': 'Lahore',
      'title': 'Kashmir Spring our',
      'price': '820',
      'rating': '4.0',
      'image': 'images/sightseeing.jpg',
      'logo': 'images/sightseeing.jpg',
    },
  ];
  final List<Map<String, String>> travelgudie = [
    {
      'title': 'Krachi\nTo\n Naran \n Travel \n Guides',
      'image': 'images/dast.jpg'
    },
    {
      'title': 'Krachi\nTo\n Naran \n Travel \n Guides',
      'image': 'images/sightseeing.jpg'
    },
  ];

  final List<Map<String, String>> Thingbefore = [
    {
      'from': '21 jun 2023',
      'title': 'Travel is my best terphy\n 2023',
      'price': '820',
      'rating': '4.0',
      'image': 'images/sightseeing.jpg',
      'logo': 'images/sightseeing.jpg',
    },
    {
      'from': '21 jun 2023',
      'title': 'Travel is my best terphy\n 2023',
      'price': '820',
      'rating': '4.0',
      'image': 'images/sightseeing.jpg',
      'logo': 'images/sightseeing.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LocationPage()),
            );
          },
          child: Row(
            children: [
              Icon(Icons.location_on, color: Colors.green),
              SizedBox(width: 4),
              Text("Lahore", style: TextStyle(color: Colors.black)),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationPage()),
              );
            },
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
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Search()),
              );
            },
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
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Search()),
                  );
                },
                child: _buildRoundIcon(Icons.explore, "Explore"),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PlanTrip()),
                  );
                },
                child: _buildRoundIcon(Icons.event, "Activities"),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PlanTrip()),
                  );
                },
                child: _buildRoundIcon(Icons.map, "Plan Trip"),
              ),
            ],
          ),
          SizedBox(height: 20),
          _buildSectionTitle("Categories"),
          SizedBox(height: 10),
          _buildCategoryList(topCategories),
          SizedBox(height: 20),
          _buildSectionHeader(context, "Trending Tours", topTrendingTours,
              isTrendingTours: true),
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
          _buildbottomCategoriesList(bottomCategories),
          SizedBox(height: 20),
          _buildSectionHeader(context, "Ready To Go Tours", readytogo,
              isradytogo: true),
          SizedBox(height: 10),
          _buildTourList(readytogo),
          SizedBox(height: 20),
          _buildSectionHeader(context, "Hot Offer", upcomingTours,
              isUpcoming: true),
          SizedBox(height: 10),
          _buildTourList(upcomingTours),
          SizedBox(height: 20),
          _buildSectionHeader(context, "Popular Activities", weekendTours,
              isWeekend: true),
          SizedBox(height: 10),
          _buildTourList(weekendTours),
          SizedBox(height: 20),
          _buildSectionHeader(context, "Travel Guides", travelgudie,
              isTravelgudie: true),
          SizedBox(height: 20),
          _buildtravelgudieList(travelgudie),
          SizedBox(height: 20),
          _buildSectionHeader(
              context, "Things To Do Before\n Going Trip", Thingbefore,
              isFeedback: true),
          SizedBox(height: 10),
          _buildTourList(Thingbefore, isFeatured: true),
          SizedBox(height: 20),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyTripsPage()),
            );
          }
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => explore()),
            );
          }
          if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );
          }
        },
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
        SizedBox(height: 5),
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

  Widget _buildSectionHeader(
    BuildContext context,
    String title,
    List<Map<String, String>> items, {
    bool isTravelgudie = false,
    bool isUpcoming = false,
    bool isWeekend = false,
    bool isTrendingTours = false,
    bool isFeedback = false,
    bool isradytogo = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        TextButton(
            onPressed: () {
              Widget page;
              if (isTrendingTours) {
                page = togo();
              } else if (isUpcoming) {
                page = hotoffer();
              } else if (isWeekend) {
                page = popluar();
              } else if (isradytogo) {
                page = Myall();
              } else if (isTravelgudie) {
                page = TravelGuide();
              } else if (isFeedback) {
                page = thingbrfore();
              } else {
                page = Scaffold(
                  appBar: AppBar(title: Text("Page Not Found")),
                  body: Center(child: Text("No matching condition.")),
                );
              }
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => page));
            },
            child: Text("See All")),
      ],
    );
  }

  Widget _buildCategoryList(List<Map<String, String>> categories) {
    return SizedBox(
      height: 160,
      width: 160,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return _buildCategoryCard(
            categories[index],
            100,
          );
        },
      ),
    );
  }

  Widget _buildbottomCategoriesList(
      List<Map<String, String>> bottomCategories) {
    return SizedBox(
      height: 160,
      width: 160,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: bottomCategories.length,
        itemBuilder: (context, index) {
          return _buildCategoryCard(
            bottomCategories[index],
            100,
          );
        },
      ),
    );
  }

  Widget _buildtravelgudieList(List<Map<String, String>> travelgudie,
      {bool isLarge = false}) {
    double size = isLarge ? 100 : 170;

    return SizedBox(
      height: 250,
      width: 280,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: travelgudie.length,
        itemBuilder: (context, index) {
          return _buildCategoryCard(
            travelgudie[index],
            size,
            isLargeText: true,
          );
        },
      ),
    );
  }

  Widget _buildCategoryCard(Map<String, String> category, double size,
      {bool isLargeText = false}) {
    return Container(
      height: size,
      width: size,
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
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: isLargeText ? 20 : 16,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTourList(List<Map<String, String>> tours,
      {bool isFeatured = false}) {
    return SizedBox(
      height: 290,
      child: PageView.builder(
        controller: PageController(
          viewportFraction: 0.93, // 👈 Large card + partial side card visible
        ),
        itemCount: tours.length,
        itemBuilder: (context, index) {
          final tour = tours[index];
          return Padding(
            padding: EdgeInsets.only(
              left: index == 0 ? 16 : 6,
            ),
            child: GestureDetector(
              onTap: () {
                print(
                    "${isFeatured ? "Custom" : "Default"} card clicked: ${tour['title']}");
              },
              child: _buildTourCard(
                from: tour['from']!,
                title: tour['title']!,
                price: tour['price']!,
                rating: tour['rating']!,
                imagePath: tour['image']!,
                logoPath: tour['logo']!,
                hideInfo: isFeatured,
              ),
            ),
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
    bool hideInfo = false,
  }) {
    return Container(
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
              if (!hideInfo)
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
              if (!hideInfo)
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
              if (!hideInfo)
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
                if (!hideInfo)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("PKR $price / Person",
                          style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold)),
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
