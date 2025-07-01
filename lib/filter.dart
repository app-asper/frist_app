import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Filter extends StatefulWidget {
  @override
  State<Filter> createState() => _FilterPageState();
}

class _FilterPageState extends State<Filter> {
  String selectedCategory = 'All';
  String selectedSort = 'Trending';
  double? minPrice;
  double? maxPrice;
  int selectedRating = 0;
  DateTime? selectedDate;

  final categories = ['All', 'Electronics', 'Fashion', 'Books'];
  final sortOptions = [
    'Trending',
    'Newest',
    'Price: Low to High',
    'Price: High to Low'
  ];

  void resetFilters() {
    setState(() {
      selectedCategory = 'All';
      selectedSort = 'Trending';
      minPrice = null;
      maxPrice = null;
      selectedRating = 0;
      selectedDate = null;
    });
  }

  Future<void> pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Widget sectionTitle(String title) => Padding(
        padding: const EdgeInsets.only(bottom: 6),
        child: Text(
          title.toUpperCase(),
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filter"),
        leading: BackButton(),
      ),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sectionTitle("Categories"),
            DropdownButtonFormField<String>(
              value: selectedCategory,
              items: categories
                  .map((e) => DropdownMenuItem(child: Text(e), value: e))
                  .toList(),
              onChanged: (val) => setState(() => selectedCategory = val!),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 16),
            sectionTitle("Date"),
            SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: pickDate,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            selectedDate != null
                                ? DateFormat('dd/MM/yyyy').format(selectedDate!)
                                : "No Date Selected",
                            style: TextStyle(
                              fontSize: 15,
                              color: selectedDate != null
                                  ? Colors.black
                                  : Colors.grey,
                            ),
                          ),
                          Row(
                            children: [
                              if (selectedDate != null)
                                GestureDetector(
                                  onTap: () =>
                                      setState(() => selectedDate = null),
                                  child: Icon(Icons.close,
                                      size: 18, color: Colors.redAccent),
                                ),
                              SizedBox(width: 8),
                              Icon(Icons.calendar_today_outlined, size: 18),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            sectionTitle("Sort By"),
            DropdownButtonFormField<String>(
              value: selectedSort,
              items: sortOptions
                  .map((e) => DropdownMenuItem(child: Text(e), value: e))
                  .toList(),
              onChanged: (val) => setState(() => selectedSort = val!),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 16),
            sectionTitle("Price"),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Min',
                      filled: true,
                      fillColor: Colors.grey[100],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onChanged: (value) =>
                        setState(() => minPrice = double.tryParse(value)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text('-'),
                ),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Max',
                      filled: true,
                      fillColor: Colors.grey[100],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onChanged: (value) =>
                        setState(() => maxPrice = double.tryParse(value)),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            sectionTitle("Rating"),
            Row(
              children: List.generate(5, (index) {
                return IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(Icons.star,
                      color: selectedRating > index
                          ? Colors.green
                          : Colors.grey[300]),
                  onPressed: () => setState(() => selectedRating = index + 1),
                );
              }),
            ),
            SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: resetFilters,
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 14),
                      side: BorderSide(color: Colors.green),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text("Reset",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.green,
                        )),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context, {
                        'category': selectedCategory,
                        'date': selectedDate,
                        'sort': selectedSort,
                        'minPrice': minPrice,
                        'maxPrice': maxPrice,
                        'rating': selectedRating,
                      });
                    },
                    child: Text("Apply",
                        style: TextStyle(fontSize: 16, color: Colors.white)),
                  ),
                ),
              ],
            ),
            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
