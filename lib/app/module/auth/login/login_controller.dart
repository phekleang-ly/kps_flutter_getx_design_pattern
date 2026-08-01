import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kps_flutter_getx_design_battern/app/data/access_token.dart';

class LoginController extends GetxController {
  var usernameController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;
  var loading = false.obs;
  var isPasswordHidden = true.obs;

  void togglePasswordVisibility(){
    isPasswordHidden.value = !isPasswordHidden.value;
  }


  @override
  void onClose() {
    usernameController.value.dispose();
    passwordController.value.dispose();
    super.onClose();
  }

  Future<void> onLogin() async {
    var username = usernameController.value.text;
    var password = passwordController.value.text;
    if (username.isEmpty) {
      Get.snackbar("Error", "Username is required");
      return;
    }
    if (password.isEmpty) {
      Get.snackbar("Error", "Password is required");
      return;
    }
    loading.value = true;
    await Future.delayed(Duration(seconds: 2));
    loading.value = false;
    AccessToken.saveToken(
      username: username,
      token: "TOKEN",
      refresh: "REFRESH",
    );
    Get.offNamed("/home");
  }
}
