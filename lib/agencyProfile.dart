import 'package:flutter/material.dart';
import 'package:frist_app/tripdeatil.dart';

void main() {
  runApp(const agencyprofile());
}

class agencyprofile extends StatelessWidget {
  const agencyprofile({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'PtSans'),
      home: const ScrollTabAgencyPage(),
    );
  }
}

class ScrollTabAgencyPage extends StatefulWidget {
  const ScrollTabAgencyPage({super.key});

  @override
  State<ScrollTabAgencyPage> createState() => _ScrollTabAgencyPageState();
}

class _ScrollTabAgencyPageState extends State<ScrollTabAgencyPage> {
  final ScrollController _scrollController = ScrollController();
  bool _showAppBarTitle = false;

  final _packagesKey = GlobalKey();
  final _aboutKey = GlobalKey();
  final _reviewsKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.offset > 180 && !_showAppBarTitle) {
        setState(() => _showAppBarTitle = true);
      } else if (_scrollController.offset <= 180 && _showAppBarTitle) {
        setState(() => _showAppBarTitle = false);
      }
    });
  }

  void _scrollTo(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  Widget _buildTab(String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.green,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget _buildSection(GlobalKey key, String title, {Widget? child}) {
    return Container(
      key: key,
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style:
                  const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          if (child != null) child,
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (context, _) {
          return [
            SliverAppBar(
              pinned: true,
              expandedHeight: 300,
              backgroundColor: Colors.white,
              flexibleSpace: FlexibleSpaceBar(
                title: _showAppBarTitle
                    ? const Text("Adventure Point Travel Agency")
                    : null,
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      'images/boys.jpg',
                      fit: BoxFit.cover,
                    ),
                    Container(
                      color: Colors.black.withOpacity(0.3),
                    ),
                    Center(
                      child: Icon(Icons.play_circle_fill,
                          size: 64, color: Colors.white),
                    ),
                    Positioned(
                      top: 45,
                      left: 45,
                      child: const Text(
                        "Agency Profile",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => MyAp()),
                  );
                },
              ),
            ),
          ];
        },
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage('images/dast.jpg'),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Adventure Point\n Travel Agency',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.green, size: 18),
                          SizedBox(width: 4),
                          Text(
                            '4.8',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildTab("Packages", () => _scrollTo(_packagesKey)),
                  const SizedBox(width: 55), // 👈 manual spacing
                  _buildTab("About", () => _scrollTo(_aboutKey)),
                  const SizedBox(width: 55),
                  _buildTab("Reviews", () => _scrollTo(_reviewsKey)),
                ],
              ),
            ),
            const Divider(height: 1),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildSection(
                      _packagesKey,
                      "Packages",
                      child: Column(
                        children: const [
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
                        ],
                      ),
                    ),
                    _buildSection(
                      _aboutKey,
                      "About",
                      child: const Text(
                        "Hunza Valley is the prime attraction for tourists as it offers "
                        "spectacular sceneries of mountains. Tourists can witness high "
                        "peaks of 7000m such as Lady Finger and Ultar. Hunza has been bestowed "
                        "with natural beauty rich cultural and traditional heritage"
                        " such as traditional dresses, tunes, dances and cuisines."
                        "Hunza Valley is the prime attraction for tourists as it offers "
                        "spectacular sceneries of mountains. Tourists can witness high",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    _buildSection(
                      _reviewsKey,
                      "Reviews",
                      child: Column(
                        children: const [
                          Reviewcard(
                            name: "Anees Ahmad",
                            image: "images/anees.jpg",
                            review:
                                "Hunza Valley is the prime attraction for tourists as it offers "
                                "spectacular sceneries of mountains. Tourists can witness high "
                                "peaks of 7000m such as Lady Finger and Ultar. Hunza has been bestowed "
                                "with natural beauty rich cultural and traditional heritage"
                                " such as traditional dresses, tunes, dances and cuisines.",
                          ),
                          SizedBox(height: 20),
                          Reviewcard(
                            name: "Mohsin",
                            image: "images/mohsin.jpg",
                            review:
                                "Hunza Valley is the prime attraction for tourists as it offers "
                                "spectacular sceneries of mountains. Tourists can witness high "
                                "peaks of 7000m such as Lady Finger and Ultar. Hunza has been bestowed "
                                "with natural beauty rich cultural and traditional heritage"
                                " such as traditional dresses, tunes, dances and cuisines.",
                          ),
                          SizedBox(height: 20),
                          Reviewcard(
                            name: "nisha",
                            image: "images/trc.jpg",
                            review:
                                "Hunza Valley is the prime attraction for tourists as it offers "
                                "spectacular sceneries of mountains. Tourists can witness high "
                                "peaks of 7000m such as Lady Finger and Ultar. Hunza has been bestowed "
                                "with natural beauty rich cultural and traditional heritage"
                                " such as traditional dresses, tunes, dances and cuisines.",
                          ),
                          SizedBox(height: 20),
                          Reviewcard(
                            name: "Abdullah",
                            image: "images/karchi.jpg",
                            review:
                                "Hunza Valley is the prime attraction for tourists as it offers "
                                "spectacular sceneries of mountains. Tourists can witness high "
                                "peaks of 7000m such as Lady Finger and Ultar. Hunza has been bestowed "
                                "with natural beauty rich cultural and traditional heritage"
                                " such as traditional dresses, tunes, dances and cuisines.",
                          ),
                        ],
                      ),
                    )
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
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(16)),
                child: Image.asset(image,
                    height: 160, width: double.infinity, fit: BoxFit.cover),
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
                  child: Text(availability,
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.bold)),
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
                  child: Text(discount,
                      style:
                          const TextStyle(color: Colors.white, fontSize: 12)),
                ),
              ),
              const Positioned(
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

class Reviewcard extends StatelessWidget {
  final String name;
  final String image;
  final String review;

  const Reviewcard({
    super.key,
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
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold)),
              Row(
                children: List.generate(
                  5,
                  (index) =>
                      const Icon(Icons.star, size: 16, color: Colors.amber),
                ),
              ),
              const SizedBox(height: 4),
              Text(review, style: const TextStyle(fontSize: 14, height: 1.4)),
            ],
          ),
        ),
      ],
    );
  }
}
