// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:showp_owner_app/helpers/const.dart';

class NewOrderCard extends StatelessWidget {
  const NewOrderCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 250,
        padding: padding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                text("Buyer", 16, Colors.black),
                Spacer(),
                text("Cristofer Korsgaard", 16, Colors.black),
              ],
            ),
            Row(
              children: <Widget>[
                text("Delivery partner", 16, Colors.black),
                Spacer(),
                text("Kadin Herwitz", 16, Colors.black),
              ],
            ),
            Row(
              children: <Widget>[
                text("Time left", 16, Colors.black),
                Spacer(),
                text("10 min", 16, Colors.black),
              ],
            ),
            Row(
              children: <Widget>[
                text("Price", 16, Colors.black),
                Spacer(),
                text("100 INR", 16, Colors.black),
              ],
            ),
            Row(
              children: <Widget>[
                text("Items", 16, Colors.black),
                Spacer(),
                Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(50)),
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.resolveWith(
                                (states) =>
                                    states.contains(MaterialState.pressed)
                                        ? appBarColor
                                        : Colors.deepPurple)),
                        onPressed: () {},
                        child: Text("View items")))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Spacer(),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith(
                            (states) => states.contains(MaterialState.pressed)
                                ? appBarColor
                                : Color(0xff27DC39))),
                    onPressed: () {},
                    child: Text("Accept")),
                Spacer(),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith(
                            (states) => states.contains(MaterialState.pressed)
                                ? appBarColor
                                : Color(0xffDC3227))),
                    onPressed: () {},
                    child: Text("Decline"))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
