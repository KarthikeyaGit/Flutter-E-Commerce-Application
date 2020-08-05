import 'package:Amazon/src/api/api.dart';
import 'package:Amazon/src/models/product.dart';
import 'package:Amazon/src/widgets/SingleProduct.dart';
import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  final String username;

  Products(this.username);

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  

  //Future<List> productList = fetchProducts();

  @override
  Widget build(BuildContext context) {
   // print(widget.username);
    return FutureBuilder(
        future: fetchProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                controller: ScrollController(),
                shrinkWrap: true,
                itemCount: snapshot.data.length == null ? 0 : 6,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.width * 1.18),
                ),
                itemBuilder: (BuildContext context, int index) {
                  ProductsData product = snapshot.data[index];
                  return SingleProd(
                    uname: widget.username,
                    prodName: product.name,
                    prodPricture: product.picture,
                    prodPrice: product.price,
                    prodOldPrice: product.oldprice,
                  );
                });
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
