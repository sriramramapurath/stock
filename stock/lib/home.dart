import 'package:flutter/material.dart';
import 'package:stock/profile.dart';
import 'package:stock/trade.dart';
import 'package:stock/watch.dart';

class HomePage extends StatelessWidget {
  // List of brand names
  final List<String> brandNames = [
    'BMW',
    'Blue Origin',
    'Amazon',
    'Tesla',
    'McDonald\'s',
    'Microsoft',
    'Apple',
    'Google',
    'Facebook',
    'Netflix',
  ];

  // List of image paths corresponding to each brand name
  final List<String> brandImages = [
    'assets/images/BMW.png', // Replace with your image path
    'assets/images/bLUE ORIGIN.png', // Replace with your image path
    'assets/images/Amazon-512.webp', // Replace with your image path
    'assets/imges/Tesla_logo.png', // Replace with your image path
    'assets/images/mcdonalds.jpg', // Replace with your image path
    'assets/images/microsoft.jpg', // Replace with your image path
    'assets/images/apple.jpg', // Replace with your image path
    'assets/images/google.jpg', // Replace with your image path
    'assets/images/facebook.jpg', // Replace with your image path
    'assets/images/netflix.jpg', // Replace with your image path
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Black background color for scaffold
      appBar: AppBar(
        backgroundColor: Colors.orange, // Orange background color for app bar
        title: Text('Stocker'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Handle search icon button press here
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome text container
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Welcome to Stocker!',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Account value subtitle
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Text(
                'Your account value is = 12500 rs',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                ),
              ),
            ),

            // My positions text container
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'My Brands',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.orange, // Orange color for text
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Tiles under vertical scroll axis
            Expanded(
              child: ListView.builder(
                itemCount: brandNames.length, // Number of tiles
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(
                          brandImages[index]), // Image for each brand
                      backgroundColor: Colors.transparent,
                    ),
                    title: Text(
                      brandNames[index],
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: Text(
                      index.isEven
                          ? '+ 2500 rs'
                          : '- 1100 rs', // Alternating positive and negative values
                      style: TextStyle(
                        color: index.isEven ? Colors.green : Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black, // Black background color for bottom app bar
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.visibility),
              color: Colors.orange, // Orange color for icon button
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WatchList()),
                );
                // Handle watchlist button press here
              },
            ),
            IconButton(
              icon: Icon(Icons.swap_horiz),
              color: Colors.orange,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TradePage()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.person),
              color: Colors.orange,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
                // Handle profile button press here
              },
            ),
          ],
        ),
      ),
    );
  }
}
