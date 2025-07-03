import 'package:flutter/material.dart';
import 'package:frist_app/choicegust.dart';
import 'package:frist_app/confromandpay.dart';
import 'package:frist_app/tripdeatil.dart';

void main() => runApp(MaterialApp(home: Date()));

class Date extends StatefulWidget {
  @override
  _ChooseDatePageState createState() => _ChooseDatePageState();
}

class _ChooseDatePageState extends State<Date> {
  int selectedIndex = 0;

  final List<String> dateOptions = [
    'Jan 02, 22 - Jan 12, 22',
    'Jan 08, 22 - Jan 18, 22',
    'Jan 14, 22 - Jan 24, 22',
    'Jan 22, 22 - Feb 02, 22',
    'Jan 30, 22 - Feb 10, 22',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Date', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyAp()),
                )),
      ),
      body: Column(
        children: [
          ...List.generate(dateOptions.length, (index) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              decoration: BoxDecoration(
                border: Border.all(
                  color: selectedIndex == index
                      ? Colors.green
                      : Colors.grey.shade300,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: RadioListTile(
                title: Text(dateOptions[index]),
                value: index,
                groupValue: selectedIndex,
                activeColor: Colors.green,
                onChanged: (value) {
                  setState(() {
                    selectedIndex = value as int;
                  });
                },
              ),
            );
          }),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              children: [
                Text(
                  'Rs. 7000 ',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text('/ Person'),
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => choice1()),
                    );
                    // Handle next
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  ),
                  child: const Text("BOOK NOW",
                      style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
