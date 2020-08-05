import 'package:Amazon/src/widgets/ProductDetailsPage.dart';
import 'package:flutter/material.dart';

class SingleProd extends StatefulWidget {
  final String uname;
  final String prodName;
  final String prodPricture;
  final dynamic prodOldPrice;
  final dynamic prodPrice;

  const SingleProd({
    this.uname,
    this.prodName,
    this.prodPricture,
    this.prodOldPrice,
    this.prodPrice,
  });

  @override
  _SingleProdState createState() => _SingleProdState();
}

class _SingleProdState extends State<SingleProd> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 15,
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProdDetailsPage(
                        username: widget.uname,
                        productDetailName: widget.prodName,
                        productDetailNewPrice: widget.prodPrice,
                        productDetailOldPrice: widget.prodOldPrice,
                        productDetailPicture: widget.prodPricture,
                      )));
        },
        child: Container(
          height: MediaQuery.of(context).size.width * 0.85,
          width: MediaQuery.of(context).size.width * 0.5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Image(
                  image: AssetImage(widget.prodPricture),
                  fit: BoxFit.fill,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                        child: Text('Brand',
                            style: TextStyle(
                                fontSize: 14,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500)),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Text(
                          widget.prodName,
                          style: TextStyle(
                            fontWeight: FontWeight.w200,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(10, 0, 5, 5),
                            child: Text(
                              "\₹${widget.prodPrice}",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(5, 0, 5, 5),
                            child: Text(
                              "\₹${widget.prodOldPrice}",
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  decoration: TextDecoration.lineThrough),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        child: IconButton(
                          icon: Icon(Icons.bookmark_border),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//  GridTile(
//   footer: Container(
//     color: Colors.white,
//     child: ListTile(
//       leading: Text(
//         widget.prodName,
//         style: TextStyle(
//           fontWeight: FontWeight.bold,
//           fontStyle: FontStyle.italic,
//         ),
//       ),
//       title: Text(
//         "\$${widget.prodPrice}",
//         style:
//             TextStyle(color: Colors.red, fontWeight: FontWeight.w800),
//       ),
//       subtitle: Text(
//         "\$${widget.prodOldPrice}",
//         style: TextStyle(
//             color: Colors.black,
//             fontWeight: FontWeight.w800,
//             fontStyle: FontStyle.italic,
//             decoration: TextDecoration.lineThrough),
//       ),
//       trailing: IconButton(
//           icon: Icon(LineIcons.heart_o),
//           onPressed: () {
//             setState(() {});
//           }),
//     ),
//   ),
//   child: Image(
//     image: AssetImage(widget.prodPricture),
//     fit: BoxFit.fill,
//   ),
// )
