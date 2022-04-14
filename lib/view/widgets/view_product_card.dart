import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:showp_owner_app/controller/order_controller.dart';

class ViewProductCard extends StatelessWidget {
  int index;
  ViewProductCard({Key? key, required this.index}) : super(key: key);
  final _getAllOrder = Get.find<OrderController>();

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Card(
      child: Container(
        height: _size.height * 0.15,
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Image(
              width: _size.width * 0.2,
              image: NetworkImage(_getAllOrder
                      .orderResponse?.products![index].image ??
                  "https://i.pinimg.com/564x/09/5b/81/095b81683fdab4c1504c5b9c0ccb1dc5.jpg"),
              fit: BoxFit.cover,
            ),
            const SizedBox(
              width: 19.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Flexible(
                    child: Text(
                      _getAllOrder
                              .orderResponse?.products![index].productname ??
                          "error",
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                      "Total item :${_getAllOrder.orderResponse?.products![index].noofitems} ",
                      style: GoogleFonts.roboto(
                        color: Colors.grey,
                        fontSize: 17,
                      )),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Price : ${_getAllOrder.orderResponse?.products![index].producttotal} Rs",
                    style: GoogleFonts.roboto(
                      color: Colors.grey,
                      fontSize: 17,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
