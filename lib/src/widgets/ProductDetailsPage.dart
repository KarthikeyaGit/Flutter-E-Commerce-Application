// import 'dart:convert';
import 'package:Amazon/src/api/api.dart';
import 'package:Amazon/src/models/cart_model.dart';
import 'package:Amazon/src/models/login_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class ProdDetailsPage extends StatefulWidget {
  final String username;
  final String productDetailName;
  final dynamic productDetailNewPrice;
  final dynamic productDetailOldPrice;
  final String productDetailPicture;

  ProdDetailsPage(
      {this.productDetailName,
      this.productDetailNewPrice,
      this.productDetailOldPrice,
      this.productDetailPicture,
      this.username});

  @override
  _ProdDetailsPageState createState() => _ProdDetailsPageState();
}

var baseUrl = DotEnv().env['Base_URL'];
Future<dynamic> cartCheck(String userid, String prodname) async {
  final String apiUrl = baseUrl + '/cartcheck/$userid/$prodname';
  final response = await http.get(apiUrl);

  if (response.statusCode == 200) {
    // print(response.body);
    return response.body;
  } else {
    return null;
  }
}

Future<CartData> cartData(int id, String userid, String prodname,
    String prodprice, String prodimage) async {
  final String apiUrl = baseUrl + '/postcart';

  final response = await http.post(apiUrl, body: {
    "userid": userid,
    "prodname": prodname,
    "prodprice": prodprice,
    "prodimage": prodimage
  });

  if (response.statusCode == 201) {
    print(response.body);

    return cartDataFromJson(response.body);
  } else {
    return null;
  }
}

class _ProdDetailsPageState extends State<ProdDetailsPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  CartData carts;
  String ccs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Product Details',
          style: GoogleFonts.lato(
            textStyle: TextStyle(color: Colors.black, letterSpacing: 0.5),
          ),
        ),
        iconTheme: new IconThemeData(color: Colors.black),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(icon: Icon(Icons.add_shopping_cart), onPressed: () {}),
        ],
      ),
      body: ListView(
        children: [
          Container(
            height: 570,
            child: GridTile(
              child: Container(
                child: Image.asset(widget.productDetailPicture),
              ),
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Divider(color: Colors.white),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    widget.productDetailName,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                        child: Text(
                          '\$${widget.productDetailNewPrice.toString()}',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                        child: Text(
                          '\$${widget.productDetailOldPrice.toString()}',
                          style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                        child: Text(
                          'including of all taxes',
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.teal,
                              fontSize: 17),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: MaterialButton(
                        onPressed: () {},
                        color: Colors.white,
                        textColor: Colors.black,
                        elevation: 0.2,
                        child: Row(
                          children: [
                            Expanded(
                              child: Text('  Size'),
                            ),
                            Expanded(
                              child: Icon(Icons.arrow_drop_down),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Divider(),
                    Expanded(
                      child: MaterialButton(
                        onPressed: () {},
                        color: Colors.white,
                        textColor: Colors.black,
                        elevation: 0.2,
                        child: Row(
                          children: [
                            Expanded(
                              child: Text('Color'),
                            ),
                            Expanded(
                              child: Icon(Icons.arrow_drop_down),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Divider(),
                    Expanded(
                      child: MaterialButton(
                        onPressed: () {},
                        color: Colors.white,
                        textColor: Colors.black,
                        elevation: 0.2,
                        child: Row(
                          children: [
                            Expanded(
                              child: Text('Qty'),
                            ),
                            Expanded(
                              child: Icon(Icons.arrow_drop_down),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                //addtocart
                Row(
                  children: [
                    Expanded(
                      child: MaterialButton(
                        onPressed: () async {
                          Login userdetails = await ud(widget.username);

                          final int id = null;
                          final int userid = userdetails.id;
                          final String prodname = widget.productDetailName;
                          final int prodprice = widget.productDetailNewPrice;
                          final String prodimage = widget.productDetailPicture;
                          print(userid);
                          dynamic cc =
                              await cartCheck(userid.toString(), prodname);

                          if (cc == "0") {
                            CartData cart = await cartData(
                                id,
                                userid.toString(),
                                prodname,
                                prodprice.toString(),
                                prodimage);
                            setState(() {
                              carts = cart;
                            });
                            print("post");
                          } else {
                            print("err");
                            _scaffoldKey.currentState
                                .showSnackBar(SnackBar(content: Text("err")));
                          }
                          setState(() {
                            ccs = cc;
                          });
                        },
                        color: Colors.white,
                        textColor: Colors.red,
                        elevation: 0.2,
                        height: 40,
                        child: Text('Add to Cart'),
                      ),
                    ),
                    Expanded(
                      child: MaterialButton(
                        onPressed: () {},
                        color: Colors.red,
                        textColor: Colors.white,
                        elevation: 0.2,
                        height: 40,
                        child: Text('Buy now'),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
