
import 'package:Amazon/src/models/cartget_model.dart';
import 'package:Amazon/src/widgets/Cartitems.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:http/http.dart' as http;

class Cart extends StatefulWidget {
  final int id;

  const Cart({Key key, this.id}) : super(key: key);
  @override
  _CartState createState() => _CartState();
}

var baseUrl = DotEnv().env['Base_URL'];
Future<List<CartData>> fetchCartProducts(int id) async {
  String url = baseUrl + "/cart/$id";

  final response =
      await http.get(url, headers: {"Content-Type": "application/json"});
  final jsonresponse = response.body;
  if (response.statusCode == 200) {
    return cartDataFromJson(jsonresponse);
  } else {
    throw Exception('Failed to load album');
  }
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Cart',
          style: GoogleFonts.lato(
            textStyle: TextStyle(color: Colors.black, letterSpacing: .5),
          ),
        ),
        iconTheme: new IconThemeData(color: Colors.black),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(icon: Icon(LineIcons.heart_o), onPressed: () {}),
        ],
      ),
      body: FutureBuilder(
          //  print(widget.id),
          future: fetchCartProducts(widget.id),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(8),
                  itemCount:
                      snapshot.data.length == null ? 0 : snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    CartData product = snapshot.data[index];
                    return CartItems(
                      prodname: product.prodname,
                      prodprice: product.prodprice,
                      prodimage: product.prodimage,
                    );
                  });
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}

// Container(
//         child: Card(
//           child: InkWell(
//             splashColor: Colors.blueGrey,
//             onTap: () {},
//             child: Container(
//               height: MediaQuery.of(context).size.width * 0.85,
//               width: MediaQuery.of(context).size.width * 0.5,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Image(
//                     image: AssetImage('images/tshirt.jpg'),
//                     fit: BoxFit.fill,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: <Widget>[
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Container(
//                             padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
//                             child: Text('Brand',
//                                 style: TextStyle(
//                                     fontSize: 14,
//                                     fontStyle: FontStyle.normal,
//                                     fontWeight: FontWeight.w500)),
//                           ),
//                           Container(
//                             padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
//                             child: Text(
//                               'Productname',
//                               style: TextStyle(
//                                 fontWeight: FontWeight.w200,
//                                 fontSize: 12,
//                               ),
//                             ),
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               Container(
//                                 padding: EdgeInsets.fromLTRB(10, 0, 5, 5),
//                                 child: Text(
//                                   '₹1500',
//                                   style: TextStyle(fontWeight: FontWeight.bold),
//                                 ),
//                               ),
//                               Container(
//                                 padding: EdgeInsets.fromLTRB(5, 0, 5, 5),
//                                 child: Text(
//                                   "₹1900",
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.w300,
//                                       decoration: TextDecoration.lineThrough),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           Container(
//                             child: IconButton(
//                               icon: Icon(Icons.bookmark_border),
//                               onPressed: () {},
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           elevation: 15,
//         ),
//       )
// ListView.builder(
//                   physics: NeverScrollableScrollPhysics(),
//                   scrollDirection: Axis.vertical,
//                   controller: ScrollController(),
//                   shrinkWrap: true,
//                   itemCount: snapshot.data.length == null ? 0 : snapshot.data.length,

//                   itemBuilder: (BuildContext context, int index) {
