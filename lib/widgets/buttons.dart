// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:restuarant_app/components.dart';
import 'package:restuarant_app/pages/cartpage.dart';

class CustomButton extends StatefulWidget {
  final String title;
  VoidCallback onClick;
  CustomButton({Key? key, required this.title, required this.onClick})
      : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onClick,
      child: Padding(
        padding: EdgeInsets.all(defaultPadding),
        child: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
      ),
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(8),
        backgroundColor: MaterialStateProperty.all(AppColours.primaryColour),
        shadowColor: MaterialStateProperty.all(AppColours.primaryColour),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(defaultPadding),
          ),
        ),
      ),
    );
  }
}

/*

  home button

*/
class HomeCartButton extends StatefulWidget {
  const HomeCartButton({Key? key}) : super(key: key);

  @override
  State<HomeCartButton> createState() => _HomeCartButtonState();
}

class _HomeCartButtonState extends State<HomeCartButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => const CartPage(),
            ),
          );
        },
        child: SizedBox(
          height: 70,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.shopping_bag_outlined, size: 30),
                Text(
                  '2  Items',
                  style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 1.5,
                      color: Colors.blueGrey[100]),
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  child: AppTextFormat.productTitle('C54.0', context),
                  decoration: BoxDecoration(
                      color: AppColours.primaryColour,
                      borderRadius: BorderRadius.circular(defaultPadding * 4)),
                )
              ],
            ),
          ),
        ),
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(8),
          backgroundColor: MaterialStateProperty.all(Colors.black),
          shadowColor: MaterialStateProperty.all(AppColours.primaryColour),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(defaultPadding * 3),
            ),
          ),
        ),
      ),
    );
  }
}

/*

  quantity

*/
class QuantityCardButton extends StatefulWidget {
  int value;
  QuantityCardButton({Key? key, required this.value}) : super(key: key);

  @override
  State<QuantityCardButton> createState() => _QuantityCardButtonState();
}

class _QuantityCardButtonState extends State<QuantityCardButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2.0),
      width: 200,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                widget.value++;
              });
            },
            icon: const Icon(Icons.add, size: 30),
          ),
          AppTextFormat.productTitle(widget.value.toString(), context),
          IconButton(
            onPressed: () {
              setState(() {
                if (widget.value > 1) {
                  widget.value--;
                }
              });
            },
            icon: const Icon(
              Icons.remove,
              size: 30,
            ),
          )
        ],
      ),
    );
  }
}

/*

  order button

*/
class OrderButton extends StatefulWidget {
  const OrderButton({Key? key}) : super(key: key);

  @override
  State<OrderButton> createState() => _OrderButtonState();
}

class _OrderButtonState extends State<OrderButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: ElevatedButton(
        onPressed: () {
        },
        child: SizedBox(
          height: 70,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.credit_card, size: 30, color: Colors.white),
                Text(
                  'Pay',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.6),
                )
              ],
            ),
          ),
        ),
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(8),
          backgroundColor: MaterialStateProperty.all(Colors.black),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(defaultPadding),
            ),
          ),
        ),
      ),
    );
  }
}
