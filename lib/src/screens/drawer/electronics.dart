import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Electronics extends StatefulWidget {
  @override
  _ElectronicsState createState() => _ElectronicsState();
}

class _ElectronicsState extends State<Electronics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Electronics',
          style: GoogleFonts.lato(
            textStyle: TextStyle(color: Colors.black, letterSpacing: .5),
          ),
        ),
        iconTheme: new IconThemeData(color: Colors.black),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: ListView(
          children: <Widget>[
            ListTile(
              onTap: () {
                // Navigator.of(context)
                //       .push(MaterialPageRoute(builder: (context) => Mobile()));
              },
              title: Text('Mobiles'),
            ),
            Divider(height: 0, color: Colors.black,thickness:.2),
            ListTile(
              onTap: () {},
              title: Text('Laptops'),
            ),
            Divider(height: 0, color: Colors.black,thickness:.2),
            ListTile(
              onTap: () {},
              title: Text('TV'),
            ),
            Divider(height: 0, color: Colors.black,thickness:.2),
            ListTile(
              onTap: () {},
              title: Text('Item'),
            ),
            Divider(height: 0, color: Colors.black,thickness:.2),
          ],
        ),
      ),
    );
  }
}
