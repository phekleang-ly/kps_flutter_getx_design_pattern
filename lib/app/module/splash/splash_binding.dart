import 'package:get/get.dart';
import 'package:kps_flutter_getx_design_battern/app/module/splash/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=> SplashController());
  }

}