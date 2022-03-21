import 'package:get/get.dart';
import 'package:showp_owner_app/helpers/api_servics_links.dart';
import 'package:showp_owner_app/models/all_product_model.dart';
import 'package:showp_owner_app/services/api_service.dart';
import 'package:showp_owner_app/services/shared_preference.dart';

class GetProductController extends GetxController {
  final _apiLink = ApiLink();
  final _apiSetvice = ApiServics();
  var productList = <Product>[];
  final id = SaveId.getId();
  @override
  void onInit() {
    getProduct();
    super.onInit();
  }

  Future getProduct() async {
    var response =
        await _apiSetvice.getRespose(_apiLink.STORE_GET_PRODUCT + id);
    if (response == null) return;
    var getProductModel = allProductsFromJson(response);

    productList = List.from(getProductModel.products!.reversed);
    print(productList.length);
  }
}
