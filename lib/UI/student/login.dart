import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lpchub/authentication/authentication.dart';
import 'package:lpchub/utils/colors.dart';
import 'package:lpchub/utils/theme.dart' as Theme;
import 'package:lpchub/utils/bubble_indication_painter.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final FocusNode myFocusNodeEmailLogin = FocusNode();
  final FocusNode myFocusNodePasswordLogin = FocusNode();

  final FocusNode myFocusNodePassword = FocusNode();
  final FocusNode myFocusNodeEmail = FocusNode();
  final FocusNode myFocusNodeName = FocusNode();

  TextEditingController loginEmailController = new TextEditingController();
  TextEditingController loginPasswordController = new TextEditingController();

  bool _obscureTextLogin = true;
  bool _obscureTextSignup = true;
  bool _obscureTextSignupConfirm = true;

  TextEditingController signupEmailController = new TextEditingController();
  TextEditingController signupNameController = new TextEditingController();
  TextEditingController signupPasswordController = new TextEditingController();
  TextEditingController signupConfirmPasswordController =
  new TextEditingController();

  PageController _pageController;

  Color left = Colors.black;
  Color right = Colors.white;

  var email;
  var password;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overscroll) {
          overscroll.disallowGlow();
        },
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height >= 775.0
                ? MediaQuery.of(context).size.height
                : 775.0,
            decoration: new BoxDecoration(
              gradient: new LinearGradient(
                  colors: [
                    Color(0xFF485563),
                    Color(0xFF29323C)
                  ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(1.0, 1.0),
                  stops: [0.0 ,1.0],
                  tileMode: TileMode.clamp),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 75.0),
                  child: new Image(
                      width: 250.0,
                      height: 191.0,
                      fit: BoxFit.fill,
                      image: new AssetImage('assets/login.jpg')),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: _buildMenuBar(context),
                ),
                Expanded(
                  flex: 2,
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (i) {
                      if (i == 0) {
                        setState(() {
                          right = Colors.black54;
                          left = Colors.black;
                        });
                      } else if (i == 1) {
                        setState(() {
                          right = Colors.black;
                          left = Colors.black54;
                        });
                      }
                    },
                    children: <Widget>[
                      new ConstrainedBox(
                        constraints: const BoxConstraints.expand( ),
                        child: _buildSignIn(context),
                      ),
                      new ConstrainedBox(
                        constraints: const BoxConstraints.expand(),
                        child: _buildSignUp(context),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    myFocusNodePassword.dispose();
    myFocusNodeEmail.dispose();
    myFocusNodeName.dispose();
    _pageController?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    _pageController = PageController();
  }

  void showInSnackBar(String value) {
    FocusScope.of(context).requestFocus(new FocusNode());
    _scaffoldKey.currentState?.removeCurrentSnackBar();
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(
        value,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontFamily: "WorkSansSemiBold"),
      ),
      backgroundColor: Colors.blue,
      duration: Duration(seconds: 3),
    ));
  }

  Widget _buildMenuBar(BuildContext context) {
    return Container(
      width: 300.0,
      height: 50.0,
      decoration: BoxDecoration(
        color: Color(0xFFFFE082),
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
      child: CustomPaint(
        painter: TabIndicationPainter(pageController: _pageController),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: FlatButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: _onSignInButtonPress,
                child: Text(
                  "Existing",
                  style: TextStyle(
                      color: left,
                      fontSize: 16.0,
                      fontFamily: "WorkSansSemiBold"),
                ),
              ),
            ),
            //Container(height: 33.0, width: 1.0, color: Colors.white),
            Expanded(
              child: FlatButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: _onSignUpButtonPress,
                child: Text(
                  "New",
                  style: TextStyle(
                      color: right,
                      fontSize: 16.0,
                      fontFamily: "WorkSansSemiBold"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSignIn(BuildContext context) {


    String student = 'student',alumini='alumini';
    Authentication authentication;
    bool autovalidate=false;
    final key =GlobalKey<FormState>();

    return Container(
      padding: EdgeInsets.only(top: 23.0),
      child: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.topCenter,
            overflow: Overflow.visible,
            children: <Widget>[
              Card(
                elevation: 2.0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Container(
                  width: 300.0,
                  height: 190.0,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                            top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                        //email Text Field
                        child: TextFormField(
                          validator: (text){
                            if(text.isEmpty){
                              return 'This Field is mandatory';
                            }else{
                              return null;
                            }
                          },
                          autovalidate: autovalidate,
                          focusNode: myFocusNodeEmailLogin,
                          controller: loginEmailController,
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(
                              fontFamily: "WorkSansSemiBold",
                              fontSize: 16.0,
                              color: Colors.black),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(
                              FontAwesomeIcons.envelope,
                              color: Colors.black,
                              size: 22.0,
                            ),
                            hintText: "Email Address",
                            hintStyle: TextStyle(
                                fontFamily: "WorkSansSemiBold", fontSize: 17.0),
                          ),
                        ),
                      ),
                      Container(
                        width: 250.0,
                        height: 1.0,
                        color: Color(0xFFFFE082),
                      ),

                      //Password text field
                      Padding(
                        padding: EdgeInsets.only(
                            top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                        child: TextFormField(
                          validator: (text){
                            if(text.isEmpty){
                              return 'This Field is mandatory';
                            }else{
                              return null;
                            }
                          },
                          autovalidate: autovalidate,
                          focusNode: myFocusNodePasswordLogin,
                          controller: loginPasswordController,
                          obscureText: _obscureTextLogin,
                          style: TextStyle(
                              fontFamily: "WorkSansSemiBold",
                              fontSize: 16.0,
                              color: Colors.black),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(
                              FontAwesomeIcons.lock,
                              size: 22.0,
                              color: Colors.black,
                            ),
                            hintText: "Password",
                            hintStyle: TextStyle(
                                fontFamily: "WorkSansSemiBold", fontSize: 17.0),
                            suffixIcon: GestureDetector(
                              onTap: _toggleLogin,
                              child: Icon(
                                _obscureTextLogin
                                    ? FontAwesomeIcons.eye
                                    : FontAwesomeIcons.eyeSlash,
                                size: 15.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 170.0),
                decoration: new BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Theme.Colors.loginGradientStart,
                      offset: Offset(1.0, 6.0),
                      blurRadius: 20.0,
                    ),
                    BoxShadow(
                      color: Theme.Colors.loginGradientEnd,
                      offset: Offset(1.0, 6.0),
                      blurRadius: 20.0,
                    ),
                  ],
                  gradient: new LinearGradient(
                      colors: [
                        Color(0xFF485563),
                        Color(0xFF29323C)
                      ],
                      begin: const FractionalOffset(0.2, 0.2),
                      end: const FractionalOffset(1.0, 1.0),
                      stops: [0.0,1.0],
                      tileMode: TileMode.clamp),
                ),
                child: MaterialButton(
                    highlightColor: Colors.transparent,
                    splashColor: Theme.Colors.loginGradientEnd,
                    //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 42.0),
                      child: Text(
                        "LOGIN",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 22.0,
                            fontFamily: "Lato"),
                      ),
                    ),
                    onPressed: () {
                      if(loginEmailController.text.isEmpty && loginPasswordController.text.isEmpty){
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            // return object of type Dialog
                            return AlertDialog(
                              title: new Text("Fill all the fields"),
                              content: new Text("PLease make sure all fields are filled."),
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
                      }else{
                        authentication = Authentication();
                              authentication.signIn(loginEmailController.text,
                                  loginPasswordController.text,
                                  student,
                                  context
                              );
                      }
                    }
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: FlatButton(
                onPressed: () {},
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(
                      color: Color(0xFFFB8C00),
                      fontSize: 18.0,
                      fontFamily: "WorkSansMedium"),
                )),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    gradient: new LinearGradient(
                        colors: [
                          Colors.white10,
                          Colors.white,
                        ],
                        begin: const FractionalOffset(0.0, 0.0),
                        end: const FractionalOffset(1.0, 1.0),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp),
                  ),
                  width: 100.0,
                  height: 1.0,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Text(
                    "Or",
                    style: TextStyle(
                        color: Color(0xFFFB8C00),
                        fontSize: 16.0,
                        fontFamily: "WorkSansMedium"),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: new LinearGradient(
                        colors: [
                          Colors.white,
                          Colors.white10,
                        ],
                        begin: const FractionalOffset(0.0, 0.0),
                        end: const FractionalOffset(1.0, 1.0),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp),
                  ),
                  width: 100.0,
                  height: 1.0,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 10.0, right: 40.0),
                child: GestureDetector(
                  onTap: () => showInSnackBar("Coming Soon"),
                  child: Container(
                    padding: const EdgeInsets.all(15.0),
                    decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: new Icon(
                      FontAwesomeIcons.facebookF,
                      color: Color(0xFFFFE082),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: GestureDetector(
                  onTap: () => showInSnackBar("Coming Soon"),
                  child: Container(
                    padding: const EdgeInsets.all(15.0),
                    decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: new Icon(
                      FontAwesomeIcons.google,
                        color: Color(0xFFFFE082)
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSignUp(BuildContext context) {

    String student = 'student';

    Authentication authentication;
    bool autovalidate=false;
    final key =GlobalKey<FormState>();

    return Container(
      padding: EdgeInsets.only(top: 23.0),
      child: SingleChildScrollView(
        child: Column(
//            alignment: Alignment.topCenter,
//            overflow: Overflow.visible,
        children: <Widget>[
          Card(
            elevation: 2.0,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Container(
              width: 300.0,
              height: 360.0,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                        top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),

                    //Sign up name
                    child: TextFormField(
                      validator: (text){
                      if(text.isEmpty){
                        return 'This Field is mandatory';
                      }else{
                        return null;
                      }
                    },
                      autovalidate: autovalidate,
                      focusNode: myFocusNodeName,
                      controller: signupNameController,
                      keyboardType: TextInputType.text,
                      textCapitalization: TextCapitalization.words,
                      style: TextStyle(
                          fontFamily: "WorkSansSemiBold",
                          fontSize: 16.0,
                          color: Colors.black),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(
                          FontAwesomeIcons.user,
                          color: Colors.black,
                        ),
                        hintText: "Name",
                        hintStyle: TextStyle(
                            fontFamily: "WorkSansSemiBold", fontSize: 16.0),
                      ),
                    ),
                  ),
                  Container(
                    width: 250.0,
                    height: 1.0,
                    color: Colors.grey[400],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),

                    //sign Up email
                    child: TextFormField(

                      validator: (text){
                        if(text.isEmpty){
                          return 'This field is mandetory';
                        }
                        else {
                          return null;
                        }
                      },
                      autovalidate: autovalidate,
                      focusNode: myFocusNodeEmail,
                      controller: signupEmailController,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(
                          fontFamily: "WorkSansSemiBold",
                          fontSize: 16.0,
                          color: Colors.black),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(
                          FontAwesomeIcons.envelope,
                          color: Colors.black,
                        ),
                        hintText: "Email Address",
                        hintStyle: TextStyle(
                            fontFamily: "WorkSansSemiBold", fontSize: 16.0),
                      ),
                    ),
                  ),
                  Container(
                    width: 250.0,
                    height: 1.0,
                    color: Colors.grey[400],
                  ),

                  //sign UP password
                  Padding(
                    padding: EdgeInsets.only(
                        top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                    child: TextFormField(
                      focusNode: myFocusNodePassword,
                      controller: signupPasswordController,
                      obscureText: _obscureTextSignup,
                      validator: (text){
                        if(text.isEmpty){
                          return 'This field is mandetory';
                        }else if(text.length<8){
                          return 'Please enter atleast 8 characters';
                        }
                        else{
                          return null;
                        }
                      },
                      autovalidate: autovalidate,
                      style: TextStyle(
                          fontFamily: "WorkSansSemiBold",
                          fontSize: 16.0,
                          color: Colors.black),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(
                          FontAwesomeIcons.lock,
                          color: Colors.black,
                        ),
                        hintText: "Password",
                        hintStyle: TextStyle(
                            fontFamily: "WorkSansSemiBold", fontSize: 16.0),
                        suffixIcon: GestureDetector(
                          onTap: _toggleSignup,
                          child: Icon(
                            _obscureTextSignup
                                ? FontAwesomeIcons.eye
                                : FontAwesomeIcons.eyeSlash,
                            size: 15.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 250.0,
                    height: 1.0,
                    color: Colors.grey[400],
                  ),

                  //confirm password field
                  Padding(
                    padding: EdgeInsets.only(
                        top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                    child: TextFormField(
                      validator: (text){
                        if(text.isEmpty){
                          return 'This field is madetory';
                        }else if(text!=signupPasswordController.text){
                          return 'Passwords doesn\'t match';
                        }else{
                          return null;
                        }
                      },
                      controller: signupConfirmPasswordController,
                      obscureText: _obscureTextSignupConfirm,
                      style: TextStyle(
                          fontFamily: "WorkSansSemiBold",
                          fontSize: 16.0,
                          color: Colors.black),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(
                          FontAwesomeIcons.lock,
                          color: Colors.black,
                        ),
                        hintText: "Confirmation",
                        hintStyle: TextStyle(
                            fontFamily: "WorkSansSemiBold", fontSize: 16.0),
                        suffixIcon: GestureDetector(
                          onTap: _toggleSignupConfirm,
                          child: Icon(
                            _obscureTextSignupConfirm
                                ? FontAwesomeIcons.eye
                                : FontAwesomeIcons.eyeSlash,
                            size: 15.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          GestureDetector(
            child: Container(
              width: 200.0,
              height: 40.0,
              decoration: BoxDecoration(
                color: appOrange,
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              child: Center(child:
              Text('Sign Up',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
              ),
              ),
              ),
            ),
            onTap: (){


              if(signupEmailController.text.isNotEmpty && signupPasswordController.text.isNotEmpty
                && signupConfirmPasswordController.text.isNotEmpty && signupNameController.text.isNotEmpty
              )
                {
                  authentication = Authentication();
                  authentication.signUp(signupEmailController.text,
                      signupPasswordController.text,
                      signupNameController.text,
                      student,
                      context
                  );
                }else{
                return AlertDialog(
                  title: new Text("Fill all the fields"),
                  content: new Text("PLease make sure all fields are filled."),
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
              }
                  //Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home() ),);

            },
          ),
          SizedBox(
            height: 30.0,
          ),
          Container(
            margin: EdgeInsets.only(top: 340.0),
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Theme.Colors.loginGradientStart,
                  offset: Offset(1.0, 6.0),
                  blurRadius: 20.0,
                ),
                BoxShadow(
                  color: Theme.Colors.loginGradientEnd,
                  offset: Offset(1.0, 6.0),
                  blurRadius: 20.0,
                ),
              ],
              gradient: new LinearGradient(
                  colors: [
                    Color(0xFF485563),
                    Color(0xFF29323C)
                  ],
                  begin: const FractionalOffset(0.2, 0.2),
                  end: const FractionalOffset(1.0, 1.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
            child: MaterialButton(
                highlightColor: Colors.transparent,
                splashColor: Theme.Colors.loginGradientEnd,
                //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 42.0),
                  child: Text(
                    "SIGN UP",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22.0,
                        fontFamily: "Lato"),
                  ),
                ),
                onPressed: ()
                {
                }
          ),
          ),
        ],
    ),
      ),
    );
  }

  void _onSignInButtonPress() {
    _pageController.animateToPage(0,
        duration: Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  void _onSignUpButtonPress() {
    _pageController?.animateToPage(1,
        duration: Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  void _toggleLogin() {
    setState(() {
      _obscureTextLogin = !_obscureTextLogin;
    });
  }

  void _toggleSignup() {
    setState(() {
      _obscureTextSignup = !_obscureTextSignup;
    });
  }

  void _toggleSignupConfirm() {
    setState(() {
      _obscureTextSignupConfirm = !_obscureTextSignupConfirm;
    });
  }
}