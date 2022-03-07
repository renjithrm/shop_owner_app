import 'package:flutter/material.dart';
import 'package:showp_owner_app/helpers/const.dart';
import 'package:showp_owner_app/view/widgets/new_order_card.dart';

class NewOrderScreen extends StatelessWidget {
  const NewOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: ListView.separated(
        itemBuilder: (context, index) {
          return const NewOrderCard();
        },
        separatorBuilder: (context, index) => columDiv(10),
        itemCount: 10,
      ),
    );
  }
}
