import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:showp_owner_app/helpers/const.dart';

class AddProductCard extends StatelessWidget {
  const AddProductCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: padding,
        height: 200,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              rowItems(fristName: "Item ", secondName: "Thumps up"),
              rowItems(fristName: "Stock left", secondName: "20"),
              rowItems(fristName: "Price", secondName: "40 INR"),
              Row(
                children: <Widget>[
                  text("Add quantity", 16, Colors.black),
                  const Spacer(),
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50)),
                      child: Theme(
                        data: ThemeData(
                            elevatedButtonTheme: ElevatedButtonThemeData(
                                style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                        ))),
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith(
                                        (states) => states
                                                .contains(MaterialState.pressed)
                                            ? appBarColor
                                            : Colors.deepPurple)),
                            onPressed: () {},
                            child: Text("Add")),
                      ))
                ],
              ),
              Row(
                children: <Widget>[
                  const Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: const FaIcon(FontAwesomeIcons.edit)),
                  const Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: const FaIcon(
                        FontAwesomeIcons.trash,
                      ))
                ],
              )
            ]),
      ),
    );
  }

  Widget rowItems({required String fristName, required String secondName}) =>
      Row(
        children: <Widget>[
          text(fristName, 16, Colors.black),
          const Spacer(),
          text(secondName, 16, Colors.black),
        ],
      );
}
