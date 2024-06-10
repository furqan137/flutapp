import 'package:flutter/material.dart';
import 'TailorProfilePage.dart';

class SearchTailorsPage extends StatefulWidget {
  @override
  _SearchTailorsPageState createState() => _SearchTailorsPageState();
}

class _SearchTailorsPageState extends State<SearchTailorsPage> {
  List<Map<String, dynamic>> _tailors = List.generate(
    20,
        (index) => {
      'name': 'Tailor ${index + 1}',
      'icon': Icons.person,
      'age': 30 + index,
      'experience': '5 years',
      'gender': index % 2 == 0 ? 'Male' : 'Female',
      'ordersCompleted': index * 10,
      'rating': (index + 1) % 5 + 1,
    },
  );

  List<Map<String, dynamic>> _filteredTailors = [];

  @override
  void initState() {
    super.initState();
    _filteredTailors.addAll(_tailors);
  }

  void _filterTailors(String query) {
    setState(() {
      _filteredTailors.clear();
      if (query.isNotEmpty) {
        _filteredTailors.addAll(_tailors.where((tailor) =>
            tailor['name'].toLowerCase().contains(query.toLowerCase())));
      } else {
        _filteredTailors.addAll(_tailors);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Tailors'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              onChanged: _filterTailors,
              decoration: InputDecoration(
                hintText: 'Search for tailors...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredTailors.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(_filteredTailors[index]['icon']),
                  title: Text(_filteredTailors[index]['name']),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TailorProfilePage(
                          tailorDetails: _filteredTailors[index],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
