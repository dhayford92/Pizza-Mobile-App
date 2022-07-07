import '../products/prodModel.dart';

class CartItem {
  int? id;
  int? quantity;
  double? total;
  Product? product;

  CartItem({this.id, this.quantity, this.total, this.product});

  CartItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    total = json['total'];
    product =
        json['product'] != null ? Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['quantity'] = quantity;
    data['total'] = total;
    if (product != null) {
      data['product'] = product!.toJson();
    }
    return data;
  }
}

List<CartItem> cartlist = [];
