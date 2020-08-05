import 'dart:convert';

List<Mobiles> mobilesFromJson(String str) => List<Mobiles>.from(json.decode(str).map((x) => Mobiles.fromJson(x)));

String mobilesToJson(List<Mobiles> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Mobiles {
    int id;
    String name;
    String picture;
    int price;
    int oldprice;

    Mobiles({
        this.id,
        this.name,
        this.picture,
        this.price,
        this.oldprice,
    });

    factory Mobiles.fromJson(Map<String, dynamic> json) => Mobiles(
        id: json["id"],
        name: json["name"],
        picture: json["picture"],
        price: json["price"],
        oldprice: json["oldprice"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "picture": picture,
        "price": price,
        "oldprice": oldprice,
    };
}