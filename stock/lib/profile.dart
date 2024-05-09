import 'package:flutter/material.dart';
import 'package:stock/trade.dart';
import 'package:stock/home.dart';
import 'package:stock/login.dart';
import 'package:stock/watch.dart'; // Import LoginPage

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Profile'),
      ),
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/orange_dir.jpeg', // Replace with your background image path
              fit: BoxFit.cover,
              colorBlendMode: BlendMode.darken,
              color: Colors.black
                  .withOpacity(0.5), // Add a black overlay for contrast
            ),
          ),
          // Profile details
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Circular profile image
                Center(
                  child: CircleAvatar(
                    radius: 50, // Adjust the size as needed
                    backgroundImage: AssetImage(
                      'assets/images/srk.jpeg', // Replace with your profile image path
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // Profile details
                Text(
                  'Name: Finash de Fonollosa',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                SizedBox(height: 10),
                Text(
                  'Email: fonollosa@gmail.com',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                SizedBox(height: 10),
                Text(
                  'Phone: +1234567890',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                SizedBox(height: 10),
                Text(
                  'Address: 123 Main Street, Kzkd, Kerala',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ),
          // Logout button
          Positioned(
            bottom: 30, // Adjust the position as needed
            left: 0,
            right: 0,
            child: Center(
              child: IconButton(
                icon: Icon(Icons.logout),
                color: const Color.fromARGB(255, 25, 15, 0),
                iconSize: 20, // Adjust the icon size as needed
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
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
              icon: Icon(Icons.home),
              color: Colors.orange,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.visibility),
              color: Colors.orange,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WatchList()),
                );
                // Handle watchlist button press here
              },
            ),
          ],
        ),
      ),
    );
  }
}
