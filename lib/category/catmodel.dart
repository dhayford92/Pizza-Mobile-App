class Category {
  int? id;
  String? title;
  String? image;

  Category({this.id, this.title, this.image});

  Category.fromJson(Map<String, dynamic> json) {
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

List<Category> catList = [
  Category(id: 0, title: "All", image: "assets/images/cat3.png"),
  Category(id: 0, title: "Pizza", image: "assets/images/cat1.png"),
  Category(id: 0, title: "Buger", image: "assets/images/cat2.png"),
  Category(id: 0, title: "Chips", image: "assets/images/cat4.png"),
  Category(id: 0, title: "Full", image: "assets/images/cat3.png"),
  Category(id: 0, title: "Chicken", image: "assets/images/cat2.png"),
  Category(id: 0, title: "Pizza", image: "assets/images/cat1.png"),
];
