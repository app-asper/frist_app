import 'package:flutter/material.dart';

class PlanTrip extends StatefulWidget {
  @override
  _PlanTripPageState createState() => _PlanTripPageState();
}

class _PlanTripPageState extends State<PlanTrip> {
  int adults = 1;
  int children = 0;
  int infants = 2;
  int rooms = 1;
  bool flexibleDates = false;
  bool mattressRequired = false;
  String? selectedTripType;
  String? selectedDestination;

  final List<String> tripTypes = ['Leisure', 'Business', 'Adventure'];
  final List<String> destinations = ['Naran', 'Swat', 'Hunza'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Plan Trip', style: TextStyle(color: Colors.black)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _sectionTitle('Personal Details'),
            _textField('Full Name'),
            _textField('Contact Number'),
            SizedBox(height: 20),
            _sectionTitle('When would you like to go?'),
            _textField('Departure City'),
            _textField('Departure Date'),
            Row(
              children: [
                Checkbox(
                  value: flexibleDates,
                  onChanged: (value) {
                    setState(() => flexibleDates = value!);
                  },
                ),
                Text("I'm flexible in dates"),
              ],
            ),
            SizedBox(height: 20),
            _sectionTitle('Number of Travelers & Rooms'),
            _counterRow('Adults', 'Ages 13 or above', adults, (val) {
              setState(() => adults = val);
            }),
            _counterRow('Children', 'Ages 02 - 12', children, (val) {
              setState(() => children = val);
            }),
            _counterRow('Infants', 'Under 2', infants, (val) {
              setState(() => infants = val);
            }),
            _counterRow('Rooms', 'Single Rooms', rooms, (val) {
              setState(() => rooms = val);
            }),
            Row(
              children: [
                Checkbox(
                  value: mattressRequired,
                  onChanged: (value) {
                    setState(() => mattressRequired = value!);
                  },
                ),
                Text("Mattress Required"),
              ],
            ),
            SizedBox(height: 20),
            _sectionTitle('Additional Requirements'),
            _dropdownField('Trip Type', tripTypes, selectedTripType, (val) {
              setState(() => selectedTripType = val);
            }),
            _dropdownField('Destination', destinations, selectedDestination,
                (val) {
              setState(() => selectedDestination = val);
            }),
            SizedBox(height: 20),
            _sectionTitle('Detail / Preference'),
            _textArea('Share Additional Detail'),
            SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handle form submission here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF9DE3C6), // Light green
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text('Submit', style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
    );
  }

  Widget _textField(String hint) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        ),
      ),
    );
  }

  Widget _textArea(String hint) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        maxLines: 4,
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          contentPadding: EdgeInsets.all(12),
        ),
      ),
    );
  }

  Widget _dropdownField(
    String hint,
    List<String> items,
    String? selectedValue,
    Function(String?) onChanged,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: DropdownButtonFormField<String>(
        value: selectedValue,
        hint: Text(hint),
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        ),
        items: items.map((item) {
          return DropdownMenuItem(value: item, child: Text(item));
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }

  Widget _counterRow(
      String title, String subtitle, int value, Function(int) onChanged) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontWeight: FontWeight.w600)),
                Text(subtitle, style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.remove_circle_outline),
                onPressed: () {
                  if (value > 0) onChanged(value - 1);
                },
              ),
              Text(value.toString(), style: TextStyle(fontSize: 16)),
              IconButton(
                icon: Icon(Icons.add_circle_outline),
                onPressed: () {
                  onChanged(value + 1);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
