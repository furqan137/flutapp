import 'package:flutter/material.dart';

class TailorProfilePage extends StatelessWidget {
  final Map<String, dynamic> tailorDetails;

  TailorProfilePage({required this.tailorDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tailor Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: Text(
                    'Name',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(tailorDetails['name']),
                  leading: Icon(Icons.person),
                ),
                Divider(),
                ListTile(
                  title: Text(
                    'Age',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(tailorDetails['age'].toString()),
                  leading: Icon(Icons.calendar_today),
                ),
                Divider(),
                ListTile(
                  title: Text(
                    'Experience',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(tailorDetails['experience']),
                  leading: Icon(Icons.work),
                ),
                Divider(),
                ListTile(
                  title: Text(
                    'Gender',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(tailorDetails['gender']),
                  leading: Icon(Icons.people),
                ),
                Divider(),
                ListTile(
                  title: Text(
                    'Orders Completed',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(tailorDetails['ordersCompleted'].toString()),
                  leading: Icon(Icons.check_circle),
                ),
                Divider(),
                ListTile(
                  title: Text(
                    'Rating',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(tailorDetails['rating'].toString()),
                  leading: Icon(Icons.star),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
