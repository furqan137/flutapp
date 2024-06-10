import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'config.dart';
import 'inbox.dart';
import 'search_tailors.dart';
import 'orders.dart';
import 'loginPage.dart'; // Import the LoginPage

class Dashboard extends StatefulWidget {
  final String? token;

  const Dashboard({this.token, Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late String? userId;

  @override
  void initState() {
    super.initState();
    userId = widget.token != null ? decodeToken(widget.token!)['_id'] : null;
  }

  Map<String, dynamic> decodeToken(String token) {
    // Dummy implementation for token decoding
    return {"_id": "dummyUserId"};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          _buildButtonsRow(),
          _buildContent(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.all(30.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => SignInPage()),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              child: Icon(
                Icons.arrow_back,
                size: 30.0,
              ),
              backgroundColor: Colors.white,
              radius: 30.0,
            ),
            SizedBox(height: 10.0),
            Text(
              'STITCHIT',
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 8.0),
            Text(
              'Customize cloth & Interact tailor',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButtonsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          onPressed: () => _navigateToSearchTailors(),
          child: Text("Search Tailors"),
        ),
        ElevatedButton(
          onPressed: () => _navigateToViewOrders(),
          child: Text("View Orders"),
        ),
        ElevatedButton(
          onPressed: () => _navigateToInbox(),
          child: Text("Inbox"),
        ),
      ],
    );
  }

  Widget _buildContent() {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(92.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.add, size: 60.0),
                onPressed: () => _showAddNewCustomDesignDialog(),
              ),
              SizedBox(height: 10.0),
              Text(
                'Add new custom design',
                style: TextStyle(fontSize: 18.0),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToSearchTailors() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SearchTailorsPage()),
    );
  }

  void _navigateToViewOrders() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ViewOrdersPage()),
    );
  }

  void _navigateToInbox() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => InboxPage()),
    );
  }

  void _showAddNewCustomDesignDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Add New Custom Design"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Description'),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // Implement submit functionality
                Navigator.of(context).pop();
              },
              child: Text("Submit"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
          ],
        );
      },
    );
  }
}
