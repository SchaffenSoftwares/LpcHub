import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lpchub/UI/alumni/home.dart';
import 'package:lpchub/UI/alumni/login.dart';
import 'package:lpchub/UI/landing.dart';
import 'package:lpchub/UI/student/home.dart';
import 'package:lpchub/UI/student/login.dart';
import 'user_details_for_reference.dart';
import 'package:lpchub/authentication/user_details_for_reference.dart';
import 'package:lpchub/UI/Screens/waiting_screen.dart';



class Authentication{
  var _auth = FirebaseAuth.instance;
  UserCredential userCredential;
  String student = 'student';
  String alumini='alumini';

  void signIn(String email,String password, String identity, BuildContext context) async{
    Navigator.of(context).push(MaterialPageRoute(builder:(context)=>WaitingScreen()));
    try {
      userCredential = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password
      )
      .catchError((e){
        if (e.code == 'user-not-found' || e.code == 'wrong-password') {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              // return object of type Dialog
              return AlertDialog(
                title: new Text("Invalid email or password"),
                content: new Text("Please check email and password"),
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
        }
      })
      .whenComplete((){

        _auth.userChanges().listen((User user) {
          if(user!=null){
              Details.name=_auth.currentUser.displayName!=null?_auth.currentUser.displayName:'';
              Details.email= _auth.currentUser.email!=null?_auth.currentUser.email:'';
              if(identity.compareTo(student)==0){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home() ),);
              }else{
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => AHome() ),);
              }

        }
        });
      })
      ;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            // return object of type Dialog
            return AlertDialog(
              title: new Text("Invalid email or password"),
              content: new Text("Please check email and password"),
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
      }
    }
  }

  Future signUp(String email,String password,String name,String identity ,BuildContext context) async{
    //email And password are for Authentication.
    //name of the user is stored in the database.
    //email, password and user are all stored in signInDetails directoy for further use in UI if needed.
    //context is used so that we can display error message.
    Navigator.of(context).push(MaterialPageRoute(builder:(context)=>WaitingScreen()));
    try{
      userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .whenComplete((){
            FirebaseAuth.instance.currentUser
            ..updateProfile(displayName: name);
            Details.name=name;
            Details.email=email;
            if(identity.compareTo(student)==0){
              Navigator.pushAndRemoveUntil(context,
                  MaterialPageRoute(builder:
                      (context)=>Home()
                  ),
                      (Route<dynamic> route) => false);            }
            else{
              Navigator.pushAndRemoveUntil(context,
                  MaterialPageRoute(builder:
                      (context)=>AHome()
                  ),
                      (Route<dynamic> route) => false);
            }
      })
      ;
    }on FirebaseAuthException catch (err) {
      if (err.code == 'weak-password') {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            // return object of type Dialog
            return AlertDialog(
              title: new Text("Email Already Used"),
              content: new Text("Please enter another email."),
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
      }
      else if(err.code=='ERROR_EMAIL_ALREADY_IN_USE'){
        showDialog(
          context: context,
          builder: (BuildContext context) {
            // return object of type Dialog
            return AlertDialog(
              title: new Text("Email Already Used"),
              content: new Text("Please enter another email."),
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

      }
       else if(err.code=='ERROR_TOO_MANY_REQUESTS'){
        showDialog(
          context: context,
          builder: (BuildContext context) {
            // return object of type Dialog
            return AlertDialog(
              title: new Text("Too many requests"),
              content: new Text("Please try after some time."),
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
      }
    } catch (e) {
      print(e.toString());
    }
  }
  Future checkLoggedIn(BuildContext context, String identity){
    //print('checking if user logged in');
    _auth.authStateChanges().listen((User user) {
      if(user==null){
        if(identity==student){
          Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => LoginPage() ),);

        }
        else
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => ALoginPage() ),);
      }else
        {
          if(identity==student){
            Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => Home() ),);
            Details.name=_auth.currentUser.displayName;
            Details.email=_auth.currentUser.email;
          }
          else{
            Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => AHome() ),);
          }
        }
    });
  }
  Future signOut(BuildContext context) async{
    await FirebaseAuth.instance.signOut()
    .whenComplete((){
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder:
          (context)=>LandingPage()
          ),
              (Route<dynamic> route) => false);
      // Navigator.popUntil(context, (route) => false);
    })
    ;

}
}