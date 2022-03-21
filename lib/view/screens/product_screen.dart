import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:showp_owner_app/controller/controller.dart';
import 'package:showp_owner_app/controller/get_all_products_controller.dart';
import 'package:showp_owner_app/helpers/const.dart';
import 'package:showp_owner_app/view/widgets/product_card.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({Key? key}) : super(key: key);
  final _controller = Get.find<Controller>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: GetBuilder<GetProductController>(
        id: "getProduct",
        init: GetProductController(),
        builder: (_getProductController) {
          return FutureBuilder(
              future: _getProductController.getProduct(),
              builder: (context, snapshot) {
                return ListView.separated(
                  itemBuilder: (context, index) => GestureDetector(
                      onTap: () {},
                      child: ProductCard(
                        products: _getProductController.productList,
                        index: index,
                      )),
                  separatorBuilder: (context, index) => columDiv(10),
                  itemCount: _getProductController.productList.length,
                );
              });
        },
      ),
    );
  }
}
