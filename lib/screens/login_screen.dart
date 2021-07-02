import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:clima/constants.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'loading_screen.dart';
import 'package:clima/components/rounded_button.dart';
import 'location_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String id = "login";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  final messageTextController = TextEditingController();
  String email,password;
  bool showSpinner=false;
  @override
  void initState() {
    super.initState();
    messageTextController.clear();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade900,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.emailAddress,
                cursorColor: Colors.blueGrey,
                onChanged: (value) {
                  email=value; },
                decoration: kInputDecoration.copyWith(hintText: "Enter your Email"),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                obscureText: true,
                onChanged: (value) {
                  password=value;
                },
                decoration: kInputDecoration.copyWith(hintText: "Enter your Password"),
              ),
              SizedBox(
                height: 24.0,
              ),
              button(Colors.lightBlueAccent,() async {
                setState(() {
                  showSpinner=true;
                });
                try {
                  final User = await _auth.signInWithEmailAndPassword(
                      email: email, password: password);
                  if(User!=null)
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoadingScreen(),
                        ),
                    );
                  setState(() {
                    showSpinner=false;
                  });
                }catch(e) {
                  print(e);
                }
              },
                  'Log In'),
            ],
          ),
        ),
      ),
    );
  }
}
