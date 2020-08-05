
import 'package:Amazon/src/api/api.dart';
import 'package:Amazon/src/screens/cart/cart.dart';
import 'package:Amazon/src/widgets/SingleProduct.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:Amazon/src/screens/Categories/Laptops/laptopdata.dart';

class Laptop extends StatefulWidget {
  final String categorie;
  final String image;

  Laptop(this.categorie, this.image);
  @override
  _LaptopState createState() => _LaptopState();
}

class _LaptopState extends State<Laptop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Zamazon',
          style: GoogleFonts.lato(
            textStyle: TextStyle(color: Colors.black, letterSpacing: .5),
          ),
        ),
        iconTheme: new IconThemeData(color: Colors.black),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(icon: Icon(LineIcons.heart_o), onPressed: () {}),
          IconButton(
              icon: Icon(Icons.add_shopping_cart),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Cart()));
              }),
        ],
      ),
      body: FutureBuilder(
          future: fetchProdLaptop(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                  // physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  controller: ScrollController(),
                  shrinkWrap: true,
                  itemCount:
                      snapshot.data.length == null ? 0 : snapshot.data.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: MediaQuery.of(context).size.width /
                        (MediaQuery.of(context).size.width * 1.18),
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    Laptops product = snapshot.data[index];

                    return SingleProd(
                      prodName: product.name,
                      prodPricture: product.picture,
                      prodPrice: product.price,
                      prodOldPrice: product.oldprice,
                    );
                  });
            }
            return CircularProgressIndicator();
          }),
    );
  }
}
