import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:showp_owner_app/helpers/api_servics_links.dart';
import 'package:showp_owner_app/helpers/const.dart';
import 'package:showp_owner_app/models/store_add_product_model.dart';
import 'package:showp_owner_app/services/api_service.dart';
import 'package:showp_owner_app/services/shared_preference.dart';

class EditProductController extends GetxController {
  final _apiLink = ApiLink();
  final _apiSetvice = ApiServics();

  Future delectProduct({required String productId}) async {
    String storeId = SaveId.getId();
    var response = await _apiSetvice
        .delectRequst("${_apiLink.STORE_ADD_PRODUCT}/$storeId/$productId");
    if (response == null) return;
    print('response::$response');
  }

  Future editProduct({
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
    required String productId,
  }) async {
    var userData = storeAddProductModelToJson(StoreAddProductModel(
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
    ));

    var response = await _apiSetvice.updateDetails(
      "${_apiLink.STORE_ADD_PRODUCT}/$storeId/$productId",
      userData,
    );
    if (response == null) return;

    if (response != null) {
      var responseMessage = jsonDecode(response);

      Navigator.of(context).pop();
      return responseMessage;
    }
    print(response);
  }
}
