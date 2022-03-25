// ignore_for_file: prefer_const_constructors, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:showp_owner_app/controller/controller.dart';
import 'package:showp_owner_app/controller/get_all_products_controller.dart';

import 'package:showp_owner_app/helpers/const.dart';
import 'package:showp_owner_app/helpers/enum_class.dart';
import 'package:showp_owner_app/view/screens/product_screen.dart';
import 'package:showp_owner_app/view/screens/add_prouct_details.dart';
import 'package:showp_owner_app/view/screens/dashboard.dart';
import 'package:showp_owner_app/view/screens/new_order_screen.dart';
import 'package:showp_owner_app/view/screens/report.dart';
import 'package:showp_owner_app/view/widgets/bottom_navbar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final _controller = Get.find<Controller>();
  bool isScroling = true;

  final _getProductsController = Get.put(GetProductController());

  List<Widget> screens = [
    DashBoard(),
    NewOrderScreen(),
    ProductScreen(),
    ReportScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: appTitle,
        actions: [
          IconButton(
              onPressed: () async {
                await Navigator.of(context).pushNamed("/settings");
              },
              icon: FaIcon(
                Icons.settings,
              ))
        ],
      ),
      // drawer: const DrawerItem(),
      body: GetBuilder<Controller>(
          id: "home",
          builder: (_) {
            // hide floatingaction button
            return NotificationListener<UserScrollNotification>(
              onNotification: (notification) {
                if (notification.direction == ScrollDirection.reverse) {
                  _controller.isVisible = false;
                  _controller.update(["hideFloat"]);
                } else if (notification.direction == ScrollDirection.forward) {
                  _controller.isVisible = true;
                  _controller.update(["hideFloat"]);
                }
                return true;
              },
              child: screens[_controller.index],
            );
          }),
      bottomNavigationBar: GetBuilder<Controller>(
          id: "navBar",
          builder: (_) {
            return BottomNavBar();
          }),
      floatingActionButton: GetBuilder<Controller>(
        id: "hideFloat",
        builder: (_) {
          return _controller.isVisible
              ? FloatingActionButton.extended(
                  label: Text(
                    "Add product",
                    style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  icon: FaIcon(
                    FontAwesomeIcons.plus,
                    color: Colors.black,
                    size: 18,
                  ),
                  onPressed: () async {
                    await Get.to(AddProductDetails(
                      screen: Screens.add,
                    ));
                  },
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 2, color: Colors.green),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  backgroundColor: Colors.white,
                )
              : Container();
        },
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
