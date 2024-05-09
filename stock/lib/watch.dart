import 'package:flutter/material.dart';
import 'package:stock/profile.dart';
import 'package:stock/trade.dart';
import 'package:stock/home.dart';
import 'package:url_launcher/url_launcher.dart';

class WatchList extends StatelessWidget {
  // List of YouTube video links
  final List<String> videoLinks = [
    'https://youtu.be/p7HKvqRI_Bo?si=6r5Si3zrI8r4Xvnj',
    'https://www.youtube.com/live/7QKYVJfUL5Q?si=amcqpCyQe266WUkE',
    'https://youtu.be/tHxwyWnNu0c?si=E_xUfTHxEi3kDx6F',
    'https://youtu.be/hsbhN7i7H8E?si=RJTwgKJYhjzXoFi9',
    'https://youtu.be/24v77jbIkEo?si=8nMUB7sknMcggpsN',
    'https://youtu.be/lNdOtlpmH5U?si=SpMf8_iQ3xYh4HXn',
  ];

  // Function to extract the video ID from a YouTube link
  String extractVideoId(String url) {
    if (url.contains('youtu.be/')) {
      return url.split('youtu.be/')[1].split('?')[0];
    } else if (url.contains('www.youtube.com/watch?v=')) {
      return url.split('watch?v=')[1].split('?')[0];
    } else if (url.contains('www.youtube.com/live/')) {
      return url.split('live/')[1].split('?')[0];
    }
    return '';
  }

  // Function to get the thumbnail URL from the video ID
  String getThumbnailUrl(String videoId) {
    return 'https://img.youtube.com/vi/$videoId/hqdefault.jpg';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('MY WATCHLIST'),
      ),
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/graph1.jpg', // Replace with your background image path
              fit: BoxFit.cover,
              colorBlendMode: BlendMode.darken,
              color: Colors.black
                  .withOpacity(0.5), // Add a black overlay for contrast
            ),
          ),
          // ListView.builder with tiles in vertical axis
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
              itemCount: videoLinks.length, // Number of video links
              itemBuilder: (context, index) {
                final videoLink = videoLinks[index];
                final videoId = extractVideoId(videoLink);
                final thumbnailUrl = getThumbnailUrl(videoId);

                return Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.all(8),
                      leading: Image.network(
                        thumbnailUrl,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Icon(
                          Icons.error,
                          color: Colors.red,
                        ),
                      ),
                      title: Text(
                        'Video ${index + 1}',
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        videoLink,
                        style: TextStyle(color: Colors.white70),
                      ),
                      onTap: () {
                        // Handle tile tap for navigating to video link
                        // Use the url_launcher package to open the video link in a web browser
                        launchUrl(videoLink);
                      },
                    ),
                    SizedBox(height: 16), // Add a SizedBox between tiles
                  ],
                );
              },
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
                // Handle trade button press here
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
                // Handle home button press here
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

void launchUrl(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
