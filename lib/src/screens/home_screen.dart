import 'package:Amazon/src/api/api.dart';
import 'package:Amazon/src/models/login_model.dart';
import 'package:Amazon/src/screens/cart/cart.dart';
import 'package:Amazon/src/screens/drawer/account.dart';
import 'package:Amazon/src/screens/login_screen.dart';
import 'package:Amazon/src/screens/wishlist.dart';
import 'package:Amazon/src/widgets/Card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../screens/drawer/electronics.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'hompageproducts/Products.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key key,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SharedPreferences logindata;
  String username;
  String password;

  @override
  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      username = logindata.getString('username');
      password = logindata.getString('password');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: appbar(context, username),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Text(
                  "Welcome $username",
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(color: Colors.black, fontSize: 24),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.account_box),
                title: Text('Account', style: GoogleFonts.lato()),
                onTap: () {
                  return Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Account()));
                },
              ),
              ListTile(
                leading: Icon(Icons.computer),
                title: Text('Electronics', style: GoogleFonts.lato()),
                onTap: () {
                  return Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Electronics()));
                },
              ),
              ListTile(
                leading: Icon(Icons.local_mall),
                title: Text('Fashion', style: GoogleFonts.lato()),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings', style: GoogleFonts.lato()),
                onTap: () {},
              ),
              ListTile(
                  leading: Icon(LineIcons.power_off),
                  title: Text('Logout', style: GoogleFonts.lato()),
                  onTap: () {
                    logindata.setBool('login', true);
                    Navigator.pushReplacement(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => LoginScreen()));
                  }),
            ],
          ),
        ),
        body: ListView(children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(15, 10, 10, 0),
            child: Text(
              'Categories',
              style: GoogleFonts.lato(
                textStyle: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
          ),
          horizontallist(context),
          Container(
            padding: EdgeInsets.fromLTRB(15, 10, 10, 0),
            child: Text(
              'Featured',
              style: GoogleFonts.lato(
                textStyle: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            height: MediaQuery.of(context).size.height,
            child: Products(username),
          ),
        ]),
      ),
    );
  }
}

Widget appbar(context, username) {
  return AppBar(
    backgroundColor: Colors.white,
    title: Text(
      'Amazon',
      style: GoogleFonts.lato(
        textStyle: TextStyle(color: Colors.black, letterSpacing: .5),
      ),
    ),
    iconTheme: new IconThemeData(color: Colors.black),
    actions: <Widget>[
      IconButton(icon: Icon(Icons.search), onPressed: () {}),
      IconButton(
          icon: Icon(LineIcons.heart_o),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => WishList()));
          }),
      IconButton(
          icon: Icon(Icons.add_shopping_cart),
          onPressed: () async {
            String name = username;
            Login userdetails = await ud(name);
            print(userdetails.id);
            int uid = userdetails.id;
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Cart(id: uid)));
          }),
    ],
  );
}

Widget horizontallist(context) {
  return Container(
    padding: EdgeInsets.only(left: 10),
    margin: EdgeInsets.symmetric(vertical: 10.0),
    height: 100,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        CCard(
            categorie: "Mobiles",
            image:
                "https://images-na.ssl-images-amazon.com/images/I/61-FZzBlpsL._AC_SX569_.jpg"),
        CCard(
            categorie: "Men",
            image:
                "https://i.pinimg.com/736x/ee/48/1a/ee481a40bcc0782c7b4a3d3f78bb3ab7.jpg"),
        CCard(
            categorie: "Laptops",
            image:
                "https://images.unsplash.com/photo-1550234618-d808f7356800?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"),
        CCard(
            categorie: "Furniture",
            image:
                "https://images.unsplash.com/photo-1523755231516-e43fd2e8dca5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"),
        CCard(
            categorie: "Toys",
            image:
                "https://images.unsplash.com/photo-1576718330722-c614ecb5d887?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"),
      ],
    ),
  );
}
