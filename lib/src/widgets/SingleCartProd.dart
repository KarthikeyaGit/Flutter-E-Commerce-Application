import "package:flutter/material.dart";
import 'package:line_icons/line_icons.dart';


class SingleCartProd extends StatefulWidget {
  final String prodName;
  final String prodPricture;
  final dynamic prodOldPrice;
  final dynamic prodPrice;

  const SingleCartProd({
    this.prodName,
    this.prodPricture,
    this.prodOldPrice,
    this.prodPrice,
  });
  @override
  _SingleCartProdState createState() => _SingleCartProdState();
}

class _SingleCartProdState extends State<SingleCartProd> {
  @override
  Widget build(BuildContext context) {
    return  Card(
    child: InkWell(
      splashColor: Colors.black.withAlpha(30),
      onTap: () {
        print('Card tapped.');
      },
      child: Container(
        margin: EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width - 20.0,
        height: 150,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(child: Image(image:  AssetImage(widget.prodPricture))),
            Container(
              padding: EdgeInsets.all(10),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.prodName,
                    style: TextStyle(
                      fontSize: 17,
                    )),
                Container(padding: EdgeInsets.all(5)),
                Text('\${widget.prodPrice}\$',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold))
              ],
            ),
            Container(padding: EdgeInsets.all(20)),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(
                    LineIcons.minus,
                    color: Colors.black,
                    size: 24.0,
                    semanticLabel: 'Text to announce in accessibility modes',
                  ),
                  onPressed: () {},
                ),
                Text('1', style: TextStyle(fontSize: 25)),
                IconButton(
                  icon: Icon(
                    LineIcons.plus,
                    color: Colors.black,
                    size: 24.0,
                    semanticLabel: 'Text to announce in accessibility modes',
                  ),
                  onPressed: () {},
                )
              ],
            ),
            Container(padding: EdgeInsets.all(10)),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(LineIcons.trash_o),
                  onPressed: () {},
                )
              ],
            ),
          ],
        ),
      ),
    ),
  );
  }
}