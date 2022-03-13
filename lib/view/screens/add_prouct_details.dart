// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:showp_owner_app/controller/controller.dart';
import 'package:showp_owner_app/helpers/const.dart';

class AddProductDetails extends StatelessWidget {
  AddProductDetails({Key? key}) : super(key: key);
  final products = TextEditingController();
  final category = TextEditingController();
  final _controller = Get.find<Controller>();
  final amount = TextEditingController();
  final itemPrice = TextEditingController();
  final expiryDate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<String> items = [
      "Kg",
      "gm",
      "amount",
      "ml",
    ];
    List<String> itemDate = [
      "month",
      "year",
      "week",
      "day",
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
        child: SingleChildScrollView(
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
                  padding: EdgeInsets.all(7),
                  width: 100,
                  height: 40,
                  child: GetBuilder<Controller>(
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
                ),
                SizedBox(
                  width: 80,
                  height: 40,
                  child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: amount,
                      validator: (value) => null,
                      decoration: InputDecoration(
                          label: Text(
                            "Amount",
                            style: GoogleFonts.roboto(fontSize: 13),
                          ),
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
                )),
            Row(
              children: <Widget>[
                Container(
                  width: 150,
                  height: 50,
                  child: TextFormField(
                      controller: expiryDate,
                      validator: (value) => null,
                      decoration: InputDecoration(
                        label: Text("Expiry date"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10)),
                        ),
                      )),
                ),
                Container(
                  width: 120,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  padding: EdgeInsets.all(7),
                  child: GetBuilder<Controller>(
                    id: "drop2",
                    builder: (_) {
                      return DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                            value: _controller.itemDate,
                            items: itemDate
                                .map((item) => DropdownMenuItem(
                                      child: Text(item),
                                      value: item,
                                    ))
                                .toList(),
                            onChanged: (value) {
                              _controller.itemDate = value ??= "month";
                              _controller.update(["drop2"]);
                            }),
                      );
                    },
                  ),
                )
              ],
            ),
            columDiv(20),
            TextFormField(
              decoration: InputDecoration(
                  label: Text("product description"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
              maxLines: 5,
            ),
            columDiv(20),
            Row(
              children: [
                GetBuilder<Controller>(
                  id: "image",
                  builder: (_) {
                    return _controller.imageList.length <= 2
                        ? imageAddButton()
                        : Container();
                  },
                ),
                SizedBox(
                  width: 10,
                ),
                GetBuilder<Controller>(
                  id: "image",
                  builder: (_) {
                    if (_controller.imageList.isNotEmpty) {
                      return Container(
                        height: 80,
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            File file = _controller.imageList[index].image;
                            return Image.file(
                              file,
                              width: 80,
                              height: 80,
                            );
                            // return Container(
                            //   color: Colors.red,
                            //   width: 20,
                            //   height: 80,
                            // );
                          },
                          separatorBuilder: (context, index) => SizedBox(
                            width: 10,
                          ),
                          itemCount: _controller.imageList.length,
                        ),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ],
            ),
            columDiv(20),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith(
                          (states) => states.contains(MaterialState.pressed)
                              ? appBarColor
                              : Colors.white),
                      side: MaterialStateProperty.resolveWith((states) =>
                          states.contains(MaterialState.pressed)
                              ? BorderSide(color: appBarColor)
                              : BorderSide(color: Color(0xff22DAC9), width: 2)),
                      shape: MaterialStateProperty.resolveWith((states) =>
                          states.contains(MaterialState.pressed)
                              ? RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))
                              : RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)))),
                  onPressed: () {},
                  child: Text(
                    "Add Product",
                    style: GoogleFonts.roboto(
                      color: Color(0xff22DAC9),
                      fontSize: 20,
                    ),
                  )),
            ),
          ]),
        ),
      ),
    );
  }

  //image add button
  Widget imageAddButton() => GestureDetector(
        onTap: () => showBottomSheets(onTapCamera: () {
          _controller.pickImage(ImageSource.camera);
          Get.back();
        }, onTapGallery: () {
          _controller.pickImage(ImageSource.gallery);
          Get.back();
        }),
        child: Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
              ),
              borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: FaIcon(FontAwesomeIcons.plus),
          ),
        ),
      );
}
