import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:showp_owner_app/controller/order_controller.dart';
import 'package:showp_owner_app/helpers/const.dart';
import 'package:showp_owner_app/view/widgets/new_order_card.dart';

class AcceptedOrderScreen extends StatelessWidget {
  AcceptedOrderScreen({Key? key}) : super(key: key);
  final _getAllOrder = Get.find<OrderController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GetBuilder<OrderController>(
        id: "order",
        builder: (_) {
          return FutureBuilder(
              future: _getAllOrder.acceptedOrder(),
              builder: (context, snapshot) {
                return _getAllOrder.acceptedOrderList.isNotEmpty
                    ? ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return NewOrderCard(
                            index: index,
                            dataModel: _getAllOrder.acceptedOrderList,
                          );
                        },
                        separatorBuilder: (context, index) => columDiv(10),
                        itemCount: _getAllOrder.acceptedOrderList.length,
                      )
                    : Center(
                        child: Text(
                          "No Order To Accepet",
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
