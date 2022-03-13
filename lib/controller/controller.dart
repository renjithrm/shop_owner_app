import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:showp_owner_app/models/image_model.dart';

class Controller extends GetxController {
  int index = 0;
  String value = "Kg";
  String itemDate = "month";
  bool isloginOrSignin = true;
  bool isVisible = true;
  final _picker = ImagePicker();
  File? image;
  var imageList = <ImageModel>[];
  toggleScreens() {
    isloginOrSignin = !isloginOrSignin;
    update(["toggle"]);
  }

  //pick image
  pickImage(ImageSource source) async {
    var img = await _picker.pickImage(source: source);
    if (img == null) return;
    image = File(img.path);
    imageList.add(ImageModel(image: image!));
    print(imageList);
    update(["image"]);
  }
}
