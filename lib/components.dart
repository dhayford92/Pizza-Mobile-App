import 'package:flutter/material.dart';

double defaultPadding = 10.0;

class AppColours {
  static Color backgroundColour = const Color(0xffFBEEEE);
  static Color primaryColour = const Color(0xffDA5552);
}

class AppTextFormat {
  static headerTitle(String title, BuildContext context) => Text(
        title,
        style: Theme.of(context)
            .textTheme
            .headline5!
            .copyWith(fontWeight: FontWeight.bold),
      );

  static subheaderTitle(String title, BuildContext context) => Text(
        title,
        style: Theme.of(context)
            .textTheme
            .headline6!
            .copyWith(fontWeight: FontWeight.bold),
      );

  static productTitle(String title, BuildContext context) => Text(
        title,
        style: Theme.of(context)
            .textTheme
            .bodyText1!
            .copyWith(fontWeight: FontWeight.bold),
      );

  static categoryTitle(String title, BuildContext context) => Text(
        title,
        style: Theme.of(context)
            .textTheme
            .bodyText1!
            .copyWith(fontWeight: FontWeight.bold),
      );
}
