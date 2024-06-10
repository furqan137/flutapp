import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Import HTTP package

class CommonLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.network(
          "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiUIqOPoIwKeUtY2z-DHamRqTkL1O_QrJ7mX2iX4e-XjqTLLHNsOD1MPZrUFqPEhN5o9bW_knFelEDFLKEJbkfuGDztTkqzXJhza3-VraFumdNZpJjPeTjfeYCOY4_946tcwA3rr431P1945RF4ZkcLVojqGmt6QNJN7qYk_GZl4xfI1-A3LPvo_K0JkrY/s500/Stitchit.png",
          width: 100,
        ),
        Text(
          "STITCHIT",
          style: TextStyle(
            fontSize: 32, // Adjust the font size according to your preference
            fontStyle: FontStyle.italic,
          ),
        ),
        Text(
          "Customize cloth & Interact tailor",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w300,
            fontSize: 18, // Adjust the font size according to your preference
          ),
        ),
      ],
    );
  }
}
