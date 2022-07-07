import 'package:flutter/material.dart';
import 'package:restuarant_app/components.dart';
import 'package:restuarant_app/orders/cartModel.dart';

class CartItemCard extends StatefulWidget {
  CartItem cartItem;
  int value;
  CartItemCard({Key? key, required this.cartItem, required this.value})
      : super(key: key);

  @override
  State<CartItemCard> createState() => _CartItemCardState();
}

class _CartItemCardState extends State<CartItemCard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //image
        SizedBox(
          height: 100,
          width: 100,
          child: Image(
              image: AssetImage('${widget.cartItem.product!.image}'),
              filterQuality: FilterQuality.high),
        ),
        AppTextFormat.subheaderTitle('${widget.cartItem.quantity}', context),
        AppTextFormat.subheaderTitle('X', context),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppTextFormat.subheaderTitle(
                '${widget.cartItem.product!.title}', context),
            AppTextFormat.subheaderTitle('₵${widget.cartItem.total}', context),
          ],
        ),
        IconButton(
          onPressed: () {
            setState(() {
              cartlist.remove(widget.value);
            });
          },
          icon: const Icon(Icons.delete_outline,
              size: 20, color: Colors.blueGrey),
        )
      ],
    );
  }
}
