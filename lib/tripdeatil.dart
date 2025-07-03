import 'package:flutter/material.dart';
import 'package:frist_app/agencyProfile.dart';
import 'package:frist_app/chousedate.dart';
import 'package:frist_app/ready to go.dart';
import '';

void main() {
  runApp(const MyAp());
}

class MyAp extends StatelessWidget {
  const MyAp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'PtSans'),
      home: const TripDetailFullPage(),
    );
  }
}

class TripDetailFullPage extends StatefulWidget {
  const TripDetailFullPage({super.key});

  @override
  State<TripDetailFullPage> createState() => _TripDetailFullPageState();
}

class _TripDetailFullPageState extends State<TripDetailFullPage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _overviewKey = GlobalKey();
  final GlobalKey _galleryKey = GlobalKey();
  final GlobalKey _gearKey = GlobalKey();
  final GlobalKey _itineraryKey = GlobalKey();

  final List<String> galleryImages = [
    'images/cheary.jpg',
    'images/montin.jpg',
    'images/naran.jpg',
    'images/cheary.jpg',
    'images/road.jpg',
    'images/cheary.jpg',
  ];

  void _scrollTo(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  void _showShareBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Share with friends and family',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Icon(Icons.arrow_back, color: Colors.white),
                ],
              ),
              SizedBox(height: 20),
              _ShareOption(title: 'Facebook', icon: Icons.facebook),
              _ShareOption(title: 'Snapchat', icon: Icons.snapchat),
              _ShareOption(title: 'Copy Link', icon: Icons.link),
              _ShareOption(title: 'More Option', icon: Icons.more_horiz),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCheckItem(bool isIncluded, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            isIncluded ? Icons.check : Icons.close,
            color: isIncluded ? Colors.green : Colors.red,
            size: 20,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String label, VoidCallback onTap) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          alignment: Alignment.center,
          child:
              Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            expandedHeight: 450,
            pinned: true,
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => togo()),
                );
              },
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.share, color: Colors.black),
                onPressed: () => _showShareBottomSheet(context),
              ),
            ],
            flexibleSpace: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                final double appBarHeight = constraints.biggest.height;

                // Show title only when AppBar is collapsed
                final bool isCollapsed = appBarHeight < kToolbarHeight + 50;

                return FlexibleSpaceBar(
                  title: isCollapsed
                      ? const Text(
                          'Cherry Blossom Trip to Hunza Valley',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        )
                      : null,
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                        'images/cheary.jpg',
                        fit: BoxFit.cover,
                      ),
                      const Positioned(
                        bottom: 20,
                        left: 10,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Cherry Blossom\nTrip to Hunza Valley',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              'From - Lahore',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            SizedBox(height: 6),
                            Row(
                              children: [
                                Icon(Icons.star,
                                    color: Colors.yellow, size: 18),
                                SizedBox(width: 4),
                                Text('4.7 ',
                                    style: TextStyle(color: Colors.white)),
                                Text('472 Reviews',
                                    style: TextStyle(
                                        color: Colors.white70, fontSize: 13)),
                              ],
                            ),
                            SizedBox(height: 6),
                            Row(
                              children: [
                                Icon(Icons.access_time,
                                    color: Colors.white, size: 16),
                                SizedBox(width: 4),
                                Text('10 Days',
                                    style: TextStyle(color: Colors.white)),
                                SizedBox(width: 16),
                                Icon(Icons.group,
                                    color: Colors.white, size: 16),
                                SizedBox(width: 4),
                                Text('15 People',
                                    style: TextStyle(color: Colors.white)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  collapseMode: CollapseMode.parallax,
                );
              },
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Material(
                  elevation: 1,
                  child: Row(
                    children: [
                      _buildTab("Overview", () => _scrollTo(_overviewKey)),
                      _buildTab("Gallery", () => _scrollTo(_galleryKey)),
                      _buildTab("Gear", () => _scrollTo(_gearKey)),
                      _buildTab("Itinerary", () => _scrollTo(_itineraryKey)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SectionTitle("Overview", sectionKey: _overviewKey),
                      const SizedBox(height: 10),
                      const Text(
                        "Hunza Valley is the prime attraction for tourists "
                        "as it offers spectacular sceneries of mountains. Tourists can"
                        " witness high peaks of 7000m such as Lady Finger and Ultar. Hunza has"
                        " been bestowed with natural beauty rich cultural and traditional heritage "
                        "such as traditional dresses, tunes, dances and cuisines.",
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      const SizedBox(height: 20),
                      SectionTitle("Gallery", sectionKey: _galleryKey),
                      const SizedBox(height: 10),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: galleryImages.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                        ),
                        itemBuilder: (context, index) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              galleryImages[index],
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                      SectionTitle("Gear", sectionKey: _gearKey),
                      const SizedBox(height: 10),
                      const Text(
                          style: TextStyle(color: Colors.grey),
                          "• Trekking boots / Joggers / Comfortable Shoes / Slippers"),
                      const Text(
                          style: TextStyle(color: Colors.grey), "• Back Pack"),
                      const Text(
                          style: TextStyle(color: Colors.grey),
                          "• Water bottle"),
                      const Text(
                          style: TextStyle(color: Colors.grey),
                          "• T-shirts for day trekking"),
                      const Text(
                          style: TextStyle(color: Colors.grey),
                          "• Hand wash / soap / sanitizer / wipes / toothpaste"),
                      const Text(
                          style: TextStyle(color: Colors.grey),
                          "• Sun Block and Sun glasses"),
                      const Text(
                          style: TextStyle(color: Colors.grey),
                          "• Waterproof lower and Jacket"),
                      const Text(
                          style: TextStyle(color: Colors.grey),
                          "• Thermals (both upper and lower)"),
                      const Text(
                          style: TextStyle(color: Colors.grey),
                          "• Woolen Socks (4-6 pairs)"),
                      const Text(
                          style: TextStyle(color: Colors.grey),
                          "• Gloves (highly recommended)"),
                      const Text(
                          style: TextStyle(color: Colors.grey),
                          "• Beanie & Muffler (highly recommended)"),
                      const SizedBox(height: 20),
                      SectionTitle("Itinerary", sectionKey: _itineraryKey),
                      const SizedBox(height: 10),
                      buildItineraryDay("Day 1", [
                        "Drive to Chilas/Naran",
                        "Arrival at Chilas/Naran",
                        "Night stay at Chilas/Naran"
                      ]),
                      buildItineraryDay("Day 2", [
                        "Drive to Hunza",
                        "Visit Rakaposhi View Point",
                        "Night stay in Hunza"
                      ]),
                      buildItineraryDay("Day 3", [
                        "Explore Altit and Baltit Forts",
                        "Visit Karimabad",
                        "Night stay in Hunza"
                      ]),
                      buildItineraryDay("Day 4", [
                        "Drive to Attabad Lake",
                        "Visit Hussaini Bridge",
                        "Night stay in Passu"
                      ]),
                      buildItineraryDay("Day 5", [
                        "Drive to Khunjerab Pass",
                        "Visit Pak-China Border",
                        "Return and Night stay in Passu"
                      ]),
                      buildItineraryDay("Day 6", [
                        "Drive back to Hunza",
                        "Shopping & Free time",
                        "Night stay in Hunza"
                      ]),
                      buildItineraryDay("Day 7", [
                        "Drive to Naltar Valley (optional)",
                        "Sightseeing in Naltar",
                        "Night stay in Hunza"
                      ]),
                      buildItineraryDay("Day 8",
                          ["Drive back to Chilas", "Night stay at Chilas"]),
                      buildItineraryDay("Day 9", [
                        "Drive to Naran/Islamabad",
                        "Stopovers for sightseeing"
                      ]),
                      buildItineraryDay("Day 10",
                          ["Arrival back to home city", "End of Trip"]),
                      const SizedBox(height: 20),
                      SectionTitle("What's Included & Excluded"),
                      const SizedBox(height: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildCheckItem(
                              true, "Accommodation (3-4 persons sharing)"),
                          _buildCheckItem(true, "Transport"),
                          _buildCheckItem(true, "Standard Meals"),
                          _buildCheckItem(true, "Guide"),
                          _buildCheckItem(true, "Basic first aid ki"),
                          _buildCheckItem(true, "Hunza & Nagar Khunjerab Pass"),
                          _buildCheckItem(true, "Attabad Lake"),
                          _buildCheckItem(false, "Passu Cones & Glacier"),
                          _buildCheckItem(false, "Karimabad"),
                          _buildCheckItem(false, "Rakaposhi View Point"),
                          _buildCheckItem(false, "Altit Fort"),
                          _buildCheckItem(false, "Baltit FortEagle's Nest"),
                          _buildCheckItem(false, "Hussaini Suspension Bridge"),
                          _buildCheckItem(false, "Nanga Parbat View Pointt"),
                          SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          ClipOval(
                            child: Image.asset(
                              'images/dast.jpg',
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Adventure Point Travel\n Agency",
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 5),
                              const Row(
                                children: [
                                  Icon(Icons.star,
                                      color: Colors.green, size: 20),
                                  SizedBox(width: 5),
                                  Text("4.8"),
                                  SizedBox(width: 10),
                                  Chip(
                                    label: Text("Not Verified"),
                                    backgroundColor: Colors.greenAccent,
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const agencyprofile()),
                                  );
                                },
                                child: const Text(
                                  "Agency Profile",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const SectionTitle("Rating and Reviews"),
                      const SizedBox(height: 10),
                      const ReviewCard(
                        name: "Ayaz",
                        date: "08 Nov 2020",
                        rating: 4,
                        review:
                            "They arranged my trip to Hunza with family. Extremely cooperative staff, kept me in the loop and bought me cheapest tickets which were even cheaper than online tickets. Arranged hotel, transport and activities too. Everything was great.",
                      ),
                      const ReviewCard(
                        name: "Anees",
                        date: "08 Nov 2020",
                        rating: 4,
                        review:
                            "They arranged my trip to Hunza with family. Extremely cooperative staff, kept me in the loop and bought me cheapest tickets which were even cheaper than online tickets. Arranged hotel, transport and activities too. Everything was great.",
                      ),
                      const ReviewCard(
                        name: "subhan.",
                        date: "08 Nov 2020",
                        rating: 4,
                        review:
                            "They arranged my trip to Hunza with family. Extremely cooperative staff, kept me in the loop and bought me cheapest tickets which were even cheaper than online tickets. Arranged hotel, transport and activities too. Everything was great.",
                      ),
                      const ReviewCard(
                        name: "mohsin",
                        date: "08 Nov 2020",
                        rating: 4,
                        review:
                            "They arranged my trip to Hunza with family. Extremely cooperative staff, kept me in the loop and bought me cheapest tickets which were even cheaper than online tickets. Arranged hotel, transport and activities too. Everything was great.",
                      ),
                      const SizedBox(height: 80),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.grey.shade300)),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Rs. 7000 / Person",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Date()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child:
                  const Text("BOOK NOW", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  final Key? sectionKey;
  const SectionTitle(this.title, {this.sectionKey, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: sectionKey,
      child: Text(title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    );
  }
}

Widget buildItineraryDay(String day, List<String> activities) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 6),
    decoration: BoxDecoration(
      color: const Color(0xFFE6F4EA),
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 1,
          blurRadius: 4,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: Theme(
      data: ThemeData().copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        title: Text(
          day,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
        children: activities
            .map(
              (activity) => Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
                child: Row(
                  children: [
                    const Icon(Icons.circle, size: 8, color: Colors.black54),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        activity,
                        style: const TextStyle(
                            fontSize: 14, color: Colors.black87),
                      ),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    ),
  );
}

class _ShareOption extends StatelessWidget {
  final String title;
  final IconData icon;
  const _ShareOption({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () => Navigator.pop(context),
    );
  }
}

class ReviewCard extends StatelessWidget {
  final String name;
  final String date;
  final int rating;
  final String review;

  const ReviewCard({
    super.key,
    required this.name,
    required this.date,
    required this.rating,
    required this.review,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16)),
                Text(date, style: const TextStyle(color: Colors.grey)),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: List.generate(
                5,
                (index) => Icon(
                  index < rating ? Icons.star : Icons.star_border,
                  color: Colors.amber,
                  size: 20,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(review, style: const TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
