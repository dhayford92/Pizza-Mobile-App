// ignore_for_file: file_names

import '../category/catmodel.dart';

class Product {
  int? id;
  String? title;
  String? image;
  double? price;
  String? kal;
  String? gk;
  String? time;
  List<Addons>? addons;
  List<Category>? category;

  Product({
    this.id,
    this.title,
    this.image,
    this.price,
    this.kal,
    this.gk,
    this.time,
    this.addons,
    this.category,
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    price = json['price'];
    kal = json['kal'];
    gk = json['gk'];
    time = json['time'];
    if (json['addons'] != null) {
      addons = <Addons>[];
      json['addons'].forEach((v) {
        addons!.add(Addons.fromJson(v));
      });
    }
    if (json['category'] != null) {
      category = <Category>[];
      json['category'].forEach((v) {
        category!.add(Category.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['image'] = image;
    data['price'] = price;
    data['kal'] = kal;
    data['gk'] = gk;
    data['time'] = time;
    if (addons != null) {
      data['addons'] = addons!.map((v) => v.toJson()).toList();
    }
    if (category != null) {
      data['category'] = category!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Addons {
  int? id;
  String? title;
  String? image;

  Addons({this.id, this.title, this.image});

  Addons.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['image'] = image;
    return data;
  }
}

List<Addons> addonList = [
  Addons(id: 0, title: "Cheese", image: "assets/images/addon1.png"),
  Addons(id: 1, title: "Meat", image: "assets/images/addon3.png"),
  Addons(id: 2, title: "Bacon", image: "assets/images/addon2.png"), 
  Addons(id: 3, title: "Cheese", image: "assets/images/addon1.png"),
];

List<Product> productList = [
  Product(
    id: 0,
    title: "Margherita",
    image: "assets/images/food1.png",
    price: 54.99,
    time: "25",
    kal: "3200",
    gk: "540",
    category: catList,
    addons: addonList,
  ),
  Product(
    id: 1,
    title: "4 Cheeses",
    image: "assets/images/food2.png",
    price: 25.99,
    time: "27",
    kal: "3000",
    gk: "500",
    category: catList,
    addons: addonList,
  ),
  Product(
    id: 3,
    title: "Napoletana",
    image: "assets/images/food3.png",
    price: 40.54,
    time: "27",
    kal: "3200",
    gk: "540",
    category: catList,
    addons: addonList,
  ),
  Product(
    id: 4,
    title: "Chicken Pizza",
    image: "assets/images/food1.png",
    price: 55.0,
    time: "27",
    kal: "3200",
    gk: "540",
    category: catList,
    addons: addonList,
  ),
  Product(
    id: 5,
    title: "Full Hamps",
    image: "assets/images/food1.png",
    price: 60.99,
    time: "27",
    kal: "3200",
    gk: "540",
    category: catList,
    addons: addonList,
  ),
  Product(
    id: 6,
    title: "Limp Cow",
    image: "assets/images/food2.png",
    price: 77.01,
    kal: "3200",
    gk: "540",
    category: catList,
    addons: addonList,
  ),
  Product(
    id: 7,
    title: "Margherita",
    image: "assets/images/food1.png",
    price: 54.99,
    time: "27",
    kal: "3200",
    gk: "540",
    category: catList,
    addons: addonList,
  ),
];
