import 'package:flutter/material.dart';

class CartItems extends StatefulWidget {
  final String prodname;
  final String prodprice;
  final String prodimage;

  CartItems({Key key, this.prodname, this.prodprice, this.prodimage})
      : super(key: key);
  @override
  _CartItemsState createState() => _CartItemsState();
}



class _CartItemsState extends State<CartItems> {
  int x = 1;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(3),
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
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(child: Image.asset(widget.prodimage)),
                Container(
                  padding: EdgeInsets.all(10),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Brand',
                            style: TextStyle(
                              fontSize: 17,
                            )),
                        Text(widget.prodname,
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w300,
                            )),
                      ],
                    ),
                    Container(padding: EdgeInsets.all(5)),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(padding: EdgeInsets.all(5)),
                        Text('\₹${widget.prodprice}',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w500)),
                        Row(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                      icon: Icon(Icons.remove_circle),
                                      onPressed: () {
                                        if (x != 1) {
                                          setState(() {
                                            x = x - 1;
                                          });
                                        }
                                      }),
                                  Text("$x"),
                                  IconButton(
                                      icon: Icon(Icons.add_circle),
                                      onPressed: () {
                                        if (x >= 1 && x <= 3) {
                                          setState(() {
                                            x = x + 1;
                                          });
                                        }
                                      }),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                      icon: Icon(Icons.delete),
                                      onPressed: () {}),
                                ],
                              ),
                            ]),
                      ],
                    ),
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}
