// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:showp_owner_app/controller/controller.dart';

import 'package:showp_owner_app/helpers/const.dart';
import 'package:showp_owner_app/view/screens/add_product.dart';
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
        onPressed: () {},
        child: Container(
          child: Text("Add Product"),
        ),
        shape: RoundedRectangleBorder(),
      ),
    );
  }
}
