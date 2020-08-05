import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WishList extends StatefulWidget {
  @override
  _WishListState createState() => _WishListState();
}

class _WishListState extends State<WishList> {
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
          IconButton(icon: Icon(Icons.add_shopping_cart), onPressed: () {}),
        ],
      ),
     // body: CartItems(),
    );
  }
}


// Container(
//         margin: EdgeInsets.all(20),
//         width: MediaQuery.of(context).size.width - 20.0,
//         height: 150,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             SizedBox(child: Image.asset('images/mobile.jpg')),
//             Container(
//               padding: EdgeInsets.all(10),
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text('Product name ',
//                     style: TextStyle(
//                       fontSize: 17,
//                     )),
//                 Container(padding: EdgeInsets.all(5)),
//                 Text('\$Price\$',
//                     style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold))
//               ],
//             ),
//             Container(padding: EdgeInsets.all(20)),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 IconButton(
//                   icon: Icon(
//                     LineIcons.minus,
//                     color: Colors.black,
//                     size: 24.0,
//                     semanticLabel: 'Text to announce in accessibility modes',
//                   ),
//                   onPressed: () {},
//                 ),
//                 Text('1', style: TextStyle(fontSize: 25)),
//                 IconButton(
//                   icon: Icon(
//                     LineIcons.plus,
//                     color: Colors.black,
//                     size: 24.0,
//                     semanticLabel: 'Text to announce in accessibility modes',
//                   ),
//                   onPressed: () {},
//                 )
//               ],
//             ),
//             Container(padding: EdgeInsets.all(10)),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 IconButton(
//                   icon: Icon(LineIcons.trash_o),
//                   onPressed: () {},
//                 )
//               ],
//             ),
//           ],
//         ),
//       ),
