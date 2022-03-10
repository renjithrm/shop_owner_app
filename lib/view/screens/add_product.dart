import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:showp_owner_app/controller/controller.dart';
import 'package:showp_owner_app/helpers/const.dart';
import 'package:showp_owner_app/view/widgets/add_product_card.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({Key? key}) : super(key: key);
  final _controller = Get.find<Controller>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: ListView.separated(
        itemBuilder: (context, index) =>
            GestureDetector(onTap: () {}, child: const AddProductCard()),
        separatorBuilder: (context, index) => columDiv(10),
        itemCount: 7,
      ),
    );
  }
}
