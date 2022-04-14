import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:showp_owner_app/controller/order_controller.dart';

import 'package:showp_owner_app/helpers/const.dart';
import 'package:showp_owner_app/view/screens/accepted_order_screen.dart';
import 'package:showp_owner_app/view/screens/cancelled_order_screen.dart';
import 'package:showp_owner_app/view/screens/pending_order_screen.dart';
import 'package:showp_owner_app/view/widgets/new_order_card.dart';

class NewOrderScreen extends StatefulWidget {
  NewOrderScreen({Key? key}) : super(key: key);

  @override
  State<NewOrderScreen> createState() => _NewOrderScreenState();
}

class _NewOrderScreenState extends State<NewOrderScreen>
    with TickerProviderStateMixin {
  final _getAllOrder = Get.find<OrderController>();

  @override
  Widget build(BuildContext context) {
    final _tabController = TabController(length: 3, vsync: this);
    return Container(
      padding: padding,
      child: Column(
        children: [
          Container(
              height: 50,
              //  color: Colors.red,
              margin: const EdgeInsets.all(10),
              child: TabBar(
                unselectedLabelColor: Colors.grey,
                labelColor: Colors.black,
                labelStyle: GoogleFonts.roboto(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                controller: _tabController,
                tabs: const [
                  Tab(
                    text: "Pending",
                  ),
                  Tab(
                    text: "Accepted",
                  ),
                  Tab(
                    text: "Cancelled",
                  ),
                ],
              )),
          Expanded(
            child: TabBarView(controller: _tabController, children: [
              PendingOrderScreen(),
              AcceptedOrderScreen(),
              CancelledOrderScreen(),
            ]),
          ),
        ],
      ),
    );
  }
}
