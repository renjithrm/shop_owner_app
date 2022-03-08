// ignore_for_file: prefer_const_constructors, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:showp_owner_app/controller/controller.dart';

import 'package:showp_owner_app/helpers/const.dart';
import 'package:showp_owner_app/view/screens/add_product.dart';
import 'package:showp_owner_app/view/screens/add_prouct_details.dart';
import 'package:showp_owner_app/view/screens/dashboard.dart';
import 'package:showp_owner_app/view/screens/new_order_screen.dart';
import 'package:showp_owner_app/view/screens/report.dart';
import 'package:showp_owner_app/view/widgets/bottom_navbar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final _controller = Get.put(Controller());

  List<Widget> screens = [
    DashBoard(),
    NewOrderScreen(),
    ProductScreen(),
    ReportScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: appTitle,
      ),
      // drawer: const DrawerItem(),
      body: GetBuilder<Controller>(
          id: "home",
          builder: (_) {
            return screens[_controller.index];
          }),
      bottomNavigationBar: GetBuilder<Controller>(
          id: "navBar",
          builder: (_) {
            return BottomNavBar();
          }),
      floatingActionButton: FloatingActionButton(
        child: FaIcon(
          FontAwesomeIcons.plus,
          color: Colors.black,
          size: 18,
        ),
        onPressed: () async {
          await Get.to(AddProductDetails());
        },
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 2, color: Colors.green),
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: Colors.white,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
