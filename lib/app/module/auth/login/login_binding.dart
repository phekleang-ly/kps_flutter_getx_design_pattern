import 'package:get/get.dart';
import 'package:kps_flutter_getx_design_battern/app/module/auth/login/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(()=> LoginController());
  }

}