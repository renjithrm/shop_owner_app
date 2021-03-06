import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:showp_owner_app/controller/controller.dart';
import 'package:showp_owner_app/services/shared_preference.dart';
import 'package:showp_owner_app/view/authentication/wraper.dart';
import 'package:showp_owner_app/view/home_screen.dart';
import 'package:showp_owner_app/view/screens/settings_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SaveId.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final _controller = Get.put(Controller());
  final id = SaveId.getId();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print(id);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routes: {
        "/switch": (BuildContext ctx) => WarperAuth(),
        "/home": (BuildContext ctx) => HomeScreen(),
        "/settings": (BuildContext ctx) => const SettingScreen(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: id == null ? "/switch" : "/home",
    );
  }
}
