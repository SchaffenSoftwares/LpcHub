import 'package:flutter/material.dart';
import 'package:lpchub/UI/student/login.dart';
import 'package:lpchub/UI/alumni/login.dart';
import 'package:lpchub/authentication/authentication.dart';
import 'package:lpchub/utils/colors.dart';
import 'package:lpchub/utils/utils.dart';
import 'package:flutter/services.dart';

class LandingPage extends StatelessWidget {
  Authentication authentication;
  String student='student';
  String alumini = 'alumini';
  @override
  Widget build(BuildContext context) {
    // Change Status Bar Color
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Color(0xFFFB8C00)),
    );

    final logo = Container(
      height: 200.0,
      width: 200.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AvailableImages.appLogo,
          fit: BoxFit.cover,
        ),
      ),
    );

    final appName = Column(
      children: <Widget>[
        Text(
          AppConfig.appName,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFFFB8C00),
              fontSize: 60.0,
              fontFamily: 'Girassol'
          ),
        ),
        Text(
          AppConfig.appTagline,
          style: TextStyle(
              color: Color(0xFFFB8C00),
              fontSize: 18.0,
              fontWeight: FontWeight.w500
          ),
        )
      ],
    );

    final loginBtn = InkWell(
      onTap: () {
        authentication = Authentication();
        authentication.checkLoggedIn(context,student);
      },
      child: Container(
        height: 60.0,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.0),
          border: Border.all(color: Color(0xFFFB8C00)),
          color: Colors.transparent,
        ),
        child: Center(
          child: Text(
            'LOG IN AS STUDENT',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20.0,
              color: Color(0xFFFB8C00),
            ),
          ),
        ),
      ),
    );

    final registerBtn = Container(
      height: 60.0,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.0),
        border: Border.all(color: Colors.white),
        color: Color(0xFFFB8C00),
      ),
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          authentication=Authentication();
          authentication.checkLoggedIn(context, alumini);},
        color: Color(0xFFFB8C00),
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(7.0),
        ),
        child: Text(
          'LOGIN AS ALUMNI',
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20.0,
              color: Colors.white
          ),
        ),
      ),
    );

    final buttons = Padding(
      padding: EdgeInsets.only(
        top: 80.0,
        bottom: 30.0,
        left: 30.0,
        right: 30.0,
      ),
      child: Column(
        children: <Widget>[loginBtn, SizedBox(height: 20.0), registerBtn],
      ),
    );

    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 70.0),
              decoration: BoxDecoration(gradient: primaryGradient),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: <Widget>[logo, appName, buttons],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
