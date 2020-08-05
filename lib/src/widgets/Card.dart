import 'package:Amazon/src/screens/Categories/Laptops/laptops.dart';
import 'package:Amazon/src/screens/Categories/Mobiles/mobile.dart';
import "package:flutter/material.dart";

class CCard extends StatelessWidget {
  final String categorie;
  final String image;

  detectcategoies(String categorie, BuildContext context) {
    switch (categorie) {
      case "Mobiles":
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => Mobile(categorie, image)));
        break;
      case "Men":
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => Mobile(categorie, image)));
        break;
      case "Laptops":
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => Laptop(categorie, image)));
        break;

      case "Furniture":
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => Mobile(categorie, image)));
        break;
      case "Toys":
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => Mobile(categorie, image)));
        break;
      default:
        break;
    }
  }

  CCard({this.categorie, this.image});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      child: Card(
        child: Material(
          child: InkWell(
            onTap: () {
              detectcategoies(categorie, context);
            },
            child: Wrap(
              children: <Widget>[Image.network(image)],
            ),
          ),
        ),
      ),
    );
  }
}
