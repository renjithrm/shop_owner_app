// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:showp_owner_app/controller/controller.dart';
import 'package:showp_owner_app/helpers/const.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({Key? key}) : super(key: key);
  final _controller = Get.find<Controller>();
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        iconSize: 20,
        unselectedFontSize: 10,
        selectedFontSize: 12,
        selectedItemColor: appBarColor,
        unselectedIconTheme: IconThemeData(
          color: Colors.grey,
        ),
        onTap: (value) {
          _controller.index = value;
          _controller.update([
            "home",
            "navBar",
          ]);
        },
        currentIndex: _controller.index,
        items: [
          BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.chartLine,
              ),
              label: "Dashboard"),
          BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.plus,
              ),
              label: "New orders"),
          BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.shoppingBasket,
              ),
              label: "products"),
          BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.chartBar,
              ),
              label: "report"),
        ]);
  }
}
