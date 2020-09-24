import 'package:flutter/material.dart';
import 'griddashboard.dart';
import 'package:lpchub/authentication/user_details_for_reference.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ('LPCHUB'),
      home: AHome(),
    );
  }
}

class AHome extends StatefulWidget {
  @override
  _AHomeState createState() => _AHomeState();
}

class _AHomeState extends State<AHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LPCHUB"),
        backgroundColor: Colors.black12,
        elevation: 20.0,

      ),
      backgroundColor: Colors.black12,
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(Details.name,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 4,
                    ),
                    Text("Home",
                        style: TextStyle(
                            color: Color(0xffa29aac),
                            fontSize: 14,
                            fontWeight: FontWeight.w600)),
                  ],
                ),
                IconButton(
                  alignment: Alignment.topCenter,
                  icon: Image.asset(
                    "assets/notification.png",
                    width: 24,
                  ),
                  onPressed: () {},
                )
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          GridDashboard(),
        ],
      ),
    );
  }
}