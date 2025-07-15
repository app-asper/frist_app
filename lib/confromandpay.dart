import 'package:flutter/material.dart';
import 'package:frist_app/choicegust.dart';
import 'package:frist_app/copen.dart';

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

class ConfirmationScreen extends StatefulWidget {
  const ConfirmationScreen({super.key});

  @override
  State<ConfirmationScreen> createState() => _ConfirmationScreenState();
}

class _ConfirmationScreenState extends State<ConfirmationScreen> {
  String _guests = '2 Adults, 2 Children, 1 Infant';
  String _date = 'Jan 02, 22 - Jan 12, 22';
  String _room = 'Twin sharing';
  String _services = 'Airport pickup, Guide included';

  Future<void> _showBottomSheet(BuildContext context, String title) async {
    final result = await showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        if (title == "Guests") {
          int tempAdults = 2;
          int tempChildren = 2;
          int tempInfants = 1;

          return StatefulBuilder(
            builder: (context, setState) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back),
                          onPressed: () => Navigator.pop(context),
                        ),
                        const SizedBox(width: 4),
                        const Text(
                          'Choose Guests',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

// 🔹 Adults
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Adults",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(height: 4),
                            Text("Ages 13+",
                                style: TextStyle(
                                    fontSize: 13, color: Colors.grey)),
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove_circle_outline),
                              onPressed: () {
                                if (tempAdults > 0) {
                                  setState(() => tempAdults--);
                                }
                              },
                            ),
                            Text(
                              "$tempAdults",
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            IconButton(
                              icon: const Icon(Icons.add_circle_outline),
                              onPressed: () => setState(() => tempAdults++),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 25),

// 🔹 Children
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Children",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(height: 4),
                            Text("Ages 2–12",
                                style: TextStyle(
                                    fontSize: 13, color: Colors.grey)),
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove_circle_outline),
                              onPressed: () {
                                if (tempChildren > 0) {
                                  setState(() => tempChildren--);
                                }
                              },
                            ),
                            Text(
                              "$tempChildren",
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            IconButton(
                              icon: const Icon(Icons.add_circle_outline),
                              onPressed: () => setState(() => tempChildren++),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 25),

// 🔹 Infants
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Infants",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(height: 4),
                            Text("Under 2",
                                style: TextStyle(
                                    fontSize: 13, color: Colors.grey)),
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove_circle_outline),
                              onPressed: () {
                                if (tempInfants > 0) {
                                  setState(() => tempInfants--);
                                }
                              },
                            ),
                            Text(
                              "$tempInfants",
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            IconButton(
                              icon: const Icon(Icons.add_circle_outline),
                              onPressed: () => setState(() => tempInfants++),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 30),

// ✅ Confirm Button
                    Center(
                      child: SizedBox(
                        width: 200,
                        child: OutlinedButton(
                          onPressed: () {
                            final result =
                                "$tempAdults Adult${tempAdults > 1 ? 's' : ''}, "
                                "$tempChildren Children, $tempInfants Infant";
                            Navigator.pop(context, result);
                          },
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Colors.green),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                          child: const Text(
                            "Confirm",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.green,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              );
            },
          );
        }

// Other bottom sheets
        List<Widget> items = [];

        if (title == "Date") {
          items = List.generate(5, (index) {
            String dateRange =
                "Jan 0${index * 2 + 2}, 22 - Jan ${index * 2 + 12}, 22";
            return ListTile(
              title: Text(dateRange),
              trailing: const Icon(Icons.radio_button_off),
              onTap: () => Navigator.pop(context, dateRange),
            );
          });
        } else if (title == "Room") {
          int separateRoom = 1;
          int separateSingleRoom = 1;

          return StatefulBuilder(
            builder: (context, setState) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back),
                          onPressed: () => Navigator.pop(context),
                        ),
                        const SizedBox(width: 4),
                        const Text(
                          'Choose Separate Rooms',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

// 🔹 Separate Room
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Separate Room',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove_circle_outline),
                              onPressed: () {
                                if (separateRoom > 0) {
                                  setState(() => separateRoom--);
                                }
                              },
                            ),
                            Text(
                              "$separateRoom",
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            IconButton(
                              icon: const Icon(Icons.add_circle_outline),
                              onPressed: () => setState(() => separateRoom++),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 25),

// 🔹 Separate Room (Single)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Separate Room (Single)',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove_circle_outline),
                              onPressed: () {
                                if (separateSingleRoom > 0) {
                                  setState(() => separateSingleRoom--);
                                }
                              },
                            ),
                            Text(
                              "$separateSingleRoom",
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            IconButton(
                              icon: const Icon(Icons.add_circle_outline),
                              onPressed: () =>
                                  setState(() => separateSingleRoom++),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 30),

                    Center(
                      child: SizedBox(
                        width: 200,
                        child: OutlinedButton(
                          onPressed: () {
                            final result =
                                "Separate: $separateRoom, Single: $separateSingleRoom";
                            Navigator.pop(context, result);
                          },
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Colors.green),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                          child: const Text(
                            "Confirm",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.green,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              );
            },
          );
        } else if (title == "Services") {
          items = ["Airport Pickup", "Guide Included", "Meals Included"]
              .map((text) => ListTile(
                    title: Text(text),
                    trailing: const Icon(Icons.radio_button_off),
                    onTap: () => Navigator.pop(context, text),
                  ))
              .toList();
        }

        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Text(
                    'Choose $title',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              ...items,
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.green,
                  backgroundColor: const Color(0xFFE6F4EA),
                ),
                child: const Text("Confirm"),
              )
            ],
          ),
        );
      },
    );

    if (result != null) {
      setState(() {
        if (title == "Guests") _guests = result;
        if (title == "Date") _date = result;
        if (title == "Room") _room = result;
        if (title == "Services") _services = result;
      });
    }
  }

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
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => choice1()));
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(19.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                subtitle: Text(_guests),
                trailing: GestureDetector(
                    onTap: () => _showBottomSheet(context, "Guests"),
                    child: greenEditButton()),
              ),
              ListTile(
                title: const Text('Date'),
                subtitle: Text(_date),
                trailing: GestureDetector(
                    onTap: () => _showBottomSheet(context, "Date"),
                    child: greenEditButton()),
              ),
              const SizedBox(height: 20),
              const Text('Addons',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              ListTile(
                title: const Text('Separate room'),
                subtitle: Text(_room),
                trailing: GestureDetector(
                    onTap: () => _showBottomSheet(context, "Room"),
                    child: greenEditButton()),
              ),
              ListTile(
                title: const Text('Additional services'),
                subtitle: Text(_services),
                trailing: GestureDetector(
                    onTap: () => _showBottomSheet(context, "Services"),
                    child: greenEditButton()),
              ),
              const SizedBox(height: 20),
              const Text(
                'Price Details',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              PriceDetailRow(
                label: 'Adult',
                price: 'PKR 7000 X 2',
                total: 'PKR 14000',
              ),
              PriceDetailRow(
                label: 'Children',
                price: 'PKR 3500 X 2',
                total: 'PKR 7000',
              ),
              PriceDetailRow(
                label: 'Infants',
                price: 'PKR 3500 X 1',
                total: 'PKR 3500',
              ),
              PriceDetailRow(
                label: 'Addons',
                price: 'No Addon',
                total: 'PKR 0',
              ),
              const SizedBox(height: 20),
              const PaymentOptionsSection(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildGuestRow(String label, int value, Function(int) onChanged) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          const SizedBox(height: 4),
          Text(
            label == "Adults"
                ? "Ages 13+"
                : label == "Children"
                    ? "Ages 2–12"
                    : "Under 2",
            style: const TextStyle(fontSize: 13, color: Colors.grey),
          )
        ],
      ),
      Row(
        children: [
          IconButton(
            icon: const Icon(Icons.remove_circle_outline),
            onPressed: () {
              if (value > 0) onChanged(value - 1);
            },
          ),
          Text("$value",
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          IconButton(
            icon: const Icon(Icons.add_circle_outline),
            onPressed: () => onChanged(value + 1),
          ),
        ],
      )
    ],
  );
}

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
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => copen()),
            );
          },
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
          title: const Text("Full Payment",
              style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        if (_selectedMethod == 1) ...[
          const Text("Payment Method",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),

          // 🔹 Jazzcash Card
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: const [
                  Icon(Icons.account_balance_wallet, color: Colors.green),
                  SizedBox(width: 15),
                  Text("Jazzcash",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.green)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),

          // 🔹 Bank Transfer Card
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: const [
                  Icon(Icons.account_balance, color: Colors.black54),
                  SizedBox(width: 15),
                  Text("Bank Transfer",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w500)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),

          // 🔹 Debit / Credit Card
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: const [
                  Icon(Icons.credit_card, color: Colors.black54),
                  SizedBox(width: 15),
                  Text("Debit / Credit",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w500)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30),
        ],
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
        Center(
          child: SizedBox(
            width: 220,
            child: ElevatedButton(
              onPressed: _termsAccepted
                  ? () {
                      if (_selectedMethod == 0) {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: const EdgeInsets.all(25),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(Icons.check_circle,
                                        size: 70, color: Colors.green),
                                    const SizedBox(height: 20),
                                    const Text(
                                      "Booking Confirmed!",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 10),
                                    const Text(
                                      "You have successfully reserved your trip.\nPlease complete the payment within 6 hours.",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    const SizedBox(height: 25),
                                    SizedBox(
                                      width: double.infinity,
                                      child: OutlinedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        style: OutlinedButton.styleFrom(
                                          side: const BorderSide(
                                              color: Colors.green),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 14),
                                        ),
                                        child: const Text("Back To Home",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.green)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      } else if (_selectedMethod == 1) {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(25),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(Icons.check_circle,
                                        size: 70, color: Colors.green),
                                    const SizedBox(height: 20),
                                    const Text(
                                      "your order was\nsubmitted successfully!",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 10),
                                    const Text(
                                      "As Soon as Complete your Payment.",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    const SizedBox(height: 20),
                                    const Divider(),
                                    const SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Text("Payment Type"),
                                        Text("Jazzcash",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Text("Account Title"),
                                        Text("Tripee",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Text("Account Number"),
                                        Text("+92 300 123 456 7",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                    const SizedBox(height: 25),
                                    SizedBox(
                                      width: double.infinity,
                                      child: OutlinedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        style: OutlinedButton.styleFrom(
                                          side: const BorderSide(
                                              color: Colors.green),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 14),
                                        ),
                                        child: const Text("Back To Home",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.green)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                padding: const EdgeInsets.symmetric(vertical: 18),
              ),
              child: const Text("Confirm",
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ),
        ),
      ],
    );
  }
}
