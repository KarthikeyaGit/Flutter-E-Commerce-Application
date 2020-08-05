import 'package:Amazon/src/api/api.dart';
import 'package:Amazon/src/models/login_model.dart';
import 'package:Amazon/src/screens/home_screen.dart';
import 'package:Amazon/src/screens/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}


class _LoginScreenState extends State<LoginScreen> {
  Login users;
  SharedPreferences logindata;
  bool newuser;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    checklogin();
  }

  void checklogin() async {
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata.getBool('login') ?? true);
    print(newuser);
    if (newuser == false) {
      Navigator.pushReplacement(
          context, new MaterialPageRoute(builder: (context) => HomeScreen()));
    }
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              Container(padding: EdgeInsets.only(top: 200)),
              TextFormField(
                controller: nameController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    icon: Icon(Icons.email),
                    labelText: 'Email Address*',
                    hintText: 'you@example.com'),
                validator: (String value) {
                  if (value.length < 4) {
                    return 'Invalid email';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password*',
                  hintText: 'Password',
                  icon: Icon(Icons.lock),
                ),
                validator: (String value) {
                  if (value.length < 4) {
                    return 'password must be atleast 4 characters';
                  }
                  return null;
                },
              ),
              Container(margin: EdgeInsets.only(bottom: 20)),
              Container(
                child: FlatButton(
                  child: Text("Forgot your password"),
                  textColor: Colors.blue[600],
                  onPressed: () {},
                ),
              ),
              RaisedButton(
                  color: Colors.blue,
                  child: Text('Login'),
                  onPressed: () async {
                    String name = nameController.text;
                    String password = passwordController.text;

                    Login userdetails = await ud(name);

                    setState(() {
                      users = userdetails;
                    });

                    if (formKey.currentState.validate()) {
                      print(userdetails?.password);
                      // print(userdetails);
                      if (userdetails == null ||
                          userdetails.password != password) {
                        return _scaffoldKey.currentState.showSnackBar(SnackBar(
                          content:
                              Text('Either email or password is incorrect'),
                          duration: Duration(seconds: 3),
                        ));
                      } else if (userdetails.username == name &&
                          userdetails.password == password) {
                        logindata.setBool('login', false);

                        logindata.setString('username', name);
                        logindata.setString('password', password);
                        return Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
                      }
                    } else {
                      return "error";
                    }
                  }),
              Container(
                child: FlatButton(
                  child: Text("Don't have an account? Sign up"),
                  textColor: Colors.blue[600],
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Signup()),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
