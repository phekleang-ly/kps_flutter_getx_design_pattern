import 'package:get/get.dart';
import 'package:kps_flutter_getx_design_battern/app/data/access_token.dart';

class SplashController extends GetxController {

  _checklogin() async {
    loading.value = true;
    await Future.delayed(Duration(seconds:3));
    loading.value = false;
    if(AccessToken.getToken().isNotEmpty){
      Get.off("/home");
    }else{
      Get.offNamed("/login");
    }
  }
  var loading = true.obs;
  @override
  void onInit() {
    _checklogin();
    super.onInit();
  }
}
