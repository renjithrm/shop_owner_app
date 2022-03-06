import 'package:flutter/material.dart';
import 'package:showp_owner_app/helpers/const.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: padding,
      child: Column(
        children: <Widget>[],
      ),
    );
  }
}
