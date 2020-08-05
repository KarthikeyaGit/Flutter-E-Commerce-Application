import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

var baseUrl = DotEnv().env['Base_URL'];
Future<String> createUser(
    int id, String username, String email, String password) async {
  final String apiUrl = baseUrl + "/submit";

  final response = await http.post(apiUrl,
      body: {"username": username, "email": email, "password": password});

  if (response.body == "success") {
    final String responseString = response.body;
    print(responseString);
    return responseString;
  } else {
    return null;
  }
}

class _SignupState extends State<Signup> {
  String userexist;
  String users;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Signup'),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(margin: EdgeInsets.all(20)),
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    labelText: "Username",
                    hintText: "Username",
                  ),
                  validator: (String value) {
                    if (value.length < 4) {
                      return 'username must be atleast 4 characters';
                    }
                    return null;
                  },
                ),
                Container(margin: EdgeInsets.all(10)),
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      icon: Icon(Icons.email),
                      labelText: 'Email Address*',
                      hintText: 'you@example.com'),
                  validator: (String value) {
                    if (!value.contains('@')) {
                      return 'Invalid email';
                    }
                    return null;
                  },
                ),
                Container(margin: EdgeInsets.all(10)),
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
                Container(margin: EdgeInsets.all(10)),
                RaisedButton(
                  onPressed: () async {
                    final int id = null;
                    final String username = nameController.text;
                    final String email = emailController.text;
                    final String password = passwordController.text;

                    if (_formKey.currentState.validate()) {
                      String user =
                          await createUser(id, username, email, password);
                      // print(user);

                      if (user == "success") {
                        print("accout created");
                        //          Navigator.push(
                        // context, MaterialPageRoute(builder: (context) => LoginScreen()));
                        setState(() {
                           Navigator.push(
                context, MaterialPageRoute(builder: (context) =>  Scaffold(
                            body: Container(
                            child: Center(
                              child:Text("success")),
                          )
                          )));
                          
                        });
                      } else {
                        print("userexist");
                      }
                      setState(() {
                        users = user;
                      });
                    }
                  },
                  child: Text('Signup'),
                ),
              ],
            )),
      ),
    );
  }
}
