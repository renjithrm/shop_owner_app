import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:showp_owner_app/controller/order_controller.dart';
import 'package:showp_owner_app/helpers/const.dart';
import 'package:showp_owner_app/view/widgets/view_product_card.dart';

class OrderProductScreen extends StatelessWidget {
  OrderProductScreen({
    Key? key,
  }) : super(key: key);

  final _getAllOrder = Get.find<OrderController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: ListView.separated(
            itemBuilder: (context, index) {
              return ViewProductCard(
                index: index,
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
            itemCount: _getAllOrder.orderResponse!.products!.length),
      ),
    );
  }
}
