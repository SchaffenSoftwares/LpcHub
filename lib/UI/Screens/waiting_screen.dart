import 'package:flutter/material.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:lpchub/utils/colors.dart';

class WaitingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Opacity(
        opacity: 0.5,
        child: Center(
          child: Container(
            height: 50.0,
            width: 50.0,
            color: Colors.black,
            child: CircularProgressIndicator(
              backgroundColor: appOrange,
            ),
          ),
        ),
      ),
    );
  }
}
