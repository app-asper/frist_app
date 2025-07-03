import 'package:flutter/material.dart';
import 'package:frist_app/chousedate.dart';
import 'package:frist_app/confromandpay.dart';

void main() {
  runApp(const choice1());
}

class choice1 extends StatelessWidget {
  const choice1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'PtSans', // Custom font
      ),
      home: const GuestSelectorPage(),
    );
  }
}

class GuestSelectorPage extends StatefulWidget {
  const GuestSelectorPage({super.key});
  @override
  State<GuestSelectorPage> createState() => _GuestSelectorPageState();
}

class _GuestSelectorPageState extends State<GuestSelectorPage> {
  int adults = 2;
  int children = 2;
  int infants = 1;
  int oldman = 1;

  int calculateTotal() {
    return (adults * 7000) +
        (children * 3000) +
        (infants * 950) +
        (oldman * 1500);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back + title
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Date()));
                },
                child: Row(
                  children: const [
                    Icon(Icons.arrow_back),
                    SizedBox(width: 8),
                    Text(
                      "Choose Guests",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // Adults
              buildCounterRow("Adults", "Ages 13 or above", adults, (val) {
                setState(() => adults = val);
              }),

              const SizedBox(height: 20),

              // Children
              buildCounterRow("Children", "Ages 02 - 12", children, (val) {
                setState(() => children = val);
              }),

              const SizedBox(height: 20),

              // Infants
              buildCounterRow("Infants", "Under 2", infants, (val) {
                setState(() => infants = val);
              }),

              const SizedBox(height: 20),

              buildCounterRow("Oldman", "Above Age 60", oldman, (val) {
                setState(() => oldman = val);
              }),

              const Spacer(),

              Text(
                "$adults Adult, $children Children, $infants Infant, $oldman Oldman",
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 8),

              // Total & Next
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Total",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400)),
                      const SizedBox(height: 4),
                      Text("Rs. ${calculateTotal()}",
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600)),
                    ],
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.shade700,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 14),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => confrom()));
                    },
                    child: const Text("NEXT",
                        style: TextStyle(color: Colors.white)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCounterRow(
      String title, String subtitle, int value, Function(int) onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Labels
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            const SizedBox(height: 4),
            Text(subtitle,
                style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey)),
          ],
        ),

        // Counter
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.remove_circle_outline),
              onPressed: () {
                if (value > 0) onChanged(value - 1);
              },
            ),
            Text(value.toString(),
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            IconButton(
              icon: const Icon(Icons.add_circle_outline),
              onPressed: () {
                onChanged(value + 1);
              },
            ),
          ],
        )
      ],
    );
  }
}
