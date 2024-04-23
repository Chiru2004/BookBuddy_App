import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  void _performSearch() {
    setState(() {
      _searchQuery = _searchController.text;
      // Perform search functionality here
      // You can implement API calls, search algorithms, etc.
      // For demonstration, let's just print the search query
      print("Search initiated with query: $_searchQuery");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Enter your search query',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _performSearch,
              child: Text('Search'),
            ),
            SizedBox(height: 20.0),
            _searchQuery.isNotEmpty
                ? Text(
                    'Search Results for: $_searchQuery',
                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  )
                : Container(),
            // Add your search results UI here, if any
          ],
        ),
      ),
    );
  }
}

