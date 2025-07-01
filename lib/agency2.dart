import 'package:flutter/material.dart';
import 'package:frist_app/agencyProfile.dart';

void main() => runApp(MaterialApp(home: agency2()));

class agency2 extends StatefulWidget {
  @override
  _TravelPageState createState() => _TravelPageState();
}

class _TravelPageState extends State<agency2> with TickerProviderStateMixin {
  late TabController _tabController;
  final ScrollController _scrollController = ScrollController();

  final GlobalKey _packageKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _reviewKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      Future.delayed(Duration(milliseconds: 200), () {
        Scrollable.ensureVisible(
          _tabController.index == 0
              ? _packageKey.currentContext!
              : _tabController.index == 1
                  ? _aboutKey.currentContext!
                  : _reviewKey.currentContext!,
          duration: Duration(milliseconds: 500),
        );
      });
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Adventure Point Travel Agency",
            style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => agencyprofile()));
          },
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.green,
          labelColor: Colors.green,
          unselectedLabelColor: Colors.black,
          tabs: const [
            Tab(text: 'Packages'),
            Tab(text: 'About'),
            Tab(text: 'Reviews'),
          ],
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Packages
            Container(key: _packageKey),
            TripCard(
              title: "Cherry Blossom Trip to Hunza Valley",
              location: "From - Lahore",
              duration: "9 days",
              groupSize: "20 people",
              price: "PKR 7000",
              rating: "4.5",
              image: "images/dast.jpg",
              availability: "3 Booking Left",
              discount: "13% OFF",
            ),
            TripCard(
              title: "Explore Skardu Mountains",
              location: "From - Lahore",
              duration: "7 days",
              groupSize: "15 people",
              price: "PKR 8500",
              rating: "4.7",
              image: "images/cheary.jpg",
              availability: "5 Booking Left",
              discount: "10% OFF",
            ),
            TripCard(
              title: "Khunjerab Pass Tour",
              location: "From - Lahore",
              duration: "10 days",
              groupSize: "25 people",
              price: "PKR 9500",
              rating: "4.6",
              image: "images/montin.jpg",
              availability: "2 Booking Left",
              discount: "15% OFF",
            ),

            // About
            SizedBox(height: 24),
            Container(key: _aboutKey),
            Text("About",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(
              "Adventure Point Travel Agency offers a wide variety of tour packages with trusted services across Pakistan. Whether it's cherry blossoms or majestic mountains, we've got it all covered!",
              style: TextStyle(fontSize: 15, height: 1.5),
            ),

            // Reviews
            SizedBox(height: 24),
            Container(key: _reviewKey),
            Text("Reviews",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            ReviewTile(
              name: "Anees Ahmad",
              image: "images/anees.jpg",
              review: "AI Overview good trip review should be informative, "
                  "honest, and insightful, providing details that help other"
                  " travelers. It should include specific positive and negative"
                  " aspects, offering a balanced perspective. A good review also"
                  " offers constructive feedback, highlighting what the company "
                  "did well and where they could improve.",
            ),
            SizedBox(height: 20),
            ReviewTile(
              name: "Mohsin",
              image: "images/mohsin.jpg",
              review: "AI Overview good trip review should be informative, "
                  "honest, and insightful, providing details that help other"
                  " travelers. It should include specific positive and negative"
                  " aspects, offering a balanced perspective. A good review also"
                  " offers constructive feedback, highlighting what the company "
                  "did well and where they could improve.",
            ),
            SizedBox(height: 20),
            ReviewTile(
              name: "jhon",
              image: "images/trc.jpg",
              review: "AI Overview good trip review should be informative, "
                  "honest, and insightful, providing details that help other"
                  " travelers. It should include specific positive and negative"
                  " aspects, offering a balanced perspective. A good review also"
                  " offers constructive feedback, highlighting what the company "
                  "did well and where they could improve.",
            ),
            SizedBox(height: 20),
            ReviewTile(
              name: "Ahmad",
              image: "images/karchi.jpg",
              review: "AI Overview good trip review should be informative, "
                  "honest, and insightful, providing details that help other"
                  " travelers. It should include specific positive and negative"
                  " aspects, offering a balanced perspective. A good review also"
                  " offers constructive feedback, highlighting what the company "
                  "did well and where they could improve.",
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------------- Trip Card Widget ----------------------
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
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 6)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                child: Image.asset(image,
                    height: 160, width: double.infinity, fit: BoxFit.cover),
              ),
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(availability,
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                ),
              ),
              Positioned(
                top: 10,
                left: 140,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(discount,
                      style: TextStyle(color: Colors.white, fontSize: 12)),
                ),
              ),
              Positioned(
                bottom: 8,
                right: 8,
                child: CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 20,
                  backgroundImage: AssetImage('images/logo.png'),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(location,
                    style: TextStyle(fontSize: 12, color: Colors.grey)),
                SizedBox(height: 4),
                Text(title,
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.schedule, size: 16, color: Colors.grey),
                    SizedBox(width: 4),
                    Text(duration, style: TextStyle(fontSize: 13)),
                    SizedBox(width: 16),
                    Icon(Icons.group, size: 16, color: Colors.grey),
                    SizedBox(width: 4),
                    Text(groupSize, style: TextStyle(fontSize: 13)),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Text(price,
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                    SizedBox(width: 4),
                    Text("/ Person", style: TextStyle(color: Colors.grey)),
                    Spacer(),
                    Icon(Icons.star, size: 16, color: Colors.amber),
                    SizedBox(width: 4),
                    Text(rating, style: TextStyle(fontWeight: FontWeight.bold)),
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

// ---------------------- Review Widget ----------------------
class ReviewTile extends StatelessWidget {
  final String name;
  final String image;
  final String review;

  const ReviewTile({
    required this.name,
    required this.image,
    required this.review,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(radius: 30, backgroundImage: AssetImage(image)),
        SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Row(
                children: List.generate(
                  5,
                  (index) => Icon(Icons.star, size: 16, color: Colors.amber),
                ),
              ),
              SizedBox(height: 4),
              Text(review, style: TextStyle(fontSize: 14, height: 1.4)),
            ],
          ),
        ),
      ],
    );
  }
}
