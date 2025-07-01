import 'package:flutter/material.dart';
import 'package:frist_app/explore.dart';
import 'package:frist_app/ready%20to%20go.dart';
import 'package:frist_app/tranding tour.dart';
import 'package:frist_app/hotoffer.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Search your place",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'PtSans',
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(16, 10, 16, 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Box
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Where you're going",
                    hintStyle: TextStyle(
                      fontFamily: 'PtSans',
                      fontWeight: FontWeight.w500,
                    ),
                    icon: Icon(Icons.search),
                    border: InputBorder.none,
                  ),
                ),
              ),

              SizedBox(height: 28),

              // Popular Places Title
              Text(
                "POPULAR PLACES",
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'PtSans',
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 12),

              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => explore(),
                    ),
                  );
                },
                child: _buildPlaceItem("Hunza Valley"),
              ),
              SizedBox(height: 12),

              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => togo(),
                    ),
                  );
                },
                child: _buildPlaceItem("Tranding Tours"),
              ),
              SizedBox(height: 12),

              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => hotoffer(),
                    ),
                  );
                },
                child: _buildPlaceItem("Hot offer"),
              ),
              SizedBox(height: 12),

              SizedBox(height: 32),

              // Categories Title
              Text(
                "CATEGORIES",
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'PtSans',
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 16),

              // Category Items
              _buildCategoryItem("Advanture"),
              SizedBox(height: 33),
              _buildCategoryItem("Beaches"),
              SizedBox(height: 33),
              _buildCategoryItem("Culture"),
              SizedBox(height: 33),
              _buildCategoryItem("Camping"),
              SizedBox(height: 33),
              _buildCategoryItem("Honeymoon"),
              SizedBox(height: 33),
              _buildCategoryItem("Sightseeing"),
              SizedBox(height: 33),
              _buildCategoryItem("Montain"),

              SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlaceItem(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(Icons.search, size: 18, color: Colors.black),
          SizedBox(width: 10),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'PtSans',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 16,
        fontFamily: 'PtSans',
      ),
    );
  }
}
