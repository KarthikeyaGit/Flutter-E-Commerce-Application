import 'dart:convert';

List<ProductsData> productsFromJson(String str) => List<ProductsData>.from(
    json.decode(str).map((x) => ProductsData.fromJson(x)));

String productsToJson(List<ProductsData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductsData {
  int id;
  String name;
  String picture;
  int price;
  int oldprice;

  ProductsData({
    this.id,
    this.name,
    this.picture,
    this.price,
    this.oldprice,
  });

  factory ProductsData.fromJson(Map<String, dynamic> json) => ProductsData(
        id: json["id"],
        name: json["name"],
        picture: json["picture"],
        price: json["price"],
        oldprice: json["oldprice"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": picture,
        "price": price,
        "oldprice": oldprice,
      };
}
