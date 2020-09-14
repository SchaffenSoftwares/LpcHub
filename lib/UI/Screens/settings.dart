import 'package:flutter/material.dart';
import 'package:lpchub/authentication/authentication.dart';
import 'package:lpchub/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class Settings extends StatelessWidget {
  Authentication _authentication;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black54,
        appBar: AppBar(
          backgroundColor: appOrange,
          title: Center(
            child: Text(
              'Settings',
              style: GoogleFonts.alata(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: Container(
          child: Column(
            children: [
              SizedBox(
                height: 50.0,
              ),
              GestureDetector(

                onForcePressEnd: (f){
                  print('tapped 2 times');
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      // return object of type Dialog
                      return AlertDialog(
                        title: new Text("Greetings from app creator"),
                        content: new Text("By: AwsmAsim Junaid, Have a great day !"),
                        actions: <Widget>[
                          // usually buttons at the bottom of the dialog
                          new FlatButton(
                            child: new Text("Close"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                  

                },
                onTap: (){
                  _authentication=Authentication();
                  _authentication.signOut(context);
                },
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      gradient: RadialGradient(
                        colors: [
                          Colors.grey[900],
                          Colors.black,
                        ],
                        radius: 5.0,
                        stops: [0.4, 1.0],
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                      border: Border.all(
                          color: appOrange,
                          width: 5.0,
                      ),
                    ),
                    child: Icon(Icons.power_settings_new ,
                    color: appOrange,
                      size: 60.0,
                    ),
                  ),
                ),
              ),
                SizedBox(height: 20.0),
                Text(
                  'Log Out',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
