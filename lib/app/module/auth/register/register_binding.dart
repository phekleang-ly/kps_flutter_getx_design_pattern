import 'package:get/get.dart';
import 'package:kps_flutter_getx_design_battern/app/module/auth/register/register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController());
  }
}
