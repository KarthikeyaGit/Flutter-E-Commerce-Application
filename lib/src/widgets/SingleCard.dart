import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class SingleCard extends StatefulWidget {
  final String cardName;
  final String cardPricture;
  final dynamic cardOldPrice;
  final dynamic cardPrice;

  SingleCard(
      {this.cardName, this.cardPricture, this.cardOldPrice, this.cardPrice});

  @override
  _SingleCardState createState() => _SingleCardState();
}

class _SingleCardState extends State<SingleCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: GridTile(
        child: ListTile(
          leading: Text(
            widget.cardName,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
          ),
          title: Text(
            "\$${widget.cardPrice}",
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.w800,),
          ),
          subtitle: Text(
            "\$${widget.cardOldPrice}",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w800,
                fontStyle: FontStyle.italic,
                decoration: TextDecoration.lineThrough),
          ),
          trailing: IconButton(
              icon: Icon(LineIcons.heart_o),
              onPressed: () {
                setState(() {});
              }),
        ),
      ),
    );
  }
}
