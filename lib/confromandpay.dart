import 'package:flutter/material.dart';

void main() {
  runApp(const confrom());
}

class confrom extends StatelessWidget {
  const confrom({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'PtSans'),
      home: const ConfirmationScreen(),
    );
  }
}

class ConfirmationScreen extends StatelessWidget {
  const ConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirm and Pay'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(19.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Trip Image and Title
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('images/cheary.jpg',
                      width: 100, height: 100, fit: BoxFit.cover),
                  const SizedBox(width: 9),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'From-Lahore',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Cherry Blossom Trip\n to Hunza Valley',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        StarRatingWithText(rating: 4.5),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              const Text('Your Trip',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              ListTile(
                title: const Text('Guests'),
                subtitle: const Text('2 Adults, 2 Children, 1 Infant'),
                trailing: greenEditButton(),
              ),
              ListTile(
                title: const Text('Date'),
                subtitle: const Text('Jan 02, 22 - Jan 12, 22'),
                trailing: greenEditButton(),
              ),
              const SizedBox(height: 20),

              const Text('Addons',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              ListTile(
                title: const Text('Separate room'),
                subtitle: const Text('Twin sharing'),
                trailing: greenEditButton(),
              ),
              ListTile(
                title: const Text('Additional services'),
                subtitle: const Text('Airport pickup, Guide included'),
                trailing: greenEditButton(),
              ),
              const SizedBox(height: 20),

              const Text('Price Details',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              const PriceDetailRow(
                  label: 'Adult', price: 'PKR 7000 X 2', total: 'PKR 14000'),
              const PriceDetailRow(
                  label: 'Children', price: 'PKR 3500 X 2', total: 'PKR 7000'),
              const PriceDetailRow(
                  label: 'Infants', price: 'PKR 3500 X 1', total: 'PKR 3500'),
              const PriceDetailRow(
                  label: 'Addons', price: 'No Addon', total: 'PKR 0'),
              const SizedBox(height: 20),

              // Payment Options
              const PaymentOptionsSection(),
            ],
          ),
        ),
      ),
    );
  }
}

// Green "Edit" button
Widget greenEditButton() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    decoration: BoxDecoration(
      color: const Color(0xFFE6F4EA),
      borderRadius: BorderRadius.circular(8),
    ),
    child: const Text(
      'Edit',
      style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
    ),
  );
}

class StarRatingWithText extends StatelessWidget {
  final double rating;

  const StarRatingWithText({required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.star, color: Colors.yellow),
        const SizedBox(width: 5),
        Text(
          '$rating ',
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}

class PriceDetailRow extends StatelessWidget {
  final String label;
  final String price;
  final String total;

  const PriceDetailRow({
    required this.label,
    required this.price,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(label),
      subtitle: Text(price),
      trailing:
          Text(total, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}

class PaymentOptionsSection extends StatefulWidget {
  const PaymentOptionsSection({super.key});

  @override
  State<PaymentOptionsSection> createState() => _PaymentOptionsSectionState();
}

class _PaymentOptionsSectionState extends State<PaymentOptionsSection> {
  int _selectedMethod = 0;
  bool _termsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(height: 40),
        const Text("Discount Coupon",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.green,
            backgroundColor: const Color(0xFFE6F4EA),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text("Enter a coupon"),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text("Sub Total", style: TextStyle(fontSize: 16)),
            Text("PKR 24,500", style: TextStyle(fontSize: 16)),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text("Discount", style: TextStyle(fontSize: 16)),
            Text("PKR 0", style: TextStyle(fontSize: 16)),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text("Total (PKR)",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text("PKR 24,500",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green)),
          ],
        ),
        const SizedBox(height: 30),
        const Text("Booking Method",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),

        // Booking Method Options with icons on right
        RadioListTile(
          value: 0,
          groupValue: _selectedMethod,
          onChanged: (val) => setState(() => _selectedMethod = val!),
          controlAffinity: ListTileControlAffinity.trailing,
          activeColor: Colors.green,
          title: const Text("Booking without payment",
              style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: const Text(
              "Your Booking will be confirm and held for 6 hours to complete payment.",
              style: TextStyle(color: Colors.grey)),
        ),
        RadioListTile(
          value: 1,
          groupValue: _selectedMethod,
          onChanged: (val) => setState(() => _selectedMethod = val!),
          controlAffinity: ListTileControlAffinity.trailing,
          activeColor: Colors.green,
          title: const Text("Partially payment",
              style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: const Text(
              "Pay (30%) PKR 6,982 now & remaining (70%) PKR 16,293 payment will be on departure time.",
              style: TextStyle(color: Colors.grey)),
        ),
        RadioListTile(
          value: 2,
          groupValue: _selectedMethod,
          onChanged: (val) => setState(() => _selectedMethod = val!),
          controlAffinity: ListTileControlAffinity.trailing,
          activeColor: Colors.green,
          title: const Text("Full Payment",
              style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        const Divider(height: 40),

        // Terms & Conditions
        CheckboxListTile(
          value: _termsAccepted,
          onChanged: (val) => setState(() => _termsAccepted = val!),
          controlAffinity: ListTileControlAffinity.leading,
          title: Text.rich(
            TextSpan(
              children: [
                const TextSpan(
                  text: "I have read and accept the ",
                  style: TextStyle(fontSize: 13),
                ),
                TextSpan(
                  text: "terms and conditions",
                  style: TextStyle(color: Colors.green, fontSize: 13),
                ),
                const TextSpan(
                  text: " and ",
                  style: TextStyle(fontSize: 13),
                ),
                TextSpan(
                  text: "privacy policy",
                  style: TextStyle(color: Colors.green, fontSize: 13),
                ),
              ],
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: _termsAccepted
                ? () {
                    // Confirm logic here
                  }
                : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child: const Text("Confirm",
                style: TextStyle(fontSize: 18, color: Colors.white)),
          ),
        )
      ],
    );
  }
}
