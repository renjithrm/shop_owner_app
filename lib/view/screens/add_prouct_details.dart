// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:showp_owner_app/controller/controller.dart';
import 'package:showp_owner_app/helpers/const.dart';

class AddProductDetails extends StatelessWidget {
  AddProductDetails({Key? key}) : super(key: key);
  final products = TextEditingController();
  final category = TextEditingController();
  final _controller = Get.find<Controller>();
  final amound = TextEditingController();
  final itemPrice = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<String> items = [
      "Kg",
      "gm",
    ];
    return Scaffold(
      // backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text(
          "Add Product",
          style: GoogleFonts.roboto(),
        ),
      ),
      body: Padding(
        padding: padding,
        child: Column(children: <Widget>[
          forms(
            "Product name",
            products,
            (value) => null,
          ),
          forms(
            "Category",
            category,
            (value) => null,
          ),
          Row(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                ),
                width: 80,
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GetBuilder<Controller>(
                      id: "drop",
                      builder: (_) {
                        return DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                                value: _controller.value,
                                items: items
                                    .map((item) => DropdownMenuItem(
                                          child: Text(item),
                                          value: item,
                                        ))
                                    .toList(),
                                onChanged: (value) {
                                  _controller.value = value ??= "kg";
                                  _controller.update(["drop"]);
                                }));
                      },
                    ),
                  ],
                ),
              ),
              Container(
                width: 80,
                height: 40,
                child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    )))),
              ),
            ],
          ),
          columDiv(10),
          forms(
              "price",
              itemPrice,
              (value) => null,
              FaIcon(
                FontAwesomeIcons.rupeeSign,
                size: 18,
              ))
        ]),
      ),
    );
  }
}

// class painter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = Paint()
//       ..color = Colors.white
//       ..style = PaintingStyle.fill;
//     Path path = Path()..moveTo(0, 2);
//     path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
//     // path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
//     // path.arcToPoint(Offset(size.width * 0.60, 20),
//     //     radius: const Radius.circular(10.0), clockwise: false);
//     // path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
//     path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);
//     path.lineTo(size.width, size.height);
//     path.lineTo(0, size.height);
//     path.close();
//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return false;
//   }
// }

// Container(
          //   padding: EdgeInsets.only(left: 10),
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(30),
          //     color: Colors.grey[300],
          //   ),
          //   child: TextFormField(
          //     decoration: InputDecoration(
          //         border: InputBorder.none,
          //         hintText: "price",
          //         prefix: FaIcon(
          //           FontAwesomeIcons.rupeeSign,
          //           color: Colors.green,
          //         )),
          //   ),
          // ),