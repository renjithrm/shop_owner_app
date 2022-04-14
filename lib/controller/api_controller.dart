import 'package:get/get.dart';
import 'package:showp_owner_app/controller/controller.dart';
import 'package:showp_owner_app/helpers/api_servics_links.dart';
import 'package:showp_owner_app/helpers/const.dart';
import 'package:showp_owner_app/models/store_login_response.dart';
import 'package:showp_owner_app/models/store_sign_responce.dart';
import 'package:showp_owner_app/models/store_signup_model.dart';
import 'package:showp_owner_app/services/api_service.dart';
import 'package:showp_owner_app/services/shared_preference.dart';

class ApiController extends GetxController {
  final _apiServic = ApiServics();
  final _apiLink = ApiLink();
  final _controller = Get.find<Controller>();
  bool isLoading = false;
  var storeResponseSignIn;
  StoreLoginResponse? loginResponse;
  // sign in store owner
  Future<SignInResponse?>? storeSignIn(
      {required String firstname,
      required String lastname,
      required String storename,
      required String cityname,
      required String address,
      required String email,
      required String phonenumber,
      required String password,
      required double latitude,
      required double logitude}) async {
    isLoading = true;
    var profileImage;
    int phoneNo = int.parse(phonenumber);
    if (_controller.profilePic == null) {
      profileImage = logo;
    } else {
      profileImage = _controller.profilePic;
    }

    final userData = StoreSignUp(
        firstname: firstname,
        lastname: lastname,
        storename: storename,
        city: cityname,
        address: address,
        latitude: latitude,
        longitude: logitude,
        email: email,
        phoneno: phoneNo,
        password: password,
        logo: profileImage);

    var sendChate = storeSignUpToJson(userData);
    print(sendChate);
    var response = await _apiServic.postData(_apiLink.SIGN_UP_STORE, sendChate);
    print(response);
    if (response == null) {
      storeResponseSignIn == null;
      isLoading = false;
      return null;
    } else {
      storeResponseSignIn = signInResponseFromJson(response);
      isLoading = true;
      return storeResponseSignIn;
    }
  }

  Future<StoreLoginResponse?> storeLogin(String email, String password) async {
    isLoading = true;
    var userData = {"EmailOrPhone": email, "Password": password};
    print(userData);
    var response = await _apiServic.postData(_apiLink.STORE_LOGIN, userData);
    if (response != null) {
      loginResponse = storeLoginResponseFromJson(response);
      print(loginResponse);
    } else {
      loginResponse = null;
      isLoading = false;
      return null;
    }
    await SaveId.saveId(loginResponse!.id);
    isLoading = false;
    return loginResponse;
  }
}
