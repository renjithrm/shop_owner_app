// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:showp_owner_app/controller/notification_controller.dart';
import 'package:showp_owner_app/controller/order_controller.dart';
import 'package:showp_owner_app/helpers/const.dart';
import 'package:showp_owner_app/models/user_order_details.dart';
import 'package:showp_owner_app/view/screens/view_order_product.dart';

class NewOrderCard extends StatelessWidget {
  int index;
  List<UserOrderDetailsModel> dataModel;
  NewOrderCard({Key? key, required this.index, required this.dataModel})
      : super(key: key);
  final _getAllOrder = Get.find<OrderController>();
  final _NotificationController = Get.put(NotificationController());

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
                text(
                  dataModel[index].userDetails?.username ?? "name",
                  16,
                  Colors.black,
                ),
              ],
            ),
            // Row(
            //   children: <Widget>[
            //     text("Delivery partner", 16, Colors.black),
            //     Spacer(),
            //     text("Kadin Herwitz", 16, Colors.black),
            //   ],
            // ),
            Row(
              children: <Widget>[
                text("Address", 16, Colors.black),
                Spacer(),
                text(dataModel[index].address ?? "address", 16, Colors.black),
              ],
            ),
            Row(
              children: <Widget>[
                text("Price", 16, Colors.black),
                Spacer(),
                text(dataModel[index].totalamount.toString(), 16, Colors.black),
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
                        onPressed: () async {
                          await _getAllOrder.getSingleOrder(
                              orderId: dataModel[index].id ?? "");

                          await Get.to(OrderProductScreen());
                        },
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
                    onPressed: () async {
                      await _getAllOrder.acceptCancelOrder(
                          orderId: dataModel[index].id ?? "",
                          status: "accepted");
                      _NotificationController.sentNotification(
                          userId: dataModel[index].userid ?? "error",
                          title: "G-Shop",
                          body: "Your Order Accepted by shope owner");
                    },
                    child: Text("Accept")),
                Spacer(),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith(
                            (states) => states.contains(MaterialState.pressed)
                                ? appBarColor
                                : Color(0xffDC3227))),
                    onPressed: () async {
                      await _getAllOrder.acceptCancelOrder(
                          orderId: dataModel[index].id ?? "",
                          status: "cancelled");
                      _NotificationController.sentNotification(
                          userId: dataModel[index].userid ?? "error",
                          title: "G-Shop",
                          body: "Your Order cancelled by shope owner");
                    },
                    child: Text("Decline"))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
