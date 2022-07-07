// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:restuarant_app/components.dart';
import 'package:restuarant_app/pages/detailpage.dart';

import 'prodModel.dart';

class ProductCard extends StatefulWidget {
  Product product;
  ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //image
          SizedBox(
            height: 100,
            width: 100,
            child: Image(
                image: AssetImage('${widget.product.image}'),
                filterQuality: FilterQuality.high),
          ),
          //description
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppTextFormat.subheaderTitle('${widget.product.title}', context),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${widget.product.gk}gt',
                    style: TextStyle(
                        fontSize: 15,
                        letterSpacing: 1.0,
                        color: Colors.blueGrey[200]),
                  ),
                  const Icon(Icons.remove, color: Colors.black26, size: 15),
                  Text(
                    '${widget.product.kal}kal',
                    style: TextStyle(
                        fontSize: 15,
                        letterSpacing: 1.0,
                        color: Colors.blueGrey[200]),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.timelapse_outlined,
                        color: Colors.black54, size: 15),
                    const Icon(Icons.remove, color: Colors.black54, size: 15),
                    Text(
                      '${widget.product.time} mins',
                      style: const TextStyle(
                          fontSize: 13,
                          letterSpacing: 1.0,
                          color: Colors.black54),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.blueGrey[200],
                  borderRadius: BorderRadius.circular(30),
                ),
              )
            ],
          ),
          //price and view button
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppTextFormat.productTitle('₵${widget.product.price}', context),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (_) =>
                            ProductDetailPage(product: widget.product)),
                  );
                },
                child: SizedBox(
                  height: 40,
                  width: 10,
                  child:
                      Center(child: AppTextFormat.subheaderTitle('+', context)),
                ),
                style: ButtonStyle(
                  overlayColor:
                      MaterialStateProperty.all(AppColours.primaryColour),
                  side: MaterialStateProperty.all(
                      const BorderSide(color: Colors.black)),
                  elevation: MaterialStateProperty.all(0),
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(defaultPadding),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
