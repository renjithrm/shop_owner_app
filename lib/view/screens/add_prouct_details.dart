// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:showp_owner_app/controller/add_product_controller.dart';
import 'package:showp_owner_app/controller/controller.dart';
import 'package:showp_owner_app/controller/edit_product_controller.dart';
import 'package:showp_owner_app/controller/get_all_products_controller.dart';
import 'package:showp_owner_app/helpers/const.dart';
import 'package:showp_owner_app/helpers/enum_class.dart';
import 'package:showp_owner_app/services/shared_preference.dart';

class AddProductDetails extends StatefulWidget {
  Enum screen;
  List? product;
  int? index;
  AddProductDetails({
    Key? key,
    required this.screen,
    this.product,
    this.index,
  }) : super(key: key);

  @override
  State<AddProductDetails> createState() => _AddProductDetailsState();
}

class _AddProductDetailsState extends State<AddProductDetails> {
  final products = TextEditingController();

  final category = TextEditingController();

  final _controller = Get.find<Controller>();

  final quantity = TextEditingController();

  final itemPrice = TextEditingController();

  final expiryDate = TextEditingController();
  final units = TextEditingController();
  final productDiscription = TextEditingController();

  final amount = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final _addProductController = Get.put(AddProductController());

  List<String> itemsCategorys = [
    "snaks and chips",
    "soft drinks",
    "cosmetics",
    "ice cream",
    "drink"
  ];

  @override
  void initState() {
    if (widget.screen == Screens.edit) {
      products.text = widget.product![widget.index!]['productname'] ?? "";
      category.text = widget.product![widget.index!]['category'] ?? "";
      quantity.text = widget.product![widget.index!]['qty'].toString();
      itemPrice.text = widget.product![widget.index!]['amount'].toString();
      expiryDate.text = widget.product![widget.index!]['exprmonths'].toString();
      units.text = widget.product![widget.index!]['units'].toString();
      productDiscription.text = widget.product![widget.index!]['description'];
      _controller.itemscategorys = widget.product![widget.index!]['category'];
    }
    super.initState();
  }

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
          child: Form(
            key: _formKey,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                    Widget>[
              forms(
                "Product name",
                products,
                validator: requriedValidation,
              ),
              categoryDropDown(),
              columDiv(10),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20)),
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
              columDiv(10),
              SizedBox(
                width: 180,
                height: 70,
                child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: quantity,
                    validator: requriedValidation,
                    decoration: InputDecoration(
                        label: Text(
                          "quantity",
                          style: GoogleFonts.roboto(fontSize: 13),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)))),
              ),
              Container(
                width: 180,
                child: forms("Units", units,
                    validator: requriedValidation,
                    keyboardType: TextInputType.number),
              ),
              forms("price", itemPrice,
                  prefix: FaIcon(
                    FontAwesomeIcons.rupeeSign,
                    size: 18,
                  ),
                  validator: requriedValidation,
                  keyboardType: TextInputType.number),
              SizedBox(
                width: 150,
                height: 70,
                child: TextFormField(
                    controller: expiryDate,
                    validator: requriedValidation,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      label: Text("Expiry date"),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    )),
              ),
              columDiv(20),
              TextFormField(
                controller: productDiscription,
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
              columDiv(30),
              Container(
                alignment: Alignment.center,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blueAccent,
                        spreadRadius: 4,
                        blurRadius: 3,
                      ),
                    ],
                  ),
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith(
                              (states) => states.contains(MaterialState.pressed)
                                  ? Colors.blueAccent
                                  : Colors.white),
                          side: MaterialStateProperty.resolveWith((states) =>
                              states.contains(MaterialState.pressed)
                                  ? BorderSide(color: appBarColor)
                                  : BorderSide(
                                      color: Color.fromARGB(255, 7, 241, 218),
                                      width: 2)),
                          shape: MaterialStateProperty.resolveWith((states) => states
                                  .contains(MaterialState.pressed)
                              ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                              : RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)))),
                      onPressed: () async {
                        if (_formKey.currentState!.validate() &&
                            _controller.imageList.isNotEmpty) {
                          var id = SaveId.getId();
                          var image1 = await _controller
                              .convertImage(_controller.imageList[0].image);
                          // print("image1::$image1");
                          var image2 = await _controller
                              .convertImage(_controller.imageList[1].image);
                          // print("image2::$image2");
                          var image3 = await _controller
                              .convertImage(_controller.imageList[2].image);
                          // print("image3::$image3");

                          if (widget.screen == Screens.add) {
                            var result = await _addProductController.addProduct(
                                storeId: id,
                                prouctName: products.text,
                                unit: _controller.value,
                                qty: int.parse(quantity.text),
                                amount: int.parse(itemPrice.text),
                                experData: int.parse(expiryDate.text),
                                category: _controller.itemscategorys!,
                                units: int.parse(units.text),
                                description: productDiscription.text,
                                image1: logo,
                                image2: logo,
                                image3: logo,
                                context: context);
                            _controller.imageList.clear();
                            Get.snackbar(products.text, result["msg"]);
                            Get.find<GetProductController>()
                                .update(["getProduct"]);
                          } else {
                            var result = await Get.find<EditProductController>()
                                .editProduct(
                                    storeId: id,
                                    prouctName: products.text,
                                    unit: _controller.value,
                                    qty: int.parse(quantity.text),
                                    amount: int.parse(itemPrice.text),
                                    experData: int.parse(expiryDate.text),
                                    category: _controller.itemscategorys!,
                                    units: int.parse(units.text),
                                    description: productDiscription.text,
                                    image1: image1,
                                    image2: image2,
                                    image3: image3,
                                    context: context,
                                    productId: widget.product![widget.index!]
                                        ['_id']);
                            Get.snackbar(products.text, result["message"]);
                            print(result);
                            Get.find<GetProductController>()
                                .update(["getProduct"]);

                            print(result);
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Fill all boxes")));
                        }
                      },
                      child: Text(
                        "Add Product",
                        style: GoogleFonts.roboto(
                          color: Color(0xff22DAC9),
                          fontSize: 20,
                        ),
                      )),
                ),
              ),
              columDiv(30),
            ]),
          ),
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

  Widget categoryDropDown() {
    return GetBuilder<Controller>(
      id: "category",
      builder: (_) {
        return Container(
          width: 300,
          padding: EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(20)),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
                value: _controller.itemscategorys,
                hint: Text("Add categorys"),
                items: itemsCategorys
                    .map((item) => DropdownMenuItem(
                          child: Text(item),
                          value: item,
                        ))
                    .toList(),
                onChanged: (value) {
                  _controller.itemscategorys = value ??= "add category";
                  _controller.update(["category"]);
                }),
          ),
        );
      },
    );
  }
}
