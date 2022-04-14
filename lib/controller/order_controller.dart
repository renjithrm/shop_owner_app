import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:showp_owner_app/helpers/api_servics_links.dart';
import 'package:showp_owner_app/models/get_single_order.dart';
import 'package:showp_owner_app/models/user_order_details.dart';
import 'package:showp_owner_app/services/api_service.dart';
import 'package:showp_owner_app/services/shared_preference.dart';

class OrderController extends GetxController {
  final _apiLink = ApiLink();
  final _apiServise = ApiServics();

  final shopeId = SaveId.getId();
  List<UserOrderDetailsModel> responseModel = [];
  GetSingleOrder? orderResponse;

  List<UserOrderDetailsModel> pendingOrderList = [];
  List<UserOrderDetailsModel> acceptedOrderList = [];
  List<UserOrderDetailsModel> cencelledOrderList = [];

  @override
  void onInit() {
    getAllOrder();
    pendingOrders();

    acceptedOrder();
    cancelledOrder();

    super.onInit();
  }

  Future getAllOrder() async {
    // print(shopeId);
    var response =
        await _apiServise.getRespose(_apiLink.GET_ALL_ORDER + shopeId);

    if (response == null) {
      return null;
    } else {
      responseModel = userOrderDetailsModelFromJson(response);
      //  print("all order :: $responseModel");
    }
  }

  Future getSingleOrder({
    required String orderId,
  }) async {
    var response =
        await _apiServise.getRespose(_apiLink.GET_SINGLE_ORDER + orderId);
    if (response == null) {
      return null;
    } else {
      orderResponse = getSingleOrderFromJson(response);
      print(orderResponse);
    }
  }

  Future acceptCancelOrder({
    required String orderId,
    required String status,
  }) async {
    var data = {
      "status": status,
    };
    log(orderId);
    var userData = jsonEncode(data);
    log(userData.toString());
    var response = await _apiServise.updateDetails(
        _apiLink.GET_SINGLE_ORDER + orderId, userData);
    if (response == null) {
      return null;
    } else {
      var jsonResponse = jsonDecode(response);
      //  print("accept order$jsonResponse");
    }
  }

  Future pendingOrders() async {
    var response = await _apiServise.getRespose(
        _apiLink.GET_ALL_ORDER + shopeId + _apiLink.GET_PENDING_ORDER);
    if (response == null) {
      //  print(response);
      return null;
    } else {
      pendingOrderList = userOrderDetailsModelFromJson(response);
      update(["order"]);

      // print("pending order::$pendingOrderList");
    }
  }

  Future acceptedOrder() async {
    var response = await _apiServise.getRespose(
        _apiLink.GET_ALL_ORDER + shopeId + _apiLink.GET_ACCEPTED_ORDER);
    if (response == null) {
      print(response);
      return null;
    } else {
      acceptedOrderList = userOrderDetailsModelFromJson(response);
      update(["order"]);
      //  print("accept order::$acceptedOrderList");
    }
  }

  Future cancelledOrder() async {
    var response = await _apiServise.getRespose(
        _apiLink.GET_ALL_ORDER + shopeId + _apiLink.GET_CANCELLED_ORDER);
    if (response == null) {
      //  print(response);
      return null;
    } else {
      cencelledOrderList = userOrderDetailsModelFromJson(response);
      //  print("accept order::$cencelledOrderList");
      update(["order"]);
    }
  }
}
