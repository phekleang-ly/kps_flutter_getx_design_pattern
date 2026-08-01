import 'package:get/get.dart';
import 'package:kps_flutter_getx_design_battern/app/module/home/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(()=> HomeController());
  }

}