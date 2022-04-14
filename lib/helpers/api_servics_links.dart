// ignore_for_file: non_constant_identifier_names

class ApiLink {
  final BASE_URL = "http://13.235.254.168:5000";
  final SIGN_UP_STORE = "/store";
  final STORE_LOGIN = "/store/store-login";
  final STORE_ADD_PRODUCT = "/product";
  final STORE_GET_PRODUCT = "/product/products/";

  //get order in stores

  final GET_ALL_ORDER = "/order/store/";

  //get single order

  final GET_SINGLE_ORDER = "/order/";

  //get pending order
  final GET_PENDING_ORDER = "?status=pending";

  final GET_ACCEPTED_ORDER = "?status=accepted";

  final GET_CANCELLED_ORDER = "?status=cancelled";
}
