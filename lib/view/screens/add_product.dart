import 'package:flutter/material.dart';
import 'package:showp_owner_app/helpers/const.dart';
import 'package:showp_owner_app/view/widgets/add_product_card.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: ListView.separated(
          itemBuilder: (context, index) => const AddProductCard(),
          separatorBuilder: (context, index) => columDiv(10),
          itemCount: 3),
    );
  }
}
