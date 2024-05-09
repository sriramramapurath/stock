import 'package:flutter/material.dart';
import 'package:stock/home.dart';
import 'package:stock/profile.dart';
import 'package:stock/watch.dart';

class TradePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Horizontal scroll view builder for 10 containers
            Container(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  // Generate random percentage changes
                  final randomChange =
                      index.isEven ? '+${index * 10}%' : '-${index * 5}%';

                  return Container(
                    width: 100,
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: Colors.grey[850],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Brand name text
                          Text(
                            'Brand ${index + 1}',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          // Random percentage change text
                          Text(
                            randomChange,
                            style: TextStyle(
                              fontSize: 14,
                              color: randomChange.contains('-')
                                  ? Colors.red // Red for negative change
                                  : Colors.green, // Green for positive change
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: 16),

            // Input text field with hint 'Search'
            TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.grey),
                fillColor: Color.fromARGB(255, 226, 136, 2),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              ),
              style: TextStyle(color: Colors.black),
            ),

            SizedBox(height: 16),

            // Container with heading 'Research Hub' and subtitle paragraph
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey[850],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Research Hub',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'India has a vibrant and rapidly growing stock market.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 16),

            // Vertical scroll view builder for 10 tiles
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  final isBuy = index.isEven;
                  final buyOrSell = isBuy ? 'Buy' : 'Sell';
                  final quantity = 5000 + (index * 100);
                  final type = isBuy ? 'Limit' : 'Market';
                  final price = 1500 + (index * 20);

                  return ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Brand ${index + 1}',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(height: 4),
                        // Row with Buy/Sell status, quantity, type, and price
                        Row(
                          children: [
                            Text(
                              'B/S: $buyOrSell',
                              style: TextStyle(
                                color: isBuy
                                    ? Colors.green
                                    : Colors.red, // Green for Buy, red for Sell
                              ),
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Quantity: $quantity',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Type: $type',
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Price: ₹$price',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      // Bottom app bar with three icon buttons
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
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
