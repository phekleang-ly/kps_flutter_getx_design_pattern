import 'package:get/get.dart';
import 'package:kps_flutter_getx_design_battern/app/module/post/post_controller.dart';

class PostBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => PostController());
  }
}
