import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'dashboard.dart';
import 'loginPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('token');
  bool loggedIn = false;

  if (token != null) {
    // Validate token with backend
    loggedIn = await validateToken(token);
  }

  runApp(MyApp(loggedIn: loggedIn));
}

Future<bool> validateToken(String token) async {
  try {
    // Send a request to your backend to validate the token
    final response = await http.post(
      Uri.parse('YOUR_BACKEND_ENDPOINT/validateToken'), // Replace with your actual endpoint
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      // Token is valid
      return true;
    } else {
      // Token is invalid or expired
      return false;
    }
  } catch (e) {
    // Error occurred during token validation
    print('Error validating token: $e');
    return false;
  }
}

class MyApp extends StatelessWidget {
  final bool loggedIn;

  const MyApp({
    required this.loggedIn,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: loggedIn ? Dashboard() : SignInPage(),
    );
  }
}
