import 'dart:convert';

CartData cartDataFromJson(String str) => CartData.fromJson(json.decode(str));

String cartDataToJson(CartData data) => json.encode(data.toJson());

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