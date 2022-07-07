import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:restuarant_app/components.dart';
import 'package:restuarant_app/widgets/buttons.dart';

import '../orders/cartModel.dart';
import '../orders/cartitemCard.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int person = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.backgroundColour,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: EdgeInsets.all(defaultPadding),
            child: Card(
              elevation: 8.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              child: SizedBox(
                height: 40,
                width: 30,
                //padding: EdgeInsets.all(defaultPadding),
                child: Center(
                  child:
                      AppTextFormat.productTitle('${cartlist.length}', context),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AppTextFormat.headerTitle('My Order', context),
            ),
            SizedBox(height: defaultPadding),
            Expanded(
              flex: 3,
              child: cartlist.isEmpty
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 200,
                          child: Lottie.asset('assets/jsons/empty.json'),
                        ),
                        SizedBox(height: defaultPadding),
                        const Text(
                          'No Item Added Yet',
                          style: TextStyle(
                              fontSize: 15,
                              letterSpacing: 1.0,
                              color: Colors.blueGrey),
                        ),
                      ],
                    )
                  : ListView.builder(
                      itemCount: cartlist.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: CartItemCard(
                          cartItem: cartlist[index],
                          value: index,
                        ),
                      ),
                    ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.all(defaultPadding * 2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(defaultPadding * 2),
                    topRight: Radius.circular(defaultPadding * 2),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppTextFormat.subheaderTitle('Total', context),
                        AppTextFormat.subheaderTitle('₵24.96', context),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppTextFormat.productTitle('Persons', context),
                        QuantityCardButton(value: person)
                      ],
                    ),
                    const OrderButton()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
