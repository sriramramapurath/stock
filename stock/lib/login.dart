import 'package:flutter/material.dart';
import 'package:stock/home.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Background color of the page
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Circular image for upload
              CircleAvatar(
                radius: 50.0, // Size of the circular avatar
                backgroundImage: AssetImage(
                    'images/graph1.jpg'), // Replace with your image asset path
                backgroundColor: Color.fromARGB(255, 217, 187,
                    163), // Background color if image is not available
              ),
              SizedBox(height: 20), // Space between elements

              // Login text
              Text(
                'Login',
                style: TextStyle(
                  fontSize: 24,
                  color: Color.fromARGB(255, 234, 132, 15),
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 20), // Space between elements

              // Email text field
              Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(
                      255, 219, 125, 17), // Light orange background color
                  borderRadius: BorderRadius.circular(25), // Circular edges
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Email',
                      border: InputBorder.none, // Remove default border
                    ),
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),

              SizedBox(height: 20), // Space between elements

              // Password text field
              Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(
                      255, 228, 143, 16), // Light orange background color
                  borderRadius: BorderRadius.circular(25), // Circular edges
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    obscureText: true, // Mask password input
                    decoration: InputDecoration(
                      hintText: 'Password',
                      border: InputBorder.none, // Remove default border
                    ),
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),

              SizedBox(height: 20), // Space between elements

              // Login button
              ElevatedButton(
                onPressed: () {
                  // Handle login button press here
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(
                      255, 242, 255, 0), // Button background color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25), // Rounded edges
                  ),
                ),
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
