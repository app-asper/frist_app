import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: AgencyProfileCombined(),
  ));
}

class AgencyProfileCombined extends StatefulWidget {
  const AgencyProfileCombined({super.key});

  @override
  State<AgencyProfileCombined> createState() => _AgencyProfileCombinedState();
}

class _AgencyProfileCombinedState extends State<AgencyProfileCombined>
    with TickerProviderStateMixin {
  late TabController _tabController;

  final List<Map<String, dynamic>> tripList = [
    {
      "title": "Cherry Blossom Trip to Hunza Valley",
      "location": "From - Lahore",
      "duration": "9 days",
      "groupSize": "20 people",
      "price": "PKR 7000",
      "rating": "4.5",
      "image": "images/dast.jpg",
      "availability": "3 Booking Left",
      "discount": "13% OFF",
    },
    {
      "title": "Explore Skardu Mountains",
      "location": "From - Lahore",
      "duration": "7 days",
      "groupSize": "15 people",
      "price": "PKR 8500",
      "rating": "4.7",
      "image": "images/cheary.jpg",
      "availability": "5 Booking Left",
      "discount": "10% OFF",
    },
    {
      "title": "Khunjerab Pass Tour",
      "location": "From - Lahore",
      "duration": "10 days",
      "groupSize": "25 people",
      "price": "PKR 9500",
      "rating": "4.6",
      "image": "images/montin.jpg",
      "availability": "2 Booking Left",
      "discount": "15% OFF",
    },
  ];

  final List<Map<String, String>> reviews = [
    {
      "name": "Anees Ahmad",
      "image": "images/anees.jpg",
      "review":
          "It was a great experience! The trip was well organized and the guide was very helpful. Would love to travel again.",
    },
    {
      "name": "Mohsin",
      "image": "images/mohsin.jpg",
      "review":
          "Skardu trip was amazing. The travel agency took care of everything perfectly. Highly recommended!",
    },
    {
      "name": "Ahmad",
      "image": "images/karchi.jpg",
      "review":
          "Cherry blossom season in Hunza was breathtaking. The group was fun and the hotel stays were comfortable.",
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Adventure Point Travel Agency',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.green,
          unselectedLabelColor: Colors.black,
          indicatorColor: Colors.green,
          tabs: const [
            Tab(text: "Packages"),
            Tab(text: "About"),
            Tab(text: "Reviews"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // ----------------- Packages -----------------
          ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: tripList.length,
            itemBuilder: (context, index) {
              final trip = tripList[index];
              return TripCard(
                title: trip["title"]!,
                location: trip["location"]!,
                duration: trip["duration"]!,
                groupSize: trip["groupSize"]!,
                price: trip["price"]!,
                rating: trip["rating"]!,
                image: trip["image"]!,
                availability: trip["availability"]!,
                discount: trip["discount"]!,
              );
            },
          ),

          // ----------------- About -----------------
          SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("About Adventure Point",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 12),
                Text(
                  "Adventure Point is a trusted travel agency providing unique and memorable tours across Pakistan. "
                  "From breathtaking mountains to serene valleys, our packages cover everything for an unforgettable experience. "
                  "We focus on safety, comfort, and creating joyful travel moments for our customers.",
                  style: TextStyle(fontSize: 15, height: 1.5),
                ),
              ],
            ),
          ),

          // ----------------- Reviews -----------------
          ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: reviews.length,
            itemBuilder: (context, index) {
              final review = reviews[index];
              return ReviewTile(
                name: review["name"]!,
                image: review["image"]!,
                review: review["review"]!,
              );
            },
          ),
        ],
      ),
    );
  }
}

// ----------------- Trip Card Widget -----------------
class TripCard extends StatelessWidget {
  final String title,
      location,
      duration,
      groupSize,
      price,
      rating,
      image,
      availability,
      discount;

  const TripCard({
    super.key,
    required this.title,
    required this.location,
    required this.duration,
    required this.groupSize,
    required this.price,
    required this.rating,
    required this.image,
    required this.availability,
    required this.discount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 5)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
                child: Image.asset(
                  image,
                  height: 160,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    availability,
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Positioned(
                top: 10,
                left: 140,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    discount,
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
              const Positioned(
                bottom: 8,
                right: 8,
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/logo.png'),
                  backgroundColor: Colors.black,
                  radius: 20,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(location,
                    style: const TextStyle(fontSize: 12, color: Colors.grey)),
                const SizedBox(height: 4),
                Text(title,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.schedule, size: 16, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(duration, style: const TextStyle(fontSize: 13)),
                    const SizedBox(width: 16),
                    const Icon(Icons.group, size: 16, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(groupSize, style: const TextStyle(fontSize: 13)),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(price,
                        style: const TextStyle(
                            color: Colors.green,
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(width: 4),
                    const Text("/ Person",
                        style: TextStyle(color: Colors.grey)),
                    const Spacer(),
                    const Icon(Icons.star, size: 16, color: Colors.amber),
                    const SizedBox(width: 4),
                    Text(rating,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ----------------- Review Widget -----------------
class ReviewTile extends StatelessWidget {
  final String name;
  final String image;
  final String review;

  const ReviewTile({
    super.key,
    required this.name,
    required this.image,
    required this.review,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(radius: 30, backgroundImage: AssetImage(image)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
                const Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 16),
                    Icon(Icons.star, color: Colors.amber, size: 16),
                    Icon(Icons.star, color: Colors.amber, size: 16),
                    Icon(Icons.star, color: Colors.amber, size: 16),
                    Icon(Icons.star_half, color: Colors.amber, size: 16),
                  ],
                ),
                const SizedBox(height: 4),
                Text(review, style: const TextStyle(fontSize: 14, height: 1.5)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
