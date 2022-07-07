import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:restuarant_app/components.dart';
import 'package:restuarant_app/pages/homepage.dart';

import '../widgets/buttons.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.backgroundColour,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          end: Alignment.bottomLeft,
                          begin: Alignment.topRight,
                          colors: [
                    Colors.black.withOpacity(0.2),
                    Colors.white.withOpacity(0.1)
                  ]))),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/bg.jpg'),
                      fit: BoxFit.cover)),
            ),
            Padding(
              padding: EdgeInsets.all(defaultPadding * 1.5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: defaultPadding),
                  //image
                  SizedBox(
                    height: 400,
                    child: Lottie.asset('assets/jsons/intor.json'),
                  ),
                  const SizedBox(height: 10),
                  //title
                  Text(
                    'Welcome Here',
                    softWrap: true,
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColours.primaryColour),
                  ),
                  const SizedBox(height: 10),
                  //description
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor\nincididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam',
                    softWrap: true,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: Colors.white),
                  ),
                  SizedBox(height: defaultPadding * 3),
                  //button
                  SizedBox(
                    height: 60,
                    child: CustomButton(
                      title: 'Enjoy Now',
                      onClick: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (_) => const HomePage()));
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
