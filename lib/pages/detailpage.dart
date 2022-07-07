// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:restuarant_app/components.dart';
import 'package:restuarant_app/widgets/buttons.dart';

import '../orders/cartModel.dart';
import '../products/prodModel.dart';

class ProductDetailPage extends StatefulWidget {
  Product product;
  ProductDetailPage({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  bool isActive = false;
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.backgroundColour,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: () {
                  setState(() {
                    if (isActive == true) {
                      isActive = false;
                    } else {
                      isActive = true;
                    }
                  });
                },
                icon: isActive
                    ? Icon(Icons.favorite,
                        color: AppColours.primaryColour, size: 30)
                    : Icon(
                        Icons.favorite_outline,
                        size: defaultPadding * 3,
                      )),
          )
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Column(
          children: [
            //image
            Center(
              child: Container(
                padding: EdgeInsets.all(defaultPadding),
                height: 300,
                child: Image(
                  image: AssetImage('${widget.product.image}'),
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: defaultPadding),
            //description
            Expanded(
              child: Container(
                padding: EdgeInsets.all(defaultPadding * 2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(defaultPadding * 3),
                    topRight: Radius.circular(defaultPadding * 3),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //title
                    AppTextFormat.headerTitle(
                        '${widget.product.title}', context),
                    //grad and kolo
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${widget.product.gk}gt',
                              style: TextStyle(
                                  fontSize: 17, color: Colors.blueGrey[400]),
                            ),
                            const Icon(Icons.remove,
                                color: Colors.black26, size: 15),
                            Text(
                              '${widget.product.kal}kal',
                              style: TextStyle(
                                  fontSize: 17, color: Colors.blueGrey[400]),
                            ),
                          ],
                        ),
                        //time
                        Container(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Icon(Icons.timelapse_outlined,
                                  color: Colors.black54, size: 17),
                              const Icon(Icons.remove,
                                  color: Colors.black54, size: 17),
                              Text(
                                '${widget.product.time} mins',
                                style: const TextStyle(
                                    fontSize: 15,
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
                    //quantity and price
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        QuantityCardButton(value: quantity),
                        //price
                        AppTextFormat.subheaderTitle(
                            '₵${widget.product.price}', context),
                      ],
                    ),
                    //addons
                    SizedBox(
                      height: 150,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.product.addons!.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Column(children: [
                              SizedBox(
                                height: defaultPadding * 9,
                                child: Image.asset(
                                  widget.product.addons![index].image
                                      .toString(),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: defaultPadding),
                              AppTextFormat.productTitle(
                                  '${widget.product.addons![index].title}',
                                  context)
                            ]),
                            decoration: BoxDecoration(
                              color: AppColours.backgroundColour,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                      child: CustomButton(
                        title: 'Add To Cart',
                        onClick: () {
                          setState(() {
                            cartlist.add(CartItem(
                                id: 0,
                                quantity: quantity,
                                product: widget.product,
                                total: widget.product.price! * quantity));
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
