import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:showp_owner_app/controller/order_controller.dart';
import 'package:showp_owner_app/helpers/const.dart';
import 'package:showp_owner_app/view/widgets/new_order_card.dart';

class PendingOrderScreen extends StatelessWidget {
  PendingOrderScreen({Key? key}) : super(key: key);
  final _getAllOrder = Get.find<OrderController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GetBuilder<OrderController>(
        id: "order",
        builder: (_) {
          return FutureBuilder(
              future: _getAllOrder.pendingOrders(),
              builder: (context, snapshot) {
                return _getAllOrder.pendingOrderList.isNotEmpty
                    ? ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return NewOrderCard(
                            index: index,
                            dataModel: _getAllOrder.pendingOrderList,
                          );
                        },
                        separatorBuilder: (context, index) => columDiv(10),
                        itemCount: _getAllOrder.pendingOrderList.length,
                      )
                    : Center(
                        child: Text(
                          "No Pending orders",
                          style: GoogleFonts.roboto(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      );
              });
        },
      ),
    );
  }
}
