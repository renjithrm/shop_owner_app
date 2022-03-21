import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:showp_owner_app/helpers/api_servics_links.dart';
import 'package:showp_owner_app/helpers/const.dart';
import 'package:showp_owner_app/models/store_add_product_model.dart';
import 'package:showp_owner_app/services/api_service.dart';

class AddProductController extends GetxController {
  final _apiLink = ApiLink();
  final _apiSetvice = ApiServics();
  bool isLording = false;

// add product to server
  Future addProduct({
    required String storeId,
    required String prouctName,
    required String unit,
    required int qty,
    required int amount,
    required int experData,
    required String category,
    required int units,
    required String description,
    String? image1,
    String? image2,
    String? image3,
    required BuildContext context,
  }) async {
    print("id $storeId");
    var productDetails = StoreAddProductModel(
      storeid: storeId,
      productname: prouctName,
      unit: unit,
      qty: qty,
      amount: amount,
      exprmonths: experData,
      category: category,
      units: units,
      description: description,
      image1: logo,
      image2: logo,
      image3: logo,
    );
    isLording = true;
    var productDetailsToJson = storeAddProductModelToJson(productDetails);
    print(productDetailsToJson);
    var response = await _apiSetvice.postData(
        _apiLink.STORE_ADD_PRODUCT, productDetailsToJson);

    if (response != null) {
      var responseMessage = jsonDecode(response);
      isLording = false;
      if (responseMessage != null) {
        Navigator.of(context).pop();
        return responseMessage;
      }
    }

    isLording = false;
  }
}
