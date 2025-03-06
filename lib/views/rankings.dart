import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Rankings extends StatefulWidget {
  const Rankings({super.key});

  @override
  _RankingsState createState() => _RankingsState();
}

class _RankingsState extends State<Rankings> {
  List<Artist> artists = [];

  // Fetch data from your Node.js backend
  Future<void> fetchArtists() async {
    final url = 'http://localhost:3000/fetchShortIoData';  // Your Node.js backend URL

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        setState(() {
          artists = [
            Artist(
              name: 'Artist 1',
              imagePath: 'assets/images/justin.jpg',
              userImpressions: data['clicks'],
              concerts: 10,
            ),
            Artist(
              name: 'Artist 2',
              imagePath: 'assets/images/drake.jpg',
              userImpressions: data['clicks'],
              concerts: 20,
            ),
            Artist(
              name: 'Artist 3',
              imagePath: 'assets/images/drake.jpg',
              userImpressions: data['clicks'],
              concerts: 20,
            ),
            Artist(
              name: 'Artist 4',
              imagePath: 'assets/images/drake.jpg',
              userImpressions: data['clicks'],
              concerts: 20,
            ),
            // Add more artists as needed
          ];

          // Sort artists based on impressions/concerts ratio
          artists.sort((a, b) => (b.userImpressions / b.concerts).compareTo(a.userImpressions / a.concerts));
        });
      } else {
        throw Exception('Failed to load data from backend');
      }
    } catch (e) {
      showErrorDialog('Error fetching data: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchArtists();  // Fetch artists data when the page loads
  }

  void showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,  // Dark theme background
      appBar: AppBar(
        title: const Text('Artist Rankings'),
        backgroundColor: Colors.black,  // AppBar background color to black
      ),
      body: artists.isEmpty
          ? const Center(child: CircularProgressIndicator())  // Loader while fetching
          : ListView.builder(
              itemCount: artists.length,
              itemBuilder: (context, index) {
                final artist = artists[index];
                return Card(
                  color: Colors.black12,  // Slightly dark cards
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            artist.imagePath,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                artist.name,
                                style: TextStyle(
                                  color: Colors.green,  // Text color green
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Impressions: ${artist.userImpressions}',
                                style: TextStyle(color: Colors.green),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                'Concerts: ${artist.concerts}',
                                style: TextStyle(color: Colors.green),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          'Rank: ${index + 1}',
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}

class Artist {
  final String name;
  final String imagePath;
  final int userImpressions;
  final int concerts;

  Artist({
    required this.name,
    required this.imagePath,
    required this.userImpressions,
    required this.concerts,
  });
}