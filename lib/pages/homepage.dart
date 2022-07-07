// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:restuarant_app/components.dart';

import '../category/catmodel.dart';
import '../products/prodModel.dart';
import '../products/productCard.dart';
import '../widgets/buttons.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int current_index = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.backgroundColour,
      drawer: const Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: EdgeInsets.all(defaultPadding),
            child: const CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('assets/images/profile.png'),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppTextFormat.headerTitle('Food Delivery', context),
              SizedBox(height: defaultPadding),
              Text(
                'Word Gateway Apt. 908^',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              SizedBox(height: defaultPadding * 2),
              //category
              SizedBox(
                height: 110,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: catList.length,
                  itemBuilder: (context, index) => current_index == index
                      ? Padding(
                          padding: EdgeInsets.only(
                            top: defaultPadding,
                            bottom: defaultPadding,
                            left: defaultPadding / 3,
                          ),
                          child: Card(
                            child: catCard(index, context),
                            color: AppColours.backgroundColour,
                            elevation: 8.0,
                            shadowColor: AppColours.primaryColour,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(defaultPadding)),
                          ),
                        )
                      : catCard(index, context),
                ),
              ),

              SizedBox(height: defaultPadding * 2),
              //products
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(defaultPadding),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(defaultPadding * 2),
                      topRight: Radius.circular(defaultPadding * 2),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: productList.length,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ProductCard(product: productList[index]),
                          ),
                        ),
                      ),
                      const Align(
                          alignment: Alignment.bottomCenter,
                          child: HomeCartButton())
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  catCard(int index, BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          current_index = index;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        padding: EdgeInsets.all(defaultPadding / 2),
        decoration: BoxDecoration(
            // color: current_index == index
            //     ? Colors.white
            //     : AppColours.backgroundColour,
            borderRadius: BorderRadius.circular(defaultPadding)),
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: Image(
                image: AssetImage('${catList[index].image}'),
                filterQuality: FilterQuality.high,
              ),
            ),
            AppTextFormat.categoryTitle('${catList[index].title}', context)
          ],
        ),
      ),
    );
  }
}
