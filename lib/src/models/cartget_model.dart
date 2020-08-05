import 'dart:convert';

List<CartData> cartDataFromJson(String str) => List<CartData>.from(json.decode(str).map((x) => CartData.fromJson(x)));

String cartDataToJson(List<CartData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CartData {
    CartData({
        this.id,
        this.userid,
        this.prodname,
        this.prodprice,
        this.prodimage,
    });

    int id;
    String userid;
    String prodname;
    String prodprice;
    String prodimage;

    factory CartData.fromJson(Map<String, dynamic> json) => CartData(
        id: json["id"],
        userid: json["userid"],
        prodname: json["prodname"],
        prodprice: json["prodprice"],
        prodimage: json["prodimage"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "userid": userid,
        "prodname": prodname,
        "prodprice": prodprice,
        "prodimage": prodimage,
    };
}
