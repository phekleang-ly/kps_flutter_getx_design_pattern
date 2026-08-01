import 'package:get/get.dart';
import 'package:kps_flutter_getx_design_battern/app/data/access_token.dart';

class HomeController extends GetxController {

  var loading = false.obs;
  onLogout()async{
    loading.value = true;
    AccessToken.removeToken();
    await Future.delayed(Duration(seconds: 2));
    loading.value = false;
    Get.offNamed("/login");
  }

}