import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:showp_owner_app/helpers/const.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
          padding: padding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 100,
                color: Colors.transparent,
              ),
              drawerButton(
                  icon: FontAwesomeIcons.chartLine,
                  title: text(
                    "Dashboard",
                    20,
                    Colors.black,
                  ),
                  onTap: () {}),
              drawerButton(
                  icon: FontAwesomeIcons.plus,
                  title: text(
                    "New orders",
                    20,
                    Colors.black,
                  ),
                  onTap: () {}),
              drawerButton(
                  icon: FontAwesomeIcons.shoppingBasket,
                  title: text(
                    "products",
                    20,
                    Colors.black,
                  ),
                  onTap: () {}),
              drawerButton(
                  icon: FontAwesomeIcons.chartBar,
                  title: text(
                    "report",
                    20,
                    Colors.black,
                  ),
                  onTap: () {}),
              drawerButton(
                  icon: Icons.logout,
                  title: text(
                    "Log out",
                    20,
                    Colors.black,
                  ),
                  onTap: () {}),
            ],
          )),
    );
  }
}
