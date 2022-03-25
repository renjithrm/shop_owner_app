import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:showp_owner_app/controller/edit_product_controller.dart';
import 'package:showp_owner_app/controller/get_all_products_controller.dart';
import 'package:showp_owner_app/helpers/const.dart';
import 'package:showp_owner_app/helpers/enum_class.dart';
import 'package:showp_owner_app/view/screens/add_prouct_details.dart';

class ProductCard extends StatelessWidget {
  List<dynamic> products;
  int index;

  ProductCard({Key? key, required this.products, required this.index})
      : super(key: key);

  final _editProduct = Get.put(EditProductController());

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: padding,
        height: 210,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              rowItems(
                  fristName: "Item ",
                  secondName: products[index]['productname'] ?? "error"),
              rowItems(
                  fristName: "Stock left",
                  secondName: products[index]['units'].toString()),
              rowItems(
                  fristName: "Price",
                  secondName: products[index]['amount'].toString()),
              Row(
                children: <Widget>[
                  text("Add quantity", 16, Colors.black),
                  const Spacer(),
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50)),
                      child: Theme(
                        data: ThemeData(
                            elevatedButtonTheme: ElevatedButtonThemeData(
                                style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                        ))),
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith(
                                        (states) => states
                                                .contains(MaterialState.pressed)
                                            ? appBarColor
                                            : Colors.deepPurple)),
                            onPressed: () {},
                            child: const Text("Add")),
                      ))
                ],
              ),
              columDiv(20),
              Row(
                children: <Widget>[
                  const Spacer(),
                  IconButton(
                      onPressed: () {
                        Get.to(AddProductDetails(
                          screen: Screens.edit,
                          product: products,
                          index: index,
                        ));
                      },
                      icon: const FaIcon(FontAwesomeIcons.edit)),
                  const Spacer(),
                  IconButton(
                      onPressed: () async {
                        await _editProduct.delectProduct(
                            productId: products[index]['_id']);
                        Get.find<GetProductController>().update(["getProduct"]);

                        Get.snackbar(products[index]['productname'],
                            "product deleted successfully");
                      },
                      icon: const FaIcon(
                        FontAwesomeIcons.trash,
                      )),
                  const Spacer(),
                ],
              )
            ]),
      ),
    );
  }

  Widget rowItems({required String fristName, required String secondName}) =>
      Row(
        children: <Widget>[
          text(fristName, 16, Colors.black),
          const Spacer(),
          text(secondName, 16, Colors.black),
        ],
      );
}
